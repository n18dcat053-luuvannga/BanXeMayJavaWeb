package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



import ptithcm.entity.Brand;
import ptithcm.entity.Product;

@Transactional
@Controller
@RequestMapping("/admin/product/")
public class ProductController {
	@Autowired // Autowired cho phép Spring tự động tìm kiếm và tiêm các bean tương ứng mà chúng ta đã khai báo trong class
	SessionFactory factory; 
	@Autowired              
	ServletContext context;
	
	//index
	@RequestMapping("index") // quan li danh muc xe (sua,xoa,xemtrước)
	public String index(ModelMap model, HttpServletRequest req, HttpServletResponse response) {
		HttpSession admin_session = req.getSession();
		admin_session.getAttribute("admin");
		if(admin_session.getAttribute("admin") == null) {
			return "redirect:/home/login.htm";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("products", list); 
		model.addAttribute("brands", getBrands());
		return "product/index";
	}
	
	
	// chống XSS
	public static boolean isContainSpecialWord(String str) {
        Pattern VALID_INPUT_REGEX = Pattern.compile("[$&+,:;=\\\\\\\\?@#|/'<>.^*()%!]",
                Pattern.CASE_INSENSITIVE);
        Matcher matcher = VALID_INPUT_REGEX.matcher(str);
        if(matcher.find()) {
        	return true;
        }else {
        	return false;
        }                       
    }
//	 if(check isContainSpecialWord==true thong bao loi

	
	
	
	//insert
	@RequestMapping(value="insert", method=RequestMethod.GET) 
	public String insert(ModelMap model, HttpServletRequest req, HttpServletResponse response) {
		HttpSession admin_session = req.getSession();
		admin_session.getAttribute("admin");
		if(admin_session.getAttribute("admin") == null) {
			return "redirect:/home/login.htm";
		}
		model.addAttribute("product", new Product()); //Phương thức action tao Product chua thong tin trong model với tên là product.
		return "product/insert";
	}
	
   
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("product") Product product,
								@RequestParam("photo") MultipartFile photo, BindingResult errors) {
		if(photo.isEmpty()) { 
			
			model.addAttribute("message_image", "Vui lòng chọn hình ảnh !");
		}
		if(product.getId().trim().length() == 0) {  
			errors.rejectValue("id", "product", "Vui lòng nhập mã sản phẩm !");
		}
		if(isContainSpecialWord(product.getId())==true) {
			errors.rejectValue("id", "product", "Vui lòng không nhập các ký tự đặc biệt tại ở mã sản phẩm");
		}
		if(product.getName().trim().length() == 0) {
			errors.rejectValue("name", "product", "Vui lòng nhập tên sản phẩm !");
		}
		if(product.getType() == null) {
			errors.rejectValue("type", "product", "Vui lòng chọn loại xe !");
		}
		if(product.getPrice() == null) {
			errors.rejectValue("price", "product", "Vui lòng nhập giá tiền !");
		}
		if(product.getWeight() == null) {
			errors.rejectValue("weight", "product", "Vui lòng nhập khối lượng xe !");
		}
		if(product.getLength() == null) {
			errors.rejectValue("length", "product", "Vui lòng nhập chiều dài !");
		}
		if(product.getWidth() == null) {
			errors.rejectValue("width", "product", "Vui lòng nhập chiều rộng !");
		}
		if(product.getHeight() == null) {
			errors.rejectValue("height", "product", "Vui lòng nhập chiều cao !");
		}
		if(product.getEnginecapacity() == null) {
			errors.rejectValue("enginecapacity", "product", "Vui lòng nhập dung tích động cơ !");
		}
		if(product.getTankcapacity() == null) {
			errors.rejectValue("tankcapacity", "product", "Vui lòng nhập dung tích bình xăng !");
		}
		if(product.getEnginetype().trim().length() == 0) {
			errors.rejectValue("enginetype", "product", "Vui lòng nhập loại động cơ !");
		}
		if(product.getAmount() == null) {
			errors.rejectValue("amount", "product", "Vui lòng nhập số lượng !");
		}
		if(errors.hasErrors()) {
			/*model.addAttribute("message", "Vui lòng kiểm tra lỗi !");*/
		}
		else {
			List<Product> kiemtra = getProducts();
			for(Product check : kiemtra) { 
				if(product.getId().trim().equals(check.getId().trim())) {
					errors.rejectValue("id", "product", "Mã sản phẩm đã tồn tại!");
					return "product/insert";
				}
			}
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				String photoPath = context.getRealPath("./images/" + photo.getOriginalFilename()); // truyen duong dan ao de luu anh
				photo.transferTo(new File(photoPath)); // chuyen file den duong dan moi
				product.setImage(photo.getOriginalFilename());
				session.save(product);
				t.commit(); 
				model.addAttribute("message", "Thêm mới thành công !");
				return "redirect:/admin/product/index.htm";
			}
			catch(Exception e) {
				t.rollback();
				model.addAttribute("message", "Thêm mới thất bại !");
			}
			finally {
				session.close();
			}
		}
		return "product/insert";
	}
	
		//load danh sách hãng xe ra combobox
		@ModelAttribute("brands") // đổ dữ liệu của list Brands vào listcontrol combobox
		public List<Brand> getBrands() {
			Session session = factory.getCurrentSession();
			String hql = "FROM Brand";
			Query query = session.createQuery(hql);
			List<Brand> list = query.list();
			return list;
		}
		
		//update
		@SuppressWarnings("unchecked")
		public List<Product> getProducts() {
			Session session = factory.getCurrentSession();
			String hql = "FROM Product";
			Query query = session.createQuery(hql);
			List<Product> list = query.list();
			return list;
		}
		
		@RequestMapping("edit/{id}")
		public String edit(ModelMap model, @PathVariable("id") String id, HttpServletRequest req, HttpServletResponse response) {
			HttpSession admin_session = req.getSession();
			admin_session.getAttribute("admin");
			if(admin_session.getAttribute("admin") == null) {
				return "redirect:/home/login.htm";
			}
			System.out.println(id);
			Session session = factory.getCurrentSession();
			Product product = (Product) session.get(Product.class, id);
			
			model.addAttribute("product", product);
			model.addAttribute("products", getProducts());
			return "product/update";
		}
		
		@RequestMapping("update")
		public String update(ModelMap model, @ModelAttribute("product") Product product,
				   							@RequestParam("photo") MultipartFile photo, BindingResult errors, HttpServletRequest req) {
			// 
			HttpSession admin_session = req.getSession();
			admin_session.getAttribute("admin");
			if(admin_session.getAttribute("admin") == null) {
				return "redirect:/home/login.htm";
			}
			if(photo.isEmpty()) {
				if(product.getName().trim().length() == 0) {
					errors.rejectValue("name", "product", "Vui lòng nhập tên sản phẩm !");
				}
				if(product.getType() == null) {
					errors.rejectValue("type", "product", "Vui lòng chọn loại xe !");
				}
				if(product.getPrice() == null) {
					errors.rejectValue("price", "product", "Vui lòng nhập giá tiền !");
				}
				if(product.getWeight() == null) {
					errors.rejectValue("weight", "product", "Vui lòng nhập khối lượng xe !");
				}
				if(product.getLength() == null) {
					errors.rejectValue("length", "product", "Vui lòng nhập chiều dài !");
				}
				if(product.getWidth() == null) {
					errors.rejectValue("width", "product", "Vui lòng nhập chiều rộng !");
				}
				if(product.getHeight() == null) {
					errors.rejectValue("height", "product", "Vui lòng nhập chiều cao !");
				}
				if(product.getEnginecapacity() == null) {
					errors.rejectValue("enginecapacity", "product", "Vui lòng nhập dung tích động cơ !");
				}
				if(product.getTankcapacity() == null) {
					errors.rejectValue("tankcapacity", "product", "Vui lòng nhập dung tích bình xăng !");
				}
				if(product.getEnginetype().trim().length() == 0) {
					errors.rejectValue("enginetype", "product", "Vui lòng nhập loại động cơ !");
				}
				if(product.getAmount() == null) {
					errors.rejectValue("amount", "product", "Vui lòng nhập số lượng !");
				}
				if(errors.hasErrors()) {
					/*model.addAttribute("message", "Vui lòng kiểm tra lỗi !");*/
				}   
				else { 
					String oldImage = product.getImage();
					Session session = factory.openSession();
					Transaction t = session.beginTransaction();
					try {
						product.setImage(oldImage);
						session.update(product);
						t.commit();
						model.addAttribute("message", "Cập nhật thành công1111 !"); // neu update ma k chinh sua anh
						return "redirect:/admin/product/index.htm";
					}
					catch(Exception e) {
						t.rollback();
						model.addAttribute("message", "Cập nhật thất bại !");
					}
					finally {
						session.close();
					}
				}
				return "product/update";
			}
			else {
				if(product.getName().trim().length() == 0) {
					errors.rejectValue("name", "product", "Vui lòng nhập tên sản phẩm !"); // rejectValue() cho phép bổ sung thông báo lỗi cho thuộc tính name của bean product
				}
				if(product.getType() == null) {
					errors.rejectValue("type", "product", "Vui lòng chọn loại xe !");
				}
				if(product.getPrice() == null) {
					errors.rejectValue("price", "product", "Vui lòng nhập giá tiền !");
				}
				if(product.getWeight() == null) {
					errors.rejectValue("weight", "product", "Vui lòng nhập khối lượng xe !");
				}
				if(product.getLength() == null) {
					errors.rejectValue("length", "product", "Vui lòng nhập chiều dài !");
				}
				if(product.getWidth() == null) {
					errors.rejectValue("width", "product", "Vui lòng nhập chiều rộng !"); 
				}
				if(product.getHeight() == null) {
					errors.rejectValue("height", "product", "Vui lòng nhập chiều cao !");
				}
				if(product.getEnginecapacity() == null) {
					errors.rejectValue("enginecapacity", "product", "Vui lòng nhập dung tích động cơ !");
				}
				if(product.getTankcapacity() == null) {
					errors.rejectValue("tankcapacity", "product", "Vui lòng nhập dung tích bình xăng !");
				}
				if(product.getEnginetype().trim().length() == 0) {
					errors.rejectValue("enginetype", "product", "Vui lòng nhập loại động cơ !");
				}
				if(product.getAmount() == null) {
					errors.rejectValue("amount", "product", "Vui lòng nhập số lượng !");
				}
				if(errors.hasErrors()) {
					/*model.addAttribute("message", "Vui lòng kiểm tra lỗi !");*/ 
				}
				else {
					Session session = factory.openSession();
					Transaction t = session.beginTransaction();
					try {
						String photoPath = context.getRealPath("./images/" + photo.getOriginalFilename());  // getRealPath để lấy đường dẫn thực từ đường dẫn ảo images la duong dan ao de luu 
						photo.transferTo(new File(photoPath)); // Để làm việc với đường dẫn của website nên cần tiêm ServletContext sau đó sử dụng phương thức getRealPath() để lấy đường dẫn thực từ đường dẫn ảo (tính từ website).
						product.setImage(photo.getOriginalFilename());
						session.update(product);
						t.commit();
						model.addAttribute("message", "Cập nhật thành công11111112222222 !"); // neu update ma them anh khac thi dung ham nay
						return "redirect:/admin/product/index.htm";
					}
					catch(Exception e) {
						t.rollback();
						model.addAttribute("message", "Cập nhật thất bại !");
					}
					finally {
						session.close();
					}
				}
			}
			return "product/update";
		}
		
		//delete
		@RequestMapping("delete/{id}")
		public String delete(ModelMap model, @PathVariable("id") String id, HttpServletRequest req, HttpServletResponse response) {
			HttpSession admin_session = req.getSession();
			admin_session.getAttribute("admin");
			if(admin_session.getAttribute("admin") == null) {
				return "redirect:/home/login.htm";
			} 
			System.out.println(id);
			Session session = factory.getCurrentSession();
			Product product = (Product) session.get(Product.class, id);
			
			model.addAttribute("product", product);
			model.addAttribute("products", getProducts());
			return "product/delete";
		}
		
		@RequestMapping("delete")
		public String delete(ModelMap model, @ModelAttribute("product") Product product, HttpServletRequest req) {
			HttpSession admin_session = req.getSession();
			admin_session.getAttribute("admin");
			if(admin_session.getAttribute("admin") == null) {
				return "redirect:/home/login.htm";
			}
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.delete(product);
				t.commit();
				model.addAttribute("message", "Xóa thành công !"); // hien thi tren link http...
				return "redirect:/admin/product/index.htm";
			}
			catch(Exception e) {
				t.rollback();
				model.addAttribute("message", "Xóa thất bại !");
			}
			finally {
				session.close();
			}
			return "product/delete";
		}
		
		//hiển thị thông tin sản phẩm
		@RequestMapping("{id}")
		public String show(ModelMap model, @PathVariable("id") String id, HttpServletRequest req, HttpServletResponse response) {
			HttpSession admin_session = req.getSession();
			admin_session.getAttribute("admin");
			if(admin_session.getAttribute("admin") == null) {
				return "redirect:/home/login.htm";
			}
			System.out.println(id);
			Session session = factory.getCurrentSession();
			Product product = (Product) session.get(Product.class, id); 
			// lay id de xem chi tiet 1san pham 
			
			model.addAttribute("product", product); //sang ben jsp goi product roi hien show thong tin muc xem truoc san pham cua admin
			model.addAttribute("products", getProducts());
			return "product/show";
		}
}

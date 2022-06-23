package ptithcm.bean;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailer")
public class Mailer {
	@Autowired
	JavaMailSender mailer;
	
	public void send(String from, String to, String subject, String body) {
		try {
			
			// Bean Validation cung cấp nhiều công cụ kiểm soát  bên cạnh @NotBlank. 
			// kiem tra loi bang anotation bang cach goi 
			//Chỉ cần bổ sung @Validated trước bean nhận dữ liệu form 
			//thì các thuộc tính của bean sẽ được kiểm lỗi theo các luật đã nạp vào các trường bean 
			/*
			 * @NotBlank: kiểm trường name rỗng 
			 * @NotNull: kiểm trường mark và major null
			 * @DecimalMin(), DecimalMax(): kiểm khoảng số thực
			 */
			// cach cua chung ta la kiem tra loi bang tay
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8"); // tao 1 mail moi 
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body, true);
			
			mailer.send(mail);
		}
		catch(Exception ex) {
			throw new RuntimeException(ex);
		}
	}
}

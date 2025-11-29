package com.happy_wallet.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication; // Fixed: Correct import
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.happy_wallet.Bean.BankUserBean;
import com.happy_wallet.Dao.RegisterDAO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final String senderEmail = "happywalletbank@gmail.com";
	private static final String senderPassword = "sdpy xvre gmxy heaz"; // Fixed: camelCase

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		BankUserBean bean = new BankUserBean();
		bean.setFullName(req.getParameter("fname"));
		bean.setEmail(req.getParameter("email"));
		bean.setPhoneNumber(req.getParameter("phoneNo"));
		bean.setUsername(req.getParameter("uname"));
		String pass = req.getParameter("pass");
		bean.setPassword(pass);
		String confiPass = req.getParameter("confirm-pass");

		if (!pass.equals(confiPass)) {
			res.getWriter().println("Password and Confirm Password do not match.");
			req.setAttribute("msg", "Password and Confirm Password do not match.");
			res.setContentType("text/html");
			req.getRequestDispatcher("Register.html").include(req, res);
			return;
		}

		try {
			PrintWriter pw = res.getWriter();
			int count = new RegisterDAO().registerData(bean);
			if (count != 0) {
				// Send email AFTER successful registration
				sendRegisterEmail(bean.getEmail(), bean.getFullName()); // Fixed: Call the method

				pw.println("<h1>Register Successful</h1>");
				req.setAttribute("msg", "Register Successful");
				req.setAttribute("BankUserBean", bean);
				req.getRequestDispatcher("bankLogin.jsp").forward(req, res);
			} else {
				pw.print("<h2>Registration failed</h2>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void sendRegisterEmail(String toEmail, String fullName) {
		String host = "smtp.gmail.com";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(senderEmail, senderPassword); // Fixed: consistent naming
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(senderEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject("Registration Successful - Happy Wallet App");
			message.setText("Dear " + fullName
					+ ",\n\nThank you for registering with our Bank Application.\n\nRegards,\nBank Team");

			Transport.send(message);
			System.out.println("Registration email sent to: " + toEmail);
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("Email sending failed: " + e.getMessage());
		}
	}
}

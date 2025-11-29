package com.happy_wallet.Service;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.happy_wallet.Dao.TransferMoneyDAO;

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {

	// Email configuration - Update with your SMTP details
	private static final String SMTP_HOST = "smtp.gmail.com";
	private static final String SMTP_PORT = "587";
	private static final String EMAIL_USERNAME = "happywalletbank@gmail.com";
	private static final String EMAIL_PASSWORD = "sdpy xvre gmxy heaz";

	private void sendEmail(String toEmail, String subject, String body) {
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", SMTP_HOST);
		props.put("mail.smtp.port", SMTP_PORT);

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(EMAIL_USERNAME));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject(subject);
			message.setText(body);
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("LoginPhone") == null) {
			res.sendRedirect("bankLogin.jsp");
			return;
		}

		String senderPhone = (String) session.getAttribute("LoginPhone");
		String receiverPhone = req.getParameter("phone");
		String amountStr = req.getParameter("amount");
		String description = req.getParameter("desc") != null ? req.getParameter("desc") : "Transfer";

		double amount = 0;
		try {
			amount = Double.parseDouble(amountStr);
			if (amount <= 0) {
				req.setAttribute("msg", "Please enter a valid amount");
				req.getRequestDispatcher("UserHome.jsp").forward(req, res);
				return;
			} else if (senderPhone.equals(receiverPhone)) {
				req.setAttribute("msg", "You cannot transfer to your own account");
				req.getRequestDispatcher("UserHome.jsp").forward(req, res);
				return;
			}
		} catch (NumberFormatException e) {
			req.setAttribute("msg", "Invalid amount format");
			req.getRequestDispatcher("UserHome.jsp").forward(req, res);
			return;
		}
		try {
			TransferMoneyDAO transferDao = new TransferMoneyDAO();
			int result = transferDao.transferingMoney(amount, receiverPhone, session);

			if (result == 1) {
				// Send emails
				String senderEmail = transferDao.getUserEmail(senderPhone);
				String receiverEmail = transferDao.getUserEmail(receiverPhone);

				if (senderEmail != null) {
					String senderBody = String.format(
							"Dear Customer,\n\n₹%.2f has been debited from your account for transfer to %s.\n"
									+ "Description: %s\n\nTransaction successful!\n\nRegards,\nBank Team",
							amount, receiverPhone, description);
					sendEmail(senderEmail, "Transaction Alert - Money Debited", senderBody);
				}

				if (receiverEmail != null) {
					String receiverBody = String.format(
							"Dear Customer,\n\n₹%.2f has been credited to your account from %s.\n"
									+ "Description: %s\n\nTransaction successful!\n\nRegards,\nBank Team",
							amount, senderPhone, description);
					sendEmail(receiverEmail, "Transaction Alert - Money Credited", receiverBody);
				}
				req.setAttribute("msg", "Transaction Successfully");
				req.setAttribute("amount", amount);
				req.getRequestDispatcher("UserHome.jsp").forward(req, res); // SINGLE FORWARD

			} else {
				req.setAttribute("msg", "Transfer failed! Check balance or receiver details.");
				req.getRequestDispatcher("UserHome.jsp").forward(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
package com.happy_wallet.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.happy_wallet.Bean.BankUserBean;
import com.happy_wallet.Dao.LoginDAO;

@WebServlet("/log")
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Validate login
		System.out.println("inside login");
		BankUserBean bean;
		try {
			bean = new LoginDAO().checkLogin(req.getParameter("uname"), req.getParameter("pass"));
		
		if (bean == null) {
			System.out.println("bean is null");
			req.setAttribute("msg", "Invalid credentials, please try again.");
			RequestDispatcher rd = req.getRequestDispatcher("bankLogin.jsp");
			rd.forward(req, res);
		} else {
			// Set up session
			System.out.println("session setup proccess");
			HttpSession session = req.getSession(true);
			session.setAttribute("BankUserBean", bean);
			session.setAttribute("LoginPhone", bean.getPhoneNumber());
			req.removeAttribute("msg");
			req.removeAttribute("success");
			RequestDispatcher rd = req.getRequestDispatcher("UserHome.jsp");
			rd.forward(req, res);
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
}

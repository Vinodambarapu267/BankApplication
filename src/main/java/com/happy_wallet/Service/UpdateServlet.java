package com.happy_wallet.Service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.happy_wallet.Bean.BankUserBean;
import com.happy_wallet.Dao.UpdateProfileDAO;
import com.happy_wallet.connectionpool.DbConnect;

@WebServlet("/updateProfile")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException {
        
        res.setContentType("text/html");
        HttpSession session = req.getSession(false);
        
        if (session == null) {
            res.getWriter().println("Session expired. Please login again.");
            return;
        }
        
        // Get form parameters
        String uname = req.getParameter("uname");
        String email = req.getParameter("mail");
        String fname = req.getParameter("fname");
        String phone = req.getParameter("phone");
        String pass = req.getParameter("pass");
        long accnum = Long.parseLong(req.getParameter("accnum"));
        Double balance = Double.parseDouble(req.getParameter("balance"));
        String confiPass = req.getParameter("confi-pass");
        
        // Validate password match
        if (pass == null || confiPass == null || !pass.equals(confiPass)) {
            req.setAttribute("msg", "Password and Confirm Password do not match.");
            req.setAttribute("error", true);
            req.getRequestDispatcher("EditProfile.jsp").include(req, res);
            return;
        }
        
        // Create and populate bean
        BankUserBean bean = new BankUserBean();
        bean.setUsername(uname);
        bean.setEmail(email);
        bean.setFullName(fname);
        bean.setPhoneNumber(phone);
        bean.setBalance(balance);
        bean.setPassword(pass);
        bean.setAccountNumber(accnum);// Only set if password change is intended
        
        String loginPhone = (String) session.getAttribute("LoginPhone");
        
        try {
            UpdateProfileDAO dao = new UpdateProfileDAO();
            int count = dao.updateData(bean, loginPhone);
            
            if (count > 0) {
                // Update session with new data
                session.setAttribute("LoginPhone", phone);
                session.setAttribute("BankUserBean", bean);
            
                req.setAttribute("msg", "Profile updated successfully!");
                req.getRequestDispatcher("UserHome.jsp").forward(req, res);
            } else {
                req.setAttribute("msg", "No profile updated. Check your phone number.");
                req.setAttribute("error", true);
                req.getRequestDispatcher("EditProfile.jsp").include(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "Update failed: " + e.getMessage());
            req.setAttribute("error", true);
            req.getRequestDispatcher("EditProfile.jsp").include(req, res);
        }
    }
    public static double getBalance(long accno)
	{
		double bal=0;
		Connection conn=DbConnect.connect();
		try {
			PreparedStatement ps = conn.prepareStatement("select BALANCE from bank_users where ACCOUNT_NUMBER =? ");
			ps.setLong(1, accno);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				bal=rs.getDouble(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bal;
	}
}

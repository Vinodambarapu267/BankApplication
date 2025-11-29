package com.happy_wallet.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.happy_wallet.Bean.BankUserBean;
import com.happy_wallet.connectionpool.DbConnect;

public class LoginDAO {
	public BankUserBean checkLogin(String uname, String pass) throws Exception{
		BankUserBean ub = null;
		try {

			Connection con = DbConnect.connect();
			PreparedStatement pstmt = con
					.prepareStatement("select * from bank_users where USERNAME=? and  PASSWORD=? ");
			pstmt.setString(2, pass);
			pstmt.setString(1, uname);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				ub = new BankUserBean();
				ub.setUsername(rs.getString("USERNAME"));
				ub.setFullName(rs.getString("FULL_NAME"));
				ub.setPhoneNumber(rs.getString("PHONE_NUMBER"));
				ub.setAccountNumber(rs.getLong("ACCOUNT_NUMBER"));
				ub.setBalance(rs.getDouble("BALANCE"));
				ub.setCreated_date(rs.getDate("CREATED_AT"));
				;
				;
				ub.setUsername(rs.getString("USERNAME"));
				ub.setPassword(rs.getString("PASSWORD"));
				ub.setEmail(rs.getString("EMAIL"));
			}
		}

		catch (Exception e) {
			throw e;
		}
		return ub;
	}
}

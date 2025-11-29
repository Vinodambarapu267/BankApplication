package com.happy_wallet.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Random;

import com.happy_wallet.Bean.BankUserBean;
import com.happy_wallet.connectionpool.DbConnect;

public class RegisterDAO {

	public int registerData(BankUserBean bb) throws SQLException {
		int rowCount = 0;
		Connection con = DbConnect.connect();
		long user_id = RegisterDAO.userid();
		LocalDate localDate = LocalDate.now();
		java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
		long accNum = RegisterDAO.accNum();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement("insert into bank_users values (?,?,?,?,?,?,?,?,?)");
			pstmt.setLong(1, user_id);
			pstmt.setString(2, bb.getFullName());
			pstmt.setString(3, bb.getEmail());
			pstmt.setString(4, bb.getUsername());
			pstmt.setString(5, bb.getPassword());
			pstmt.setString(6, bb.getPhoneNumber());
			pstmt.setLong(7, accNum);
			pstmt.setDouble(8, 15000.00);
			pstmt.setDate(9, sqlDate);
			rowCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw e;
		}
		return rowCount;
	
	}

	public static long userid() {
		Random random = new Random();

		// Generate a random 10-digit number as a long
		long min = 1000000000L; // smallest 10-digit number
		long max = 9999999999L; // largest 10-digit number

		long randomNumber = min + (long) (random.nextDouble() * (max - min));

		return randomNumber;
	}

	public static long accNum() {
		Random random = new Random();
		long min = 1000000000000L; // smallest 10-digit number
		long max = 9999999999999L;
		long randNum = min + (long) (random.nextDouble() * (max - min));
		return randNum;

	}

}

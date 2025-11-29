package com.happy_wallet.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.happy_wallet.Bean.TransactionBean;
import com.happy_wallet.connectionpool.DbConnect;

public class Bank_TransactionDAO {

	public ArrayList<TransactionBean> getTransactionList(HttpSession session) throws SQLException {
		ArrayList<TransactionBean> al = new ArrayList<TransactionBean>();
		Connection con = DbConnect.connect();
		String senderAccountPhone = (String) session.getAttribute("LoginPhone");
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM bank_transactions WHERE SENDER_ACCOUNT = ?");

			ps.setString(1, senderAccountPhone);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TransactionBean t = new TransactionBean();
				t.setTxnId(rs.getInt("TXN_ID")); // Assuming column name
				t.setSenderAccount(rs.getString("SENDER_ACCOUNT"));
				t.setReceiverAccount(rs.getString("RECEIVER_ACCOUNT"));
				t.setAmount(rs.getDouble("AMOUNT"));
				t.setTxnType(rs.getString("TXN_TYPE"));
				t.setDescription(rs.getString("DESCRIPTION"));
				t.setTxnDate(rs.getDate("TXN_DATE"));
				t.setStatus(rs.getString("STATUS"));
				al.add(t);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
		return al;

	}
	public static double getBalance(long accno) throws SQLException
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
			throw e;
		}
		return bal;
	}
}

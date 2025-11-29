package com.happy_wallet.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.happy_wallet.Bean.BankUserBean;
import com.happy_wallet.connectionpool.DbConnect;

public class UpdateProfileDAO {
    private static final String UPDATE_QUERY = 
        "UPDATE Bank_users SET FULL_NAME=?, EMAIL=?, USERNAME=?, PHONE_NUMBER=? WHERE PHONE_NUMBER=?";
    
    public int updateData(BankUserBean ub, String loginPhone) throws SQLException {
        if (ub == null || loginPhone == null || loginPhone.trim().isEmpty()) {
            return 0;
        }
        
        try (Connection con = DbConnect.connect();
             PreparedStatement pstmt = con.prepareStatement(UPDATE_QUERY)) {
            
            pstmt.setString(1, ub.getFullName() != null ? ub.getFullName() : "");
            pstmt.setString(2, ub.getEmail() != null ? ub.getEmail() : "");
            pstmt.setString(3, ub.getUsername() != null ? ub.getUsername() : "");
            pstmt.setString(4, ub.getPhoneNumber() != null ? ub.getPhoneNumber() : loginPhone);
            pstmt.setString(5, loginPhone);
            
            return pstmt.executeUpdate();
        }
    }
}

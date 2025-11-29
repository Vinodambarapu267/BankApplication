package com.happy_wallet.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.happy_wallet.connectionpool.DbConnect;

public class TransferMoneyDAO {

    public int transferingMoney(double amount, String reciverPhone, HttpSession session) throws Exception {
        int rowCount = 0;
        String senderAccountPhone = (String) session.getAttribute("LoginPhone");

        String selectBalanceSQL = "SELECT balance FROM bank_users WHERE PHONE_NUMBER=?";
        String debitSQL = "UPDATE bank_users SET balance = balance - ? WHERE PHONE_NUMBER=?";
        String creditSQL = "UPDATE bank_users SET balance = balance + ? WHERE PHONE_NUMBER=?";
        String insertTxnSQL = "INSERT INTO BANK_TRANSACTIONS (SENDER_ACCOUNT, RECEIVER_ACCOUNT, AMOUNT, TXN_TYPE, DESCRIPTION, STATUS, TXN_DATE) VALUES (?, ?, ?, ?, ?, ?, SYSDATE)";

        try (Connection con = DbConnect.connect();
             PreparedStatement selectpst = con.prepareStatement(selectBalanceSQL)) {

            // Start transaction
            con.setAutoCommit(false);

            // Check sender's balance
            selectpst.setString(1, senderAccountPhone);
            try (ResultSet rs = selectpst.executeQuery()) {
                if (!rs.next() || rs.getDouble("balance") < amount) {
                    insertFailedTransaction(con, senderAccountPhone, reciverPhone, amount,
                            "Insufficient funds or sender not found");
                    return 0;
                }
            }

            // Check receiver exists
            try (PreparedStatement checkReceiver = con.prepareStatement(selectBalanceSQL)) {
                checkReceiver.setString(1, reciverPhone);
                try (ResultSet receiverRS = checkReceiver.executeQuery()) {
                    if (!receiverRS.next()) {
                        insertFailedTransaction(con, senderAccountPhone, reciverPhone, amount, "Receiver not found");
                        return 0;
                    }
                }
            }

            // Perform debit and credit
            try (PreparedStatement debitStmt = con.prepareStatement(debitSQL);
                 PreparedStatement creditStmt = con.prepareStatement(creditSQL);
                 PreparedStatement txnStmt = con.prepareStatement(insertTxnSQL)) {

                // Debit sender
                debitStmt.setDouble(1, amount);
                debitStmt.setString(2, senderAccountPhone);
                int debit = debitStmt.executeUpdate();
                if (debit <= 0)
                    throw new SQLException("Failed to debit account");

                // Credit receiver
                creditStmt.setDouble(1, amount);
                creditStmt.setString(2, reciverPhone);
                int credit = creditStmt.executeUpdate();
                if (credit <= 0)
                    throw new SQLException("Failed to credit account");

                // Log credit transaction
                txnStmt.setString(1, senderAccountPhone);
                txnStmt.setString(2, reciverPhone);
                txnStmt.setDouble(3, amount);
                txnStmt.setString(4, "Credit");
                txnStmt.setString(5, "Money received from " + senderAccountPhone);
                txnStmt.setString(6, "SUCCESS");
                txnStmt.executeUpdate();

                // Log debit transaction
                txnStmt.setString(1, senderAccountPhone);
                txnStmt.setString(2, reciverPhone);
                txnStmt.setDouble(3, amount);
                txnStmt.setString(4, "Debit");
                txnStmt.setString(5, "Money sent to " + reciverPhone);
                txnStmt.setString(6, "SUCCESS");
                txnStmt.executeUpdate();

                con.commit();
                rowCount = 1;
            } catch (Exception e) {
                con.rollback();
                insertFailedTransaction(con, senderAccountPhone, reciverPhone, amount, e.getMessage());
                throw e;
            }
        } catch (Exception e) {
            throw e;// Always log errors!
        }
        return rowCount;
    }

    private void insertFailedTransaction(Connection conn, String sender, String receiver, double amount, String reason)
            throws SQLException {
        String sql = "INSERT INTO BANK_TRANSACTIONS "
                + "(SENDER_ACCOUNT, RECEIVER_ACCOUNT, AMOUNT, TXN_TYPE, DESCRIPTION, STATUS, TXN_DATE) "
                + "VALUES (?, ?, ?, 'TRANSFER', ?, 'FAILED', SYSDATE)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, sender);
            ps.setString(2, receiver);
            ps.setDouble(3, amount);
            ps.setString(4, "Transaction Failed: " + reason);
            ps.executeUpdate();
        }
    }

    // New method to fetch user email by phone number
    public String getUserEmail(String phoneNumber) throws SQLException {
        String email = null;
        String emailQuery = "SELECT email FROM bank_users WHERE PHONE_NUMBER=?";
        try (Connection con = DbConnect.connect();
             PreparedStatement pst = con.prepareStatement(emailQuery)) {
            pst.setString(1, phoneNumber);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    email = rs.getString("email");
                }
            }
        } catch (SQLException e) {
           throw e;
        }
        return email;
    }
}

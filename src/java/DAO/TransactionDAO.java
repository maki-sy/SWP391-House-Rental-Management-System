/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Transaction;

/**
 *
 * @author DTS
 */
public class TransactionDAO extends DBContext {

    /**
     * Get all Transaction object in the DB
     *
     * @return List of Transaction objects, or list of size == 0 if there is no
     * transaction.
     */
    public List<Transaction> getAllTransactions() {
        List<Transaction> transactions = new ArrayList<>();
        String SQL = "SELECT * FROM Transactions;";
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            ResultSet rs = preStmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                double amount = rs.getDouble(2);
                int sender = rs.getInt(3);
                int receiver = rs.getInt(4);
                Transaction.Type type = Transaction.Type.valueOf(rs.getString(5));
                String date = rs.getString(6);
                int postID = rs.getInt(7);

                transactions.add(new Transaction(id, amount, sender, receiver, type, date, postID));
            }

        } catch (SQLException ex) {
            System.out.println("getAllTransactions() reports " + ex.getMessage());
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return transactions;
    }

    /**
     *
     * @param id
     * @return
     */
    public Transaction getTransactionByID(int id) {
        Transaction transaction = null;
        String SQL = "SELECT * FROM Transactions WHERE id = ?;";
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, id);
            ResultSet rs = preStmt.executeQuery();

            double amount = rs.getDouble(2);
            int sender = rs.getInt(3);
            int receiver = rs.getInt(4);
            Transaction.Type type = Transaction.Type.valueOf(rs.getString(5));
            String date = rs.getString(6);
            int postID = rs.getInt(7);

            transaction = new Transaction(id, amount, sender, receiver, type, date, postID);
        } catch (SQLException ex) {
            System.out.println("getTransactionByID() reports " + ex.getMessage());
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return transaction;
    }
    
    public int addTransaction(double amount, int payerId, int receiverId, 
            String type, String transactionDate, int postId) {
        String sql = "INSERT INTO [dbo].[Transactions]\n"
                + "           ([amount]\n"
                + "           ,[payer_id]\n"
                + "           ,[receiver_id]\n"
                + "           ,[type]\n"
                + "           ,[transaction_date]\n"
                + "           ,[post_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";

        try ( PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setDouble(1, amount);
            preparedStatement.setInt(2, payerId);
            preparedStatement.setInt(3, receiverId);
            preparedStatement.setString(4, type);
            preparedStatement.setString(5, transactionDate);
            preparedStatement.setInt(6, postId);
            return preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
            
//
//    public int removeTransaction(int id) {
//
//    }
//
//    public int updateTransaction(Transaction transaction) {
//
//    }
//
//    public List<Transaction> getTransactionsByType(Transaction.Type type) {
//
//    }
}

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
     * Get transactions by TransactionID
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

    /**
     * Get all transactions related to person has ID (both sender's id and
     * receives id).Note that in case of Post's id == null in the database
     * (because JDBC getInt() does not return Integer but int), postID = -1
     * instead
     *
     * @param id
     * @return
     */
    public List<Transaction> getTransactionPersonID(int id) {
        List<Transaction> transactions = new ArrayList<>();

        String SQL = "SELECT * FROM [Transactions] WHERE payer_id = ? OR receiver_id = ?;";
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, id);
            preStmt.setInt(2, id);

            ResultSet rs = preStmt.executeQuery();

            while (rs.next()) {
                double amount = rs.getDouble(2);
                int payerID = rs.getInt(3);
                int receiverID = rs.getInt(4);
                Transaction.Type type = Transaction.Type.valueOf(rs.getString(5));
                String date = rs.getString(6);

                // Check for null of int
                int post = rs.getInt(7);
                post = rs.wasNull() ? -1 : post;

                Transaction t = new Transaction(id, amount, payerID, receiverID, type, date, post);
                transactions.add(t);
            }
        } catch (SQLException ex) {
            System.out.println("getTransactionPersonID() reports " + ex.getMessage());
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return transactions;
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

    /**
     * Add transaction record to the database. Note that landlord_id = -1 will
     * be set to NULL in the database (since JDBC does not have setInteger)
     *
     * @param transaction
     * @return
     */
    public int addTransaction(Transaction transaction) {
        int added = 0;
        String SQL = "INSERT INTO [Transactions]\n"
                + "           ([amount]\n"
                + "           ,[payer_id]\n"
                + "           ,[receiver_id]\n"
                + "           ,[type]\n"
                + "           ,[transaction_date]\n"
                + "           ,[post_id])\n"
                + "     VALUES (?,?,?,?,?,?);";
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setDouble(1, transaction.getPointAmount());
            preStmt.setInt(2, transaction.getSenderID());
            preStmt.setInt(3, transaction.getReceiverID());
            preStmt.setString(4, transaction.getType().name());
            preStmt.setString(5, transaction.getTransactionDate());
            int postID = transaction.getPostID();
            if (postID == -1) {
                preStmt.setNull(6, java.sql.Types.INTEGER);
            } else {
                preStmt.setInt(6, transaction.getPostID());
            }

            added = preStmt.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("addTransaction() reports " + ex.getMessage());
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return added;
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

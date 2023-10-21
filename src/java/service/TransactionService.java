/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.TransactionDAO;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.Transaction;

/**
 *
 * @author DTS
 */
public class TransactionService {

    private static final TransactionDAO T_DAO = new TransactionDAO();

    /**
     * Get all Transaction object in the DB
     *
     * @return List of Transaction objects, or list of size == 0 if there is no
     * transaction.
     */
    public List<Transaction> getAllTransactions() {
        return T_DAO.getAllTransactions();
    }

    /**
     * Get all transactions related to person has ID (both sender's id and
     * receives id)
     *
     * @param id
     * @return
     */
    public List<Transaction> getTransactionsPersonID(int id) {
        return T_DAO.getTransactionPersonID(id);
    }

    /**
     *
     * @param transaction
     */
    public void addTransaction(Transaction transaction) {
        T_DAO.addTransaction(transaction);
    }

    /**
     * Automatically add transaction to database, with type = DEPOSIT,
     * transactionDate = current time to landlord. post's id will be set to null
     * (since this is not paying for post).
     *
     * @param landlordID landlord's id to receive the point
     * @param amount amount of point
     */
    public void addDepositTransaction(int landlordID, int amount) throws IllegalArgumentException {
        if (amount <= 0) {
            throw new IllegalArgumentException("Amount of point must be greater than 0");
        }

        LocalDate currentDate = LocalDate.now();

        // default bank account is user's id = 1
        Transaction t = new Transaction(amount, 1, landlordID, Transaction.Type.DEPOSIT, currentDate.toString(), -1);
        T_DAO.addTransaction(t);
    }
}

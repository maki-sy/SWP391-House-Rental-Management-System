/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.TransactionDAO;
import java.sql.PreparedStatement;
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
     * @return
     */
    public void addTransaction(Transaction transaction) {
        T_DAO.addTransaction(transaction);
    }
}

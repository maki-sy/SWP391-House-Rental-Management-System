/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import DAO.TransactionDAO;
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
    public List<Transaction> getAllTransactions(){
        return T_DAO.getAllTransactions();
    }
}

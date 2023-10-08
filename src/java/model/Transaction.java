/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DTS
 */
public class Transaction {

    public enum Type {
        DEPOSIT,
        PAY
    }
    private int id;
    private double pointAmount;
    private int senderID;
    private int receiverID;
    private Type type;
    private String transactionDate;
    private int postID;

    public Transaction(int id, double pointAmount, int senderID, int receiverID, Type type, String transactionDate, int postID) {
        this.id = id;
        this.pointAmount = pointAmount;
        this.senderID = senderID;
        this.receiverID = receiverID;
        this.type = type;
        this.transactionDate = transactionDate;
        this.postID = postID;
    }

    public int getId() {
        return id;
    }

    public double getPointAmount() {
        return pointAmount;
    }

    public void setPointAmount(double pointAmount) {
        this.pointAmount = pointAmount;
    }

    public int getSenderID() {
        return senderID;
    }

    public void setSenderID(int senderID) {
        this.senderID = senderID;
    }

    public int getReceiverID() {
        return receiverID;
    }

    public void setReceiverID(int receiverID) {
        this.receiverID = receiverID;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(String transactionDate) {
        this.transactionDate = transactionDate;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

}

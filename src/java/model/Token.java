/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DTS
 */
public class Token {

    public enum TokenType {
        CONFIRMATION,
        FORGOTPWD,
        CHANGEPWD
    }
    private int id;
    private int userID;
    private String email;
    private String token;
    private String expireDate;
    private TokenType type;

    public Token(int id, int userID, String email, String token, String expireDate, TokenType type) {
        this.id = id;
        this.userID = userID;
        this.email = email;
        this.token = token;
        this.expireDate = expireDate;
        this.type = type;
    }

    public Token(int userID, String email, String token, String expireDate, TokenType type) {
        this.userID = userID;
        this.email = email;
        this.token = token;
        this.expireDate = expireDate;
        this.type = type;
    }

    public int getUserID() {
        return userID;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getToken() {
        return token;
    }

    public String getExpireDate() {
        return expireDate;
    }

    public TokenType getType() {
        return type;
    }

}

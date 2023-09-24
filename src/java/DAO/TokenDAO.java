/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Token;

/**
 *
 * @author DTS
 */
public class TokenDAO extends DBContext {

    /**
     *
     * @param email
     * @param type
     * @return
     */
    public Token getTokenByEmailAndType(String email, Token.TokenType type) {
        String sqlCommand = "SELECT * FROM Token WHERE email = ? AND type = ?;";
        Token token = null;

        try {
            PreparedStatement preStatement = connect.prepareStatement(sqlCommand);
            preStatement.setString(1, email);
            preStatement.setString(2, type.name());
            ResultSet rs = preStatement.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String tokenStr = rs.getString(3);
                String expireDate = rs.getString(4);

                token = new Token(id, email, tokenStr, expireDate, type);
            }

        } catch (SQLException ex) {
            System.out.println("getTokenByEmailAndType() reports " + ex.getMessage());
            Logger.getLogger(TokenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return token;
    }

    /**
     *
     * @param token
     * @return
     */
    public int addToken(Token token) {
        String sqlCommand = "INSERT INTO [Token]\n"
                + "           ([email]\n"
                + "           ,[token]\n"
                + "           ,[expired_date]\n"
                + "           ,[type])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?)";
        int added = 0;
        try {
            PreparedStatement preStatement = connect.prepareStatement(sqlCommand);
            preStatement.setString(1, token.getEmail());
            preStatement.setString(2, token.getToken());
            preStatement.setString(3, token.getExpireDate());
            preStatement.setString(4, token.getType().name());

            added = preStatement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("addToken() reports " + ex.getMessage());
            Logger.getLogger(TokenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return added;
    }

    /**
     * Get email corresponding to token string
     *
     * @param token token string
     * @return email corresponding to token string in DB
     */
    public String getEmail(String token) {
        String sqlCommand = "SELECT email FROM Token WHERE token = ?;";
        try {
            PreparedStatement preStatement = connect.prepareStatement(sqlCommand);
            preStatement.setString(1, token);

            ResultSet rs = preStatement.executeQuery();

            // token is a random string, so it should be unique
            if (rs.next()) {
                String email = rs.getString(1);
                return email;
            }
        } catch (SQLException ex) {
            System.out.println("getToken() reports " + ex.getMessage());
            Logger.getLogger(TokenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    /**
     * Get token object by raw string token
     * @param token
     * @return 
     */
    public Token getToken(String token) {
        String sqlCommand = "SELECT * FROM Token WHERE token = ?;";
        Token t = null;
        try {
            PreparedStatement pstmt = connect.prepareStatement(sqlCommand);
            pstmt.setString(1, token);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                int id = rs.getInt(1);
                String email = rs.getString(2);
                String expiredDate = rs.getTimestamp(4).toString();
                System.out.println("Time in String: " + expiredDate);
                Token.TokenType type = Token.TokenType.valueOf(rs.getString(5));
                
                t = new Token(id, email, token, expiredDate, type);
            }
        } catch (SQLException ex) {
            System.out.println("getToken() reports " + ex.getMessage());
            Logger.getLogger(TokenDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }
}

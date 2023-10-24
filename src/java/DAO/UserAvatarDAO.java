/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PostRental;
import model.UserAvatar;
import model.Users;

/**
 *
 * @author Tuấn Anh
 */
public class UserAvatarDAO extends DBContext {

    public UserAvatar getAvatarByUserID(int id) {
        String sqlCommand = "SELECT [user_id],[avatar_url]\n"
                + "  FROM [dbo].[UserAvatar]\n"
                + "  WHERE [user_id] = " + id;
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {

                int uid = rs.getInt(1);
                String url = rs.getString(2);
                return new UserAvatar(uid, url);
            }
        } catch (SQLException ex) {
            System.out.println("Error");
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new UserAvatar();

    }

    public boolean updateAvatar(int id, String avatarURL) {
        String sql = "UPDATE UserAvatar SET avatar_url = ? WHERE user_id = ?";

        try ( PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setString(1, avatarURL);
            preparedStatement.setInt(2, id);
            int rowsInserted = preparedStatement.executeUpdate();
            return (rowsInserted > 0);
        } catch (SQLException ex) {
            Logger.getLogger(UserAvatarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}

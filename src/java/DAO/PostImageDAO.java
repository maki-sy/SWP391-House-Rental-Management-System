package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PostImageDAO extends DBContext {

    public int addPostImage(int postId, String imgUrl, String imgType) {
        String sql = "INSERT INTO [dbo].[Post_Image]\n"
                + "           ([post_id]\n"
                + "           ,[img_url]\n"
                + "           ,[img_type])\n"
                + "     VALUES\n"
                + "		(?, ?, ?);";

        try ( PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setInt(1, postId);
            preparedStatement.setString(2, imgUrl);
            preparedStatement.setString(3, imgType);
            return preparedStatement.executeUpdate();
        } catch (SQLException ex) {
        }
        return 0;
    }
    public String getImageThumbailsByPostID(int postID) {
        String url ="";
        try {
            String sql = "select img_url from Post_Image where img_type = 'thumbnails' and post_id =" + postID;
            PreparedStatement stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                url = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return url;
    }

}

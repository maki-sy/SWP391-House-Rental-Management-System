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
        String url = "";
        String sql = "select img_url from Post_Image where img_type = 'thumbnails' and post_id = ?;";
        try (PreparedStatement preStmt = connect.prepareStatement(sql)){
            preStmt.setInt(1, postID);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                url = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return url;
    }

    public int deletePostImageByPostId(int postId) {
        String sql = "DELETE FROM [dbo].[Post_Image]\n"
                + "      WHERE [Post_Image].post_id = ?";
        try ( PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setInt(1, postId);
            return preparedStatement.executeUpdate();
        } catch (SQLException ex) {
        }
        return 0;
    }

    public static void main(String[] args) {
        PostImageDAO PostImageDAO = new PostImageDAO();
        System.out.println(PostImageDAO.addPostImage(1, "C:\\swp-img", "thumbnail"));
    }

}

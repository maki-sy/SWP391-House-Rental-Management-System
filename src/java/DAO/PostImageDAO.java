package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PostImage;

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
        String url = null;
        String sql = "select img_url from Post_Image where img_type = 'thumbnails' and post_id = ?";
        try ( PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setInt(1, postID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                url = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return url;
    }

    /**
     *
     * @param postId
     * @return
     * @creater: tienPV
     */
    public ArrayList<String> getPostImageURLByPostId(int postId) {
        ArrayList<String> url = new ArrayList<>();
        String sql = "SELECT [img_url]\n"
                + "  FROM [dbo].[Post_Image]\n"
                + "  WHERE post_id = " + postId;
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                url.add(rs.getString(1));
            }
        } catch (SQLException ex) {

        }

        return url;
    }

    public ArrayList<PostImage> getImageThumbails() {
        ArrayList<PostImage> list = new ArrayList<>();
        String sqlCommand = "SELECT [id]\n"
                + "      ,[post_id]\n"
                + "      ,[img_url]\n"
                + "      ,[img_type]\n"
                + "  FROM [dbo].[Post_Image]";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                int post_id = rs.getInt(2);
                String img_url = rs.getString(3);
                String img_type = rs.getString(4);
                PostImage po = new PostImage(id, post_id, img_url, img_type);
                list.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int deletePostImageByPostId(int postId) {
        String sql = "DELETE FROM [dbo].[Post_Image]\n"
                + "      WHERE [post_id] = ?";
        try ( PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setInt(1, postId);
            return preparedStatement.executeUpdate();
        } catch (SQLException ex) {
        }
        return 0;
    }

    public static void main(String[] args) {
        PostImageDAO PostImageDAO = new PostImageDAO();
        System.out.println(PostImageDAO.getPostImageURLByPostId(34));
    }

}

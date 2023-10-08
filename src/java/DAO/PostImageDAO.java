package DAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}

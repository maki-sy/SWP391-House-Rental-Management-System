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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PostImage;
import model.PostRental;

/**
 *
 * @author Tuấn Anh
 */
public class PostDAO extends DBContext {

    /**
     *
     * @return creater: tienPV
     */
    public ArrayList<PostRental> getAllPosts() {
        ArrayList<PostRental> result = new ArrayList<>();
        String sqlCommand = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[type]\n"
                + "      ,[area]\n"
                + "      ,[NumOfBedrooms]\n"
                + "      ,[address]\n"
                + "      ,[description]\n"
                + "      ,[landlord_id]\n"
                + "      ,[location_id]\n"
                + "      ,[status]\n"
                + "      ,[promotion_id]\n"
                + "      ,[post_start_date]\n"
                + "      ,[post_end_date]\n"
                + "  FROM [dbo].[Post]\n";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {

                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numOfBeds = rs.getInt(6);
                String address = rs.getString(7);
                String desscription = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion = rs.getInt(12);
                Date post_start = rs.getDate(13);
                Date post_end = rs.getDate(14);
                result.add(new PostRental(id, name, price, type, area, numOfBeds, address, desscription, landlord_id, location_id, status, promotion, post_start, post_end));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    /**
     *
     * @param landlordID
     * @return creater: tienPV
     */
    public ArrayList<PostRental> getAllPostsByLandlordId(int landlordID) {
        ArrayList<PostRental> result = new ArrayList<>();
        String sqlCommand = "SELECT TOP (1000) [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[type]\n"
                + "      ,[area]\n"
                + "      ,[NumOfBedrooms]\n"
                + "      ,[address]\n"
                + "      ,[description]\n"
                + "      ,[landlord_id]\n"
                + "      ,[location_id]\n"
                + "      ,[status]\n"
                + "      ,[promotion_id]\n"
                + "      ,[post_start_date]\n"
                + "      ,[post_end_date]\n"
                + "  FROM [dbo].[Post]\n"
                + "  WHERE [landlord_id] = " + landlordID;
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {

                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numOfBeds = rs.getInt(6);
                String address = rs.getString(7);
                String desscription = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion = rs.getInt(12);
                Date post_start = rs.getDate(13);
                Date post_end = rs.getDate(14);
                result.add(new PostRental(id, name, price, type, area, numOfBeds, address, desscription, landlord_id, location_id, status, promotion, post_start, post_end));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    /**
     *
     * @param postId
     * @return
     * @creater: tienPV
     */
    public boolean RemovePostByPostId(int postId) {
        try {
            String sql = "DELETE FROM [dbo].[Post]\n"
                    + "      WHERE [dbo].[Post].id = ?";
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setInt(1, postId);
            return pre.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public void updatePostByAdmin(int id) {
        try {
            String sql = "UPDATE post SET status = 'deleted' WHERE id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePostToDeleteByAdmin(int id) {
        try {
            String sql1 = "SELECT id FROM Post where landlord_id = ?";
            PreparedStatement stm1 = connect.prepareStatement(sql1);
            stm1.setInt(1, id);
            ResultSet rs1 = stm1.executeQuery();
            while (rs1.next()) {
                String sql2 = "UPDATE Post SET status = 'deleted' WHERE id = ?";
                PreparedStatement stm2 = connect.prepareStatement(sql2);
                stm2.setInt(1, rs1.getInt(1));
                stm2.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePostToDraftByAdmin(int id) {
        try {
            String sql1 = "SELECT id FROM Post where landlord_id = ?";
            PreparedStatement stm1 = connect.prepareStatement(sql1);
            stm1.setInt(1, id);
            ResultSet rs1 = stm1.executeQuery();
            while (rs1.next()) {
                String sql2 = "UPDATE Post SET status = 'draft' WHERE id = ?";
                PreparedStatement stm2 = connect.prepareStatement(sql2);
                stm2.setInt(1, rs1.getInt(1));
                stm2.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getCountNumberOfPage() {
        String sql = "select count(*) from Post";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 9;
                if (total % 9 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalNumberOfPost() {
        String sql = "select count(*) from Post where status != 'draft' and status != 'deleted'";
        ResultSet rs = getData(sql);
        int total = 0;
        try {
            while (rs.next()) {
                total = rs.getInt(1);
                return total;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getNumberOfPostAfterSearch(String keyword, String type, String bedroom, String priceTo, String areaTo, String location) {
        String sql = "SELECT COUNT(*) FROM Post a "
                + "JOIN Property_Location b ON a.location_id = b.id "
                + "WHERE a.status != 'draft' AND a.status != 'deleted' ";

        if (!keyword.isEmpty()) {
            sql += " AND a.name LIKE ?";
        }
        if (!"All Type".equals(type)) {
            sql += " AND a.type = ?";
        }
        if (!"Any".equals(bedroom)) {
            sql += " AND a.NumOfBedrooms = ?";
        }
        if (!"Unlimite".equals(priceTo)) {
            sql += " AND a.price <= ?";
        }
        if (!"Any".equals(areaTo)) {
            sql += " AND a.area <= ?";
        }
        if (!"Any".equals(location)) {
            sql += " AND b.id = ?";
        }
        try ( PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            int parameterIndex = 1;

            if (!keyword.isEmpty()) {
                preparedStatement.setString(parameterIndex++, "%" + keyword + "%");
            }
            if (!"All Type".equals(type)) {
                preparedStatement.setString(parameterIndex++, type);
            }
            if (!"Any".equals(bedroom)) {
                preparedStatement.setString(parameterIndex++, bedroom);
            }
            if (!"Unlimite".equals(priceTo) && isInteger(priceTo)) {
                preparedStatement.setInt(parameterIndex++, Integer.parseInt(priceTo));
            }
            if (!"Any".equals(areaTo) && isInteger(areaTo)) {
                preparedStatement.setInt(parameterIndex++, Integer.parseInt(areaTo));
            }
            if (!"Any".equals(location)) {
                preparedStatement.setString(parameterIndex++, location);
            }

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 9; // neu total = 10 thi countPage o day = 1 roi`
                if (total % 9 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public ArrayList<PostRental> getPagingPost(int index) {
        ArrayList<PostRental> postList = new ArrayList<>();
        String sqlCommand = "SELECT *\n"
                + "  FROM Post\n"
                + "  WHERE status != 'draft' AND status != 'deleted'\n"
                + "  ORDER BY id"
                + "  OFFSET ? ROWS"
                + "  FETCH FIRST 9 ROWS ONLY";
        try ( PreparedStatement ps = connect.prepareStatement(sqlCommand)) {
            ps.setInt(1, (index - 1) * 9);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);
                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                postList.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return postList;
    }

    public ArrayList<PostRental> getPublishedPosts() {
        ArrayList<PostRental> postList = new ArrayList<>();
        String sqlCommand = "SELECT *\n"
                + "  FROM Post\n"
                + "  WHERE status != 'draft' AND status != 'deleted'\n"
                + "  ORDER BY [status]";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);
                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                postList.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return postList;
    }

    public List<PostRental> getLastestPost() {
        List<PostRental> post = new ArrayList<>();
        String sqlCommand = "SELECT TOP 4 * FROM Post where status != 'draft' and status != 'deleted' ORDER BY post_start_date DESC;";
        ResultSet rs = getData(sqlCommand);
        try {

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);

                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                post.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }

    public List<PostRental> getHighestHousePrice() {
        List<PostRental> post = new ArrayList<>();
        String sqlCommand = "SELECT TOP 3 * FROM Post where status != 'draft' and status != 'deleted' ORDER BY price DESC;";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);

                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                post.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }

    public List<PostImage> getMainPostImages(int postid) {
        List<PostImage> post = new ArrayList<>();
        String sqlCommand = "select b.post_id, b.img_url, b.img_type from post a join Post_Image b on a.id = b.post_id where a.id = " + postid + " and b.img_type = 'main'";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int pid = rs.getInt(1);
                String image = rs.getString(2);
                String img_type = rs.getString(3);
                PostImage po = new PostImage(postid, image, img_type);
                post.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LandlordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return post;
    }

    public PostRental getPostDetailsbyID(int pid) {
        PostRental post = new PostRental();
        String sqlCommand = "SELECT * FROM POST where id = " + pid;
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);

                post = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);

            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }

    /**
     * Get post information by postID
     *
     * @param postID
     * @return PostRental object contains information, or null if there is no
     * post corresponding to postID
     */
    public PostRental getPostByID(int postID) {
        PostRental post = null;
        String sqlCommand = "SELECT * FROM POST where id = ?;";

        try ( PreparedStatement preStmt = connect.prepareStatement(sqlCommand)) {
            preStmt.setInt(1, postID);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);

                post = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
            }
        } catch (SQLException ex) {
            System.out.println("getPostByID() reports " + ex.getMessage());
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }

    public List<PostRental> searchPostByKeyword(String key) {
        List<PostRental> post = new ArrayList<>();
        String sqlCommand = "SELECT * FROM Post WHERE name LIKE '%" + key + "%'";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);

                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                post.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }

    public void RemovePostPromotion_id(int id) {
        try {
            String sql = "UPDATE Post SET promotion_id=null WHERE promotion_id=?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void UpdatePostPromotion_id(int post_id, int promotion_id) {
        try {
            String sql = "UPDATE Post SET promotion_id=? WHERE id=?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, promotion_id);
            stm.setInt(2, post_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * <<<<<<< HEAD
     *
     * =======
     *
     * >>>>>>> 7bd606ceeefcb324db01f58e9ea849ed42ac788d
     *
     * @param name
     * @param price
     * @param type
     * @param area
     * @param NumOfBedrooms
     * @param address
     * @param description
     * @param landrlod_id
     * @param location_id
     * @return
     * @creater: tienPV
     */
    public boolean insertPost(String name, double price, int type,
            int area, int NumOfBedrooms, String address, String description,
            int landrlod_id, int location_id) {
        String sql = "INSERT INTO [dbo].[Post]\n"
                + "           ([name]\n"
                + "           ,[price]\n"
                + "           ,[type]\n"
                + "           ,[area]\n"
                + "           ,[NumOfBedrooms]\n"
                + "           ,[address]\n"
                + "           ,[description]\n"
                + "           ,[landlord_id]\n"
                + "           ,[location_id]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "		(?, ?, ?, ?, ?, ?, ?, ?, ?, 'draft')";

        try ( PreparedStatement preparedStatement = connect.prepareStatement(sql)) {
            preparedStatement.setString(1, name);
            preparedStatement.setDouble(2, price);
            preparedStatement.setInt(3, type);
            preparedStatement.setInt(4, area);
            preparedStatement.setInt(5, NumOfBedrooms);
            preparedStatement.setString(6, address);
            preparedStatement.setString(7, description);
            preparedStatement.setInt(8, landrlod_id);
            preparedStatement.setInt(9, location_id);
            int rowsInserted = preparedStatement.executeUpdate();
            return (rowsInserted > 0);
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     *
     * @param userId
     * @return
     * @creater: tienPV
     */
    public PostRental getLastestPostByUserId(int userId) {
        String sqlCommand = "SELECT TOP 1 * FROM POST\n"
                + "WHERE landlord_id = " + userId + "\n"
                + "ORDER BY id DESC ;";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);
                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                return po;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    /**
     *
     * @param userId
     * @return
     * @creater: tienPV
     */
    public ArrayList<PostRental> getPublishedPostsByUserId(int userId) {
        ArrayList<PostRental> postList = new ArrayList<>();
        String sqlCommand = "SELECT *\n"
                + "  FROM [dbo].[Post]\n"
                + "  WHERE [landlord_id] = " + userId + " AND status != 'draft' AND status != 'deleted'\n"
                + "  ORDER BY [id] DESC";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);
                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                postList.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return postList;
    }

    public ArrayList<PostRental> getEditablePostsByUserId(int userId) {
        ArrayList<PostRental> postList = new ArrayList<>();
        String sqlCommand = "SELECT *\n"
                + "  FROM [dbo].[Post]\n"
                + "  WHERE [landlord_id] = " + userId + " AND status != 'deleted'\n"
                + "  ORDER BY [id] DESC";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);
                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                postList.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return postList;
    }

    public boolean UpdatePostStatus(int post_id, String status) {
        try {
            String sql = "UPDATE Post SET status=? WHERE id=?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setString(1, status);
            stm.setInt(2, post_id);
            int rowUpdated = stm.executeUpdate();
            return (rowUpdated > 0);
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    private boolean isInteger(String s) {
        try {
            Integer.parseInt(s);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public boolean UpdatePostDate(int post_id, Date post_start_date, Date post_end_date) {
        try {
            String sql = "UPDATE [dbo].[Post]\n"
                    + "   SET \n"
                    + "     [post_start_date] = ?\n"
                    + "      ,[post_end_date] = ?\n"
                    + " WHERE [Post].id = ?";
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setDate(1, (java.sql.Date) post_start_date);
            stm.setDate(2, (java.sql.Date) post_end_date);
            stm.setInt(3, post_id);
            int rowUpdated = stm.executeUpdate();
            return (rowUpdated > 0);
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<PostRental> getPostDetailsbyLandlordId(int pid) {
        List<PostRental> post = new ArrayList<>();
        String sqlCommand = "SELECT * FROM POST where landlord_id = " + pid;
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);

                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                post.add(po);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return post;
    }

    /**
     *
     * @param postId
     * @param name
     * @param price
     * @param type
     * @param area
     * @param NumOfBedRooms
     * @param address
     * @param description
     * @param location_id
     * @return
     * @creater: tienPV
     */
    public boolean isUpdatedPostByPostId(int postId, String name, double price,
            int type, int area, int NumOfBedRooms, String address,
            String description, int location_id) {

        String sql = "UPDATE [dbo].[Post]\n"
                + "   SET [name] = ?\n"
                + "      ,[price] =?\n"
                + "      ,[type] = ?\n"
                + "      ,[area] = ?\n"
                + "      ,[NumOfBedrooms] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[location_id] = ?\n"
                + " WHERE [Post].id = ?";
        try {
            PreparedStatement pre = connect.prepareStatement(sql);
            pre.setString(1, name);
            pre.setDouble(2, price);
            pre.setInt(3, type);
            pre.setInt(4, area);
            pre.setInt(5, NumOfBedRooms);
            pre.setString(6, address);
            pre.setString(7, description);
            pre.setInt(8, location_id);
            pre.setInt(9, postId);
            int rowUpdated = pre.executeUpdate();
            return (rowUpdated > 0);
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     *
     * @param postID
     * @return post name if post exist, otherwise null
     */
    public String getPostName(int postID) {
        String SQL = "SELECT name FROM Post WHERE id = ?;";
        String name = null;
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            preStmt.setInt(1, postID);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next()) {
                name = rs.getString(1);
            }
        } catch (SQLException ex) {
            System.out.println("getPostName() reports " + ex.getMessage());
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }

    /**
     * @param landlordId
     * @return
     * @creater: tienPV
     */
    public PostRental getLastestPostByLandlordId(int landlordId) {
        PostRental result = new PostRental();
        String sqlCommand = "SELECT TOP (1) [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[type]\n"
                + "      ,[area]\n"
                + "      ,[NumOfBedrooms]\n"
                + "      ,[address]\n"
                + "      ,[description]\n"
                + "      ,[landlord_id]\n"
                + "      ,[location_id]\n"
                + "      ,[status]\n"
                + "      ,[promotion_id]\n"
                + "      ,[post_start_date]\n"
                + "      ,[post_end_date]\n"
                + "  FROM [dbo].[Post]\n"
                + "  WHERE [landlord_id]= " + landlordId + "\n"
                + "  ORDER BY  [id] DESC";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {

                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numOfBeds = rs.getInt(6);
                String address = rs.getString(7);
                String desscription = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion = rs.getInt(12);
                Date post_start = rs.getDate(13);
                Date post_end = rs.getDate(14);
                result = new PostRental(id, name, price, type, area, numOfBeds, address, desscription, landlord_id, location_id, status, promotion, post_start, post_end);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public String getLocationByLocationID(int postID) {
        String url = null;
        String sql = "select location_name from Property_Location where id = ?";
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
     * @param landlordId
     * @return
     * @creater: tienPV
     */
    public PostRental getSecondLastestPostByLandlordId(int landlordId) {
        PostRental result = new PostRental();
        String sqlCommand = "SELECT TOP (2) [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[type]\n"
                + "      ,[area]\n"
                + "      ,[NumOfBedrooms]\n"
                + "      ,[address]\n"
                + "      ,[description]\n"
                + "      ,[landlord_id]\n"
                + "      ,[location_id]\n"
                + "      ,[status]\n"
                + "      ,[promotion_id]\n"
                + "      ,[post_start_date]\n"
                + "      ,[post_end_date]\n"
                + "  FROM [dbo].[Post]\n"
                + "  WHERE [landlord_id]= " + landlordId + "\n"
                + "  ORDER BY [id] DESC";
        ResultSet rs = getData(sqlCommand);
        try {
            while (rs.next()) {

                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numOfBeds = rs.getInt(6);
                String address = rs.getString(7);
                String desscription = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion = rs.getInt(12);
                Date post_start = rs.getDate(13);
                Date post_end = rs.getDate(14);
                result = new PostRental(id, name, price, type, area, numOfBeds, address, desscription, landlord_id, location_id, status, promotion, post_start, post_end);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    /**
     * Get all expired posts (posts have post_end_date before current date)
     *
     * @return
     */
    public List<PostRental> getAllExpiredPosts() {
        String SQL = "SELECT *\n"
                + "FROM Post\n"
                + "WHERE GETDATE() > post_end_date;";
        List<PostRental> posts = new ArrayList<>();
        try ( PreparedStatement preStmt = connect.prepareStatement(SQL)) {
            ResultSet rs = preStmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int type = rs.getInt(4);
                int area = rs.getInt(5);
                int numofbeds = rs.getInt(6);
                String address = rs.getString(7);
                String dess = rs.getString(8);
                int landlord_id = rs.getInt(9);
                int location_id = rs.getInt(10);
                String status = rs.getString(11);
                int promotion_id = rs.getInt(12);
                Date start = rs.getDate(13);
                Date end = rs.getDate(14);

                PostRental po = new PostRental(id, name, price, type, area, numofbeds, address, dess, landlord_id, location_id, status, promotion_id, start, end);
                posts.add(po);
            }
        } catch (SQLException ex) {
            System.out.println("getAllExpiredPosts() reports " + ex.getMessage());
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return posts;
    }

    public static void main(String[] args) {
        PostDAO dao = new PostDAO();
        int total = dao.getTotalNumberOfPost();
        System.out.println(total + "tuananh");
    }
}

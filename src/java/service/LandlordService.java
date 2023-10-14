package service;

import DAO.LandlordDAO;
import DAO.OrdersDAO;
import DAO.PostDAO;
import DAO.PostImageDAO;
import DAO.TransactionDAO;
import jakarta.servlet.http.Part;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import model.Landlord;
import model.Orders;
import model.PostRental;

public class LandlordService {

    private final static LandlordDAO LANDLORD_DAO = new LandlordDAO();

    public boolean isApproveStatusUpdated(int OrderId) {
        OrdersDAO ordersDAO = new OrdersDAO();
        return ordersDAO.updateStatus("approved", OrderId);
    }

    public boolean isRejectStatusUpdated(int OrderId) {
        OrdersDAO ordersDAO = new OrdersDAO();
        return ordersDAO.updateStatus("rejected", OrderId);
    }

    public ArrayList<Orders> getOrdersProcessing(int landlordId) {
        OrdersDAO ordersDAO = new OrdersDAO();
        ArrayList<Orders> result = ordersDAO.getOrdersByLandlordIdWithConditions(landlordId, "status = 'processing'");
        return result;
    }

    public ArrayList<Orders> getOrdersNotProcessing(int landlordId) {
        OrdersDAO ordersDAO = new OrdersDAO();
        return ordersDAO.getOrdersByLandlordIdWithConditions(landlordId, "status != 'processing'");
    }

    public boolean isInsertSuccess(String name, int price, int type,
            int area, int NumOfBedrooms, String address, String description,
            int landrlod_id, int location_id) {
        PostDAO postDAO = new PostDAO();
        return postDAO.insertPost(name, price, type, area, NumOfBedrooms, address,
                description, landrlod_id, location_id);
    }

    public PostRental getLastestPostByUserId(int userId) {
        PostDAO postDAO = new PostDAO();
        return postDAO.getLastestPostByUserId(userId);
    }

    public int getAccountPointsByUserId(int userId) {
        LandlordDAO landlordDAO = new LandlordDAO();
        return landlordDAO.getLandlordByUserID(userId).getPoint();
    }

    public boolean isUpdatePostStatusByPostIdSuccess(int postId, String status) {
        PostDAO postDAO = new PostDAO();
        return postDAO.UpdatePostStatus(postId, status);
    }

    public boolean isMoneyDedutedByUserId(int userId, String postStatus) {
        LandlordDAO landlordDAO = new LandlordDAO();
        int currentPoint = landlordDAO.getLandlordByUserID(userId).getPoint();
        if (postStatus.equals("basic")) {
            currentPoint -= 13;
        } else if (postStatus.equals("standard")) {
            currentPoint -= 32;
        } else {
            currentPoint -= 48;
        }
        System.out.println(currentPoint);
        landlordDAO.UpdateAccountPoints(userId, currentPoint);
        return false;
    }

    public boolean isUpdatedPostDate(int postId, String postStatus) {
        LocalDate currentDate = LocalDate.now();
        Date dateStart = java.sql.Date.valueOf(currentDate);
        DAO.PostDAO postDAO = new PostDAO();
        Date dateEnd;
        if (postStatus.equals("basic")) {
            LocalDate oneMonthLater = currentDate.plusMonths(1);
            dateEnd = java.sql.Date.valueOf(oneMonthLater);
        } else if (postStatus.equals("standard")) {
            LocalDate threeMonthLater = currentDate.plusMonths(3);
            dateEnd = java.sql.Date.valueOf(threeMonthLater);
        } else {
            LocalDate sixMonthLater = currentDate.plusMonths(6);
            dateEnd = java.sql.Date.valueOf(sixMonthLater);
        }
        postDAO.UpdatePostDate(postId, dateStart, dateEnd);
        System.out.println("Ngày hiện tại: " + dateStart);
        System.out.println("Ngày cách 1 tháng: " + dateEnd);
        return false;
    }

    public boolean isInsertedTransactionSuccess(int payerId, int postId, String postStatus) {
        TransactionDAO transactionDAO = new TransactionDAO();
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String transactionDate = dateFormat.format(currentDate);
        double amount = 0D;
        int receiverId = 1;
        String type = "DEPOSIT";
        if (postStatus.equals("basic")) {
            amount = 13;
        } else if (postStatus.equals("standard")) {
            amount = 32;
        } else {
            amount = 48;
        }
        int rowInserted = transactionDAO.addTransaction(amount, payerId,
                receiverId, type, transactionDate, postId);
        return false;
    }

    public String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "unknown.jpg";
    }

    public String getFileExtension(String fileName) {
        int lastDotIndex = fileName.lastIndexOf(".");
        if (lastDotIndex != -1) {
            return fileName.substring(lastDotIndex + 1);
        }
        return "";
    }

    public int addPostImage(int postId, String imgUrl, String imgType) {
        DAO.PostImageDAO postImageDAO = new PostImageDAO();
        return postImageDAO.addPostImage(postId, imgUrl, imgType);
    }

    /**
     * Add point to landlord account. If the landlordID does not exists, this
     * function will throw exception
     *
     * @param landlordID user's id of landlord account
     * @param amount amount of point to add. The amount must be an integer
     * greater than 0
     * @throws Exception
     */
    public void addPoint(int landlordID, int amount) throws Exception, IllegalArgumentException {
        Landlord landlord = LANDLORD_DAO.getLandlordByUserID(landlordID);
        if (landlord == null) {
            throw new Exception("Cannot add point to landlord id " + landlordID + ", there is no landlord.");
        }

        if (amount <= 0) {
            throw new IllegalArgumentException("Amount of point must be greater than 0");
        }
        int point = landlord.getPoint();
        point += amount;
        landlord.setPoint(point);
        LANDLORD_DAO.updateLandlordByID(landlord);
    }
    
//    public String getLandlordName(){
//        
//    }

    public static void main(String[] args) {
        LandlordService n = new LandlordService();
    }
}

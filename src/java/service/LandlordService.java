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
import model.Orders;
import model.PostRental;

public class LandlordService {

    private final DAO.PostDAO postDAO = new PostDAO();
    private final OrdersDAO ordersDAO = new OrdersDAO();
    private final LandlordDAO landlordDAO = new LandlordDAO();
    private final DAO.PostImageDAO postImageDAO = new PostImageDAO();

    public boolean isApproveStatusUpdated(int OrderId) {
        return ordersDAO.updateStatus("approved", OrderId);
    }

    public boolean isRejectStatusUpdated(int OrderId) {
        return ordersDAO.updateStatus("rejected", OrderId);
    }

    public ArrayList<Orders> getOrdersProcessing(int landlordId) {
        return ordersDAO.getOrdersByLandlordIdWithConditions(landlordId, "status = 'processing'");
    }

    public ArrayList<Orders> getOrdersNotProcessing(int landlordId) {
        return ordersDAO.getOrdersByLandlordIdWithConditions(landlordId, "status != 'processing'");
    }

    public boolean isInsertSuccess(String name, int price, int type,
            int area, int NumOfBedrooms, String address, String description,
            int landrlod_id, int location_id) {
        return postDAO.insertPost(name, price, type, area, NumOfBedrooms, address,
                description, landrlod_id, location_id);
    }

    public PostRental getLastestPostByUserId(int userId) {
        return postDAO.getLastestPostByUserId(userId);
    }

    public int getAccountPointsByUserId(int userId) {
        return landlordDAO.getLandlordByUserID(userId).getPoint();
    }

    public boolean isUpdatePostStatusByPostIdSuccess(int postId, String status) {
        return postDAO.UpdatePostStatus(postId, status);
    }

    public boolean isMoneyDedutedByUserId(int userId, String postStatus) {
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
        return postDAO.UpdatePostDate(postId, dateStart, dateEnd);
    }

    public boolean isInsertedTransactionSuccess(int payerId, int postId, String postStatus) {
        TransactionDAO transactionDAO = new TransactionDAO();
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String transactionDate = dateFormat.format(currentDate);
        double amount;
        int receiverId = 1;
        String type = "PAY";
        if (postStatus.equals("basic")) {
            amount = 13;
        } else if (postStatus.equals("standard")) {
            amount = 32;
        } else {
            amount = 48;
        }
        int rowInserted = transactionDAO.addTransaction(amount, payerId,
                receiverId, type, transactionDate, postId);
        return (rowInserted > 0);
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
        return postImageDAO.addPostImage(postId, imgUrl, imgType);
    }

    public ArrayList<PostRental> getPublishedPostsByUserId(int userId) {
        return postDAO.getPublishedPostsByUserId(userId);
    }

    public ArrayList<PostRental> getEditablePostsByUserId(int userId) {
        return postDAO.getEditablePostsByUserId(userId);
    }

    public boolean isMovePostToDraftSuccessByPostId(int postId) {
        boolean isDateUpdated = postDAO.UpdatePostDate(postId, null, null);
        boolean isStatusUpdated = postDAO.UpdatePostStatus(postId, "draft");
        return isDateUpdated && isStatusUpdated;
    }
    
     public boolean isDeletedPostSuccessByPostId(int postId) {
        boolean isImageDeleted =  (postImageDAO.deletePostImageByPostId(postId)>0);
        boolean isStatusUpdated = postDAO.UpdatePostStatus(postId, "deleted");
        return isImageDeleted && isStatusUpdated;
    }

    public static void main(String[] args) {
        LandlordService n = new LandlordService();
    }
}

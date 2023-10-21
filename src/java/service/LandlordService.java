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

    private final DAO.PostDAO postDAO = new PostDAO();
    private final OrdersDAO ordersDAO = new OrdersDAO();
    private final LandlordDAO landlordDAO = new LandlordDAO();
    private final DAO.PostImageDAO postImageDAO = new PostImageDAO();

    /**
     * @uses: Update order status to 'approved'
     * @param OrderId ID of the order need to update
     * @return True if updated success, false otherwise
     * @creater: tienPV
     */
    public boolean isApproveStatusUpdated(int OrderId) {
        return ordersDAO.updateStatus("approved", OrderId);
    }

    /**
     * @uses: Update order status to 'rejected'
     * @param OrderId ID of the order need to update
     * @return True if updated success, false otherwise
     * @creater: tienPV
     */
    public boolean isRejectStatusUpdated(int OrderId) {
        return ordersDAO.updateStatus("rejected", OrderId);
    }

    /**
     * @uses:
     * @param landlordId
     * @return
     * @creater: tienPV
     */
    public ArrayList<Orders> getOrdersProcessing(int landlordId) {
        return ordersDAO.getOrdersByLandlordIdWithConditions(landlordId, "status = 'processing'");
    }

    /**
     *
     * @param landlordId
     * @return
     * @creater: tienPV
     */
    public ArrayList<Orders> getOrdersNotProcessing(int landlordId) {
        return ordersDAO.getOrdersByLandlordIdWithConditions(landlordId, "status != 'processing'");
    }

    /**
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
    public boolean isInsertSuccess(String name, int price, int type,
            int area, int NumOfBedrooms, String address, String description,
            int landrlod_id, int location_id) {
        return postDAO.insertPost(name, price, type, area, NumOfBedrooms, address,
                description, landrlod_id, location_id);
    }

    /**
     *
     * @param userId
     * @return
     * @creater: tienPV
     */
    public PostRental getLastestPostByUserId(int userId) {
        return postDAO.getLastestPostByUserId(userId);
    }

    /**
     *
     * @param userId
     * @return
     * @creater: tienPV
     */
    public int getAccountPointsByUserId(int userId) {
        return landlordDAO.getLandlordByUserID(userId).getPoint();
    }

    /**
     *
     * @param postId
     * @param status
     * @return
     * @creater: tienPV
     */
    public boolean isUpdatePostStatusByPostIdSuccess(int postId, String status) {
        return postDAO.UpdatePostStatus(postId, status);
    }

    /**
     *
     * @param userId
     * @param postStatus
     * @return
     * @creater: tienPV
     */
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

    /**
     *
     * @param postId
     * @param postStatus
     * @return
     * @creater: tienPV
     */
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

    /**
     *
     * @param payerId
     * @param postId
     * @param postStatus
     * @return
     * @creater: tienPV
     */
    public boolean isInsertedTransactionSuccess(int payerId, int postId, String postStatus) {
        TransactionDAO transactionDAO = new TransactionDAO();
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
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

    /**
     *
     * @param part
     * @return
     * @creater: tienPV
     */
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

    /**
     *
     * @param fileName
     * @return
     * @creater: tienPV
     */
    public String getFileExtension(String fileName) {
        int lastDotIndex = fileName.lastIndexOf(".");
        if (lastDotIndex != -1) {
            return fileName.substring(lastDotIndex + 1);
        }
        return "";
    }

    /**
     *
     * @param postId
     * @param imgUrl
     * @param imgType
     * @return
     * @creater: tienPV
     */
    public int addPostImage(int postId, String imgUrl, String imgType) {
        DAO.PostImageDAO postImageDAO = new PostImageDAO();
        return postImageDAO.addPostImage(postId, imgUrl, imgType);
    }

    /**
     * Add point to landlord account and then add transaction history to the
     * database. If the landlordID does not exists or invalid amount, this
     * function will throw an exception
     *
     * @param landlordID user's id of landlord account
     * @param amount amount of point to add. The amount must be an integer
     * greater than 0
     * @throws Exception
     */
    public void addPoint(int landlordID, int amount) throws Exception, IllegalArgumentException {
        Landlord landlord = landlordDAO.getLandlordByUserID(landlordID);
        if (landlord == null) {
            throw new Exception("Cannot add point to landlord id " + landlordID + ", there is no landlord.");
        }

        if (amount <= 0) {
            throw new IllegalArgumentException("Amount of point must be greater than 0");
        }
        // update point to landlord account
        int point = landlord.getPoint();
        point += amount;
        landlord.setPoint(point);
        landlordDAO.updateLandlordByID(landlord);

        // add transaction to database
        TransactionService tService = new TransactionService();
        tService.addDepositTransaction(landlordID, amount);
    }

    /**
     *
     * @param userId
     * @return
     * @creater: tienPV
     */
    public ArrayList<PostRental> getPublishedPostsByUserId(int userId) {
        return postDAO.getPublishedPostsByUserId(userId);
    }

    /**
     *
     * @param userId
     * @return
     * @creater: tienPV
     */
    public ArrayList<PostRental> getEditablePostsByUserId(int userId) {
        return postDAO.getEditablePostsByUserId(userId);
    }

    /**
     *
     * @param postId
     * @return
     * @creater: tienPV
     */
    public boolean isMovePostToDraftSuccessByPostId(int postId) {
        boolean isDateUpdated = postDAO.UpdatePostDate(postId, null, null);
        boolean isStatusUpdated = postDAO.UpdatePostStatus(postId, "draft");
        return isDateUpdated && isStatusUpdated;
    }

    /**
     *
     * @param postId
     * @return
     */
    public boolean isDeletedPostSuccessByPostId(int postId) {
        boolean isImageDeleted = (postImageDAO.deletePostImageByPostId(postId) > 0);
        boolean isStatusUpdated = postDAO.UpdatePostStatus(postId, "deleted");
        return isImageDeleted && isStatusUpdated;
    }

    /**
     *
     * @param postId
     * @return
     * @creater: tienPV
     */
    public boolean isDeletedPostForeverByPostId(int postId) {
        boolean isImageDeleted = (postImageDAO.deletePostImageByPostId(postId) > 0);
        boolean isPostDeleted = postDAO.RemovePostByPostId(postId);
        return isImageDeleted && isPostDeleted;
    }

    /**
     *
     * @param postId
     * @param landlordId
     * @return creater: tienPV
     */
    public boolean isDeleteDuplicateDraftPostsSuccessByPostId(int postId, int landlordId) {
        PostRental currentPost = postDAO.getPostByPostByPostId(postId);
        PostRental beforePost = postDAO.getSecondLastestPostByLandlordId(landlordId);
        boolean isDupl = this.isDuplicateDraftPost(currentPost, beforePost);
        if (isDupl) {
            this.isDeletedPostForeverByPostId(beforePost.getId());
            return true;
        }
        return false;
    }

    /**
     *
     * @param postTarget
     * @param postOther
     * @return
     * @creater: tienPV
     */
    private boolean isDuplicateDraftPost(PostRental postTarget, PostRental postOther) {
        if (postTarget.getId() != postOther.getId()
                && postTarget.getName().equals(postOther.getName())
                && postTarget.getPrice() == postOther.getPrice()
                && postTarget.getType() == postOther.getType()
                && postTarget.getArea() == postOther.getArea()
                && postTarget.getNumOfBeds() == postOther.getNumOfBeds()
                && postTarget.getAddress().equals(postOther.getAddress())
                && postTarget.getDesscription().equals(postOther.getDesscription())
                && postTarget.getLandlord_id() == postOther.getLandlord_id()
                && postTarget.getLocation_id() == postOther.getLocation_id()
                && postTarget.getStatus().equals(postOther.getStatus())
                && postTarget.getStatus().equals("draft")) {
            return true;
        }
        return false;
    }

    /**
     * uses: test function
     *
     * @param args
     * @creater: tienPV
     */
    public static void main(String[] args) {
        LandlordService n = new LandlordService();
        System.out.println();
    }
}

package model;

public class Orders {

    private int orderId;
    private int tenantId;
    private int landlordId;
    private int postId;
    private String order_date;
    private String status;

    public Orders() {
    }

    public Orders(int orderId, int tenantId, int landlordId, int postId, String order_date, String status) {
        this.orderId = orderId;
        this.tenantId = tenantId;
        this.landlordId = landlordId;
        this.postId = postId;
        this.order_date = order_date;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getTenantId() {
        return tenantId;
    }

    public void setTenantId(int tenantId) {
        this.tenantId = tenantId;
    }

    public int getLandlordId() {
        return landlordId;
    }

    public void setLandlordId(int landlordId) {
        this.landlordId = landlordId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}

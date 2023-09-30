/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Tuấn Anh
 */
public class PostRental {

    private int id;
    private String name;
    private double price;
    private int type;
    private int area;
    private int numOfBeds;
    private String address;
    private String desscription;
    private int landlord_id;
    private int location_id;
    private String status;
    private int promotion;
    private Date post_start;
    private Date post_end;

    public PostRental() {
    }

    public PostRental(int id, String name, double price, int type, int area, int numOfBeds, String address, String desscription, int landlord_id, int location_id, String status, int promotion, Date post_start, Date post_end) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.type = type;
        this.area = area;
        this.numOfBeds = numOfBeds;
        this.address = address;
        this.desscription = desscription;
        this.landlord_id = landlord_id;
        this.location_id = location_id;
        this.status = status;
        this.promotion = promotion;
        this.post_start = post_start;
        this.post_end = post_end;
    }

    public int getLocation_id() {
        return location_id;
    }

    public void setLocation_id(int location_id) {
        this.location_id = location_id;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getNumOfBeds() {
        return numOfBeds;
    }

    public void setNumOfBeds(int numOfBeds) {
        this.numOfBeds = numOfBeds;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDesscription() {
        return desscription;
    }

    public void setDesscription(String desscription) {
        this.desscription = desscription;
    }

    public int getLandlord_id() {
        return landlord_id;
    }

    public void setLandlord_id(int landlord_id) {
        this.landlord_id = landlord_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPromotion() {
        return promotion;
    }

    public void setPromotion(int promotion) {
        this.promotion = promotion;
    }

    public Date getPost_start() {
        return post_start;
    }

    public void setPost_start(Date post_start) {
        this.post_start = post_start;
    }

    public Date getPost_end() {
        return post_end;
    }

    public void setPost_end(Date post_end) {
        this.post_end = post_end;
    }

    @Override
    public String toString() {
        return "Post{" + "id=" + id + ", name=" + name + ", price=" + price + ", type=" + type + ", area=" + area + ", numOfBeds=" + numOfBeds + ", address=" + address + ", desscription=" + desscription + ", landlord_id=" + landlord_id + ", status=" + status + ", promotion=" + promotion + ", post_start=" + post_start + ", post_end=" + post_end + '}';
    }

}

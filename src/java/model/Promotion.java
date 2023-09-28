/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Administrator
 */
public class Promotion {
    //
    private int promotion_id;
    private int discount;
    private String descriptions;
    private Date promotion_start_date;
    private Date promotion_end_date;

    public Promotion() {
    }

    public Promotion(int promotion_id, int discount, String descriptions, Date promotion_start_date, Date promotion_end_date) {
        this.promotion_id = promotion_id;
        this.discount = discount;
        this.descriptions = descriptions;
        this.promotion_start_date = promotion_start_date;
        this.promotion_end_date = promotion_end_date;
    }

    public int getPromotion_id() {
        return promotion_id;
    }

    public void setPromotion_id(int promotion_id) {
        this.promotion_id = promotion_id;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public Date getPromotion_start_date() {
        return promotion_start_date;
    }

    public void setPromotion_start_date(Date promotion_start_date) {
        this.promotion_start_date = promotion_start_date;
    }

    public Date getPromotion_end_date() {
        return promotion_end_date;
    }

    public void setPromotion_end_date(Date promotion_end_date) {
        this.promotion_end_date = promotion_end_date;
    }
    
}

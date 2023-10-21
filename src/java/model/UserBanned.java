/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DTS
 */
public class UserBanned {

    /**
     * Status of banned record
     */
    public enum Status {
        /**
         * banned is in active
         */
        Active,
        /**
         * banned is disable (an banned user can be unban before dueDate), this
         * can also be set in case of end of ban-duration
         */
        Disable
    }

    private int id;
    private String email;
    private String startDate;
    private String endDate;
    private Status status;

    public UserBanned(int id, String email, String startDate, String endDate, Status status) {
        this.id = id;
        this.email = email;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

}

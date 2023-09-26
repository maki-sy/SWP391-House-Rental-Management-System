/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DTS
 */
public class Landlord {

    public enum LandlordStatus {
        UNV, // unverified email
        UNC, // unverified landlord reputation
        VER, // verified
        CFM, // verified email + reputation
        BAN, // banned
        DEL, // deleted
    }
    private int id;
    private String email;
    private byte[] hashedPassword;
    private byte[] salt;
    private String firstName;
    private String lastName;
    private String address;
    private String phone;
    private String civilID;
    private LandlordStatus status;
    private int point;

    public Landlord() {
    }

    public Landlord(int id, String email, byte[] hashedPassword, byte[] salt, String firstName, String lastName, String address, String phone, String civilID, LandlordStatus status, int point) {
        this.id = id;
        this.email = email;
        this.hashedPassword = hashedPassword;
        this.salt = salt;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.phone = phone;
        this.civilID = civilID;
        this.status = status;
        this.point = point;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public byte[] getHashedPassword() {
        return hashedPassword;
    }

    public void setHashedPassword(byte[] hashedPassword) {
        this.hashedPassword = hashedPassword;
    }

    public byte[] getSalt() {
        return salt;
    }

    public void setSalt(byte[] salt) {
        this.salt = salt;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCivilID() {
        return civilID;
    }

    public void setCivilID(String civilID) {
        this.civilID = civilID;
    }

    public LandlordStatus getStatus() {
        return status;
    }

    public void setStatus(LandlordStatus status) {
        this.status = status;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
}

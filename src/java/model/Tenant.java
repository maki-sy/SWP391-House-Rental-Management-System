/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import service.UserService;

/**
 *
 * @author DTS
 */
public class Tenant {
    private int id;
    private String email;
    private byte[] hashedPassword;
    private byte[] salt;
    private String firstName;
    private String lastName;
    private String address;
    private String phone;
    private String civilID;
    private UserService.TenantStatus status;

    public Tenant(int id, String email, byte[] hashedPassword, byte[] salt, String firstName, String lastName, String address, String phone, String civilID, UserService.TenantStatus status) {
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
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public UserService.TenantStatus getStatus() {
        return status;
    }

    public void setStatus(UserService.TenantStatus status) {
        this.status = status;
    }
    
    
}

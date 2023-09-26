package model;

public class Users {

    private int id;
    private String email;
    private int hashedPassword;
    private int salt;
    private int roleId;

    public Users(int id, String email, int hashedPassword, int salt, int roleId) {
        this.id = id;
        this.email = email;
        this.hashedPassword = hashedPassword;
        this.salt = salt;
        this.roleId = roleId;
    }

    public Users() {
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

    public int getHashedPassword() {
        return hashedPassword;
    }

    public void setHashedPassword(int hashedPassword) {
        this.hashedPassword = hashedPassword;
    }

    public int getSalt() {
        return salt;
    }

    public void setSalt(int salt) {
        this.salt = salt;
    }

    public int getRole_id() {
        return roleId;
    }

    public void setRole_id(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "Users{" + "id=" + id + ", email=" + email + ", hashedPassword=" + hashedPassword + ", salt=" + salt + ", roleId=" + roleId + '}';
    }
    
}

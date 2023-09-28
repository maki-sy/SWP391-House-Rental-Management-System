package model;

public class Users {

    public enum Role {
        TENANT(1),
        LANDLORD(2),
        ADMIN(3);

        private final int id;

        private Role(int id) {
            this.id = id;
        }

        public int getValue() {
            return id;
        }
    }

    public enum Status {
        UNV,
        VER,
        BAN,
        DEL,
    }

    private int id;
    private String email;
    private byte[] hashedPassword;
    private byte[] salt;
    private int roleID;
    private Status status;

    public Users(int id, String email, byte[] hashedPassword, byte[] salt, int roleId, Status status) {
        this.id = id;
        this.email = email;
        this.hashedPassword = hashedPassword;
        this.salt = salt;
        this.roleID = roleId;
        this.status = status;
    }

    public Users(String email, byte[] hashedPassword, byte[] salt, int roleId, Status status) {
        this.email = email;
        this.hashedPassword = hashedPassword;
        this.salt = salt;
        this.roleID = roleId;
        this.status = status;
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

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }    

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Users{" + "id=" + id + ", email=" + email + ", hashedPassword=" + hashedPassword + ", salt=" + salt + ", roleId=" + roleID + ", status=" + status + '}';
    }

}

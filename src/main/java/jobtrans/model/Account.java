package jobtrans.model;

import java.util.Date;

public class Account {
    private int accountId;
    private String accountName;
    private String email;
    private String password;
    private String phone;
    private String avatar;
    private String bio;
    private String address;
    private Date dateOfBirth;
    private String gender;
    private String specialist;
    private int experienceYears;
    private String education;
    private int point;
    private boolean verifiedAccount;
    private boolean verifiedLink;
    private int tagComplete;
    private int tagDebt;
    private int count;
    private String role;
    private String type;
    private String signature;
    private String status;

    // Constructor không tham số
    public Account() {}

    // Constructor có tham số
    public Account(int accountId, String accountName, String email, String password, String phone, String avatar,
                   String bio, String address, Date dateOfBirth, String gender, String specialist, int experienceYears,
                   String education, int point, boolean verifiedAccount, boolean verifiedLink, int tagComplete,
                   int tagDebt, int count, String role, String type, String signature, String status) {
        this.accountId = accountId;
        this.accountName = accountName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.avatar = avatar;
        this.bio = bio;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.specialist = specialist;
        this.experienceYears = experienceYears;
        this.education = education;
        this.point = point;
        this.verifiedAccount = verifiedAccount;
        this.verifiedLink = verifiedLink;
        this.tagComplete = tagComplete;
        this.tagDebt = tagDebt;
        this.count = count;
        this.role = role;
        this.type = type;
        this.signature = signature;
        this.status = status;
    }

    // Getter và Setter
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSpecialist() {
        return specialist;
    }

    public void setSpecialist(String specialist) {
        this.specialist = specialist;
    }

    public int getExperienceYears() {
        return experienceYears;
    }

    public void setExperienceYears(int experienceYears) {
        this.experienceYears = experienceYears;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public boolean isVerifiedAccount() {
        return verifiedAccount;
    }

    public void setVerifiedAccount(boolean verifiedAccount) {
        this.verifiedAccount = verifiedAccount;
    }

    public boolean isVerifiedLink() {
        return verifiedLink;
    }

    public void setVerifiedLink(boolean verifiedLink) {
        this.verifiedLink = verifiedLink;
    }

    public int getTagComplete() {
        return tagComplete;
    }

    public void setTagComplete(int tagComplete) {
        this.tagComplete = tagComplete;
    }

    public int getTagDebt() {
        return tagDebt;
    }

    public void setTagDebt(int tagDebt) {
        this.tagDebt = tagDebt;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", accountName='" + accountName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", avatar='" + avatar + '\'' +
                ", bio='" + bio + '\'' +
                ", address='" + address + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", gender='" + gender + '\'' +
                ", specialist='" + specialist + '\'' +
                ", experienceYears=" + experienceYears +
                ", education='" + education + '\'' +
                ", point=" + point +
                ", verifiedAccount=" + verifiedAccount +
                ", verifiedLink=" + verifiedLink +
                ", tagComplete=" + tagComplete +
                ", tagDebt=" + tagDebt +
                ", count=" + count +
                ", role='" + role + '\'' +
                ", type='" + type + '\'' +
                ", signature='" + signature + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}

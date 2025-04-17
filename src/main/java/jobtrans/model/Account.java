package jobtrans.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Account {
    private int accountId;
    private String accountName;
    private String email;
    private String password;
    private String avatar;
    private String oauthId;
    private String oauthProvider;
    private LocalDate dateOfBirth;
    private String gender;
    private String phone;
    private String address;
    private String education;
    private String speciality;
    private Integer experienceYears;
    private String skills;
    private String bio;
    private Integer point;
    private BigDecimal starRate;
    private BigDecimal amountWallet;
    private String verifiedLink;
    private boolean verifiedAccount;
    private BigDecimal completePercent;
    private String labelTag;
    private Integer count;
    private String role;
    private String typeAccount;
    private String levelAccount;
    private String signature;
    private LocalDateTime joinDate;
    private Integer countMember;
    private String status;

    public Account() {
    }

    public Account(int accountId, String accountName, String email, String password, String avatar, String oauthId, String oauthProvider, LocalDate dateOfBirth, String gender, String phone, String address, String education, String speciality, Integer experienceYears, String skills, String bio, Integer point, BigDecimal starRate, BigDecimal amountWallet, String verifiedLink, boolean verifiedAccount, BigDecimal completePercent, String labelTag, Integer count, String role, String typeAccount, String levelAccount, String signature, LocalDateTime joinDate, Integer countMember, String status) {
        this.accountId = accountId;
        this.accountName = accountName;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
        this.oauthId = oauthId;
        this.oauthProvider = oauthProvider;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
        this.education = education;
        this.speciality = speciality;
        this.experienceYears = experienceYears;
        this.skills = skills;
        this.bio = bio;
        this.point = point;
        this.starRate = starRate;
        this.amountWallet = amountWallet;
        this.verifiedLink = verifiedLink;
        this.verifiedAccount = verifiedAccount;
        this.completePercent = completePercent;
        this.labelTag = labelTag;
        this.count = count;
        this.role = role;
        this.typeAccount = typeAccount;
        this.levelAccount = levelAccount;
        this.signature = signature;
        this.joinDate = joinDate;
        this.countMember = countMember;
        this.status = status;
    }

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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getOauthId() {
        return oauthId;
    }

    public void setOauthId(String oauthId) {
        this.oauthId = oauthId;
    }

    public String getOauthProvider() {
        return oauthProvider;
    }

    public void setOauthProvider(String oauthProvider) {
        this.oauthProvider = oauthProvider;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public Integer getExperienceYears() {
        return experienceYears;
    }

    public void setExperienceYears(Integer experienceYears) {
        this.experienceYears = experienceYears;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public BigDecimal getStarRate() {
        return starRate;
    }

    public void setStarRate(BigDecimal starRate) {
        this.starRate = starRate;
    }

    public BigDecimal getAmountWallet() {
        return amountWallet;
    }

    public void setAmountWallet(BigDecimal amountWallet) {
        this.amountWallet = amountWallet;
    }

    public String getVerifiedLink() {
        return verifiedLink;
    }

    public void setVerifiedLink(String verifiedLink) {
        this.verifiedLink = verifiedLink;
    }

    public boolean isVerifiedAccount() {
        return verifiedAccount;
    }

    public void setVerifiedAccount(boolean verifiedAccount) {
        this.verifiedAccount = verifiedAccount;
    }

    public BigDecimal getCompletePercent() {
        return completePercent;
    }

    public void setCompletePercent(BigDecimal completePercent) {
        this.completePercent = completePercent;
    }

    public String getLabelTag() {
        return labelTag;
    }

    public void setLabelTag(String labelTag) {
        this.labelTag = labelTag;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getTypeAccount() {
        return typeAccount;
    }

    public void setTypeAccount(String typeAccount) {
        this.typeAccount = typeAccount;
    }

    public String getLevelAccount() {
        return levelAccount;
    }

    public void setLevelAccount(String levelAccount) {
        this.levelAccount = levelAccount;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public LocalDateTime getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(LocalDateTime joinDate) {
        this.joinDate = joinDate;
    }

    public Integer getCountMember() {
        return countMember;
    }

    public void setCountMember(Integer countMember) {
        this.countMember = countMember;
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
                ", avatar='" + avatar + '\'' +
                ", oauthId='" + oauthId + '\'' +
                ", oauthProvider='" + oauthProvider + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", education='" + education + '\'' +
                ", speciality='" + speciality + '\'' +
                ", experienceYears=" + experienceYears +
                ", skills='" + skills + '\'' +
                ", bio='" + bio + '\'' +
                ", point=" + point +
                ", starRate=" + starRate +
                ", amountWallet=" + amountWallet +
                ", verifiedLink='" + verifiedLink + '\'' +
                ", verifiedAccount=" + verifiedAccount +
                ", completePercent=" + completePercent +
                ", labelTag='" + labelTag + '\'' +
                ", count=" + count +
                ", role='" + role + '\'' +
                ", typeAccount='" + typeAccount + '\'' +
                ", levelAccount='" + levelAccount + '\'' +
                ", signature='" + signature + '\'' +
                ", joinDate=" + joinDate +
                ", countMember=" + countMember +
                ", status='" + status + '\'' +
                '}';
    }
}
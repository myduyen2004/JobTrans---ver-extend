package jobtrans.model;

import java.util.Date;

public class GroupMember {
    private int memberId;
    private String memberName;
    private int accountId;
    private String bio;
    private Date dateOfBirth;
    private String specialist;
    private String gender;
    private int experienceYears;
    private String status;
    private String education;
    private String avatarMember;
    private String position;


    // Constructor không tham số
    public GroupMember() {}

    // Constructor có tham số


    public GroupMember(int memberId, String memberName, int accountId, String bio, Date dateOfBirth, String specialist, String gender, int experienceYears, String status, String education, String avatarMember, String position) {
        this.memberId = memberId;
        this.memberName = memberName;
        this.accountId = accountId;
        this.bio = bio;
        this.dateOfBirth = dateOfBirth;
        this.specialist = specialist;
        this.gender = gender;
        this.experienceYears = experienceYears;
        this.status = status;
        this.education = education;
        this.avatarMember = avatarMember;
        this.position = position;
    }

    // Getter và Setter
    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public java.sql.Date getDateOfBirth() {
        return new java.sql.Date(dateOfBirth.getTime());
    }


    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getSpecialist() {
        return specialist;
    }

    public void setSpecialist(String specialist) {
        this.specialist = specialist;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getExperienceYears() {
        return experienceYears;
    }

    public void setExperienceYears(int experienceYears) {
        this.experienceYears = experienceYears;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getAvatarMember() {
        return avatarMember;
    }

    public void setAvatarMember(String avatarMember) {
        this.avatarMember = avatarMember;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Override
    public String toString() {
        return "GroupMember{" +
                "memberId=" + memberId +
                ", memberName='" + memberName + '\'' +
                ", accountId=" + accountId +
                ", bio='" + bio + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", specialist='" + specialist + '\'' +
                ", gender='" + gender + '\'' +
                ", experienceYears=" + experienceYears +
                ", status='" + status + '\'' +
                ", education='" + education + '\'' +
                ", avatarMember='" + avatarMember + '\'' +
                ", position='" + position + '\'' +
                '}';
    }
}
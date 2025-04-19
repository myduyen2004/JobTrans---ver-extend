package jobtrans.model;

import java.util.Date;

public class GroupMember {
    private int memberId;
    private String memberName;
    private int accountId;
    private String avatarMember;
    private String gender;
    private Date dateOfBirth;
    private String phone;
    private String address;
    private String position;
    private String speciality;
    private Integer experienceYears;
    private String skills;
    private String bio;
    private String education;
    private String status;

    // Constructors
    public GroupMember() {
    }

    public GroupMember(int memberId, String memberName, int accountId, String avatarMember,
                       String gender, Date dateOfBirth, String phone, String address,
                       String position, String speciality, Integer experienceYears,
                       String skills, String bio, String education, String status) {
        this.memberId = memberId;
        this.memberName = memberName;
        this.accountId = accountId;
        this.avatarMember = avatarMember;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phone = phone;
        this.address = address;
        this.position = position;
        this.speciality = speciality;
        this.experienceYears = experienceYears;
        this.skills = skills;
        this.bio = bio;
        this.education = education;
        this.status = status;
    }

    // Getters and Setters
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

    public String getAvatarMember() {
        return avatarMember;
    }

    public void setAvatarMember(String avatarMember) {
        this.avatarMember = avatarMember;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
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

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
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

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "GroupMember{" +
                "memberId=" + memberId +
                ", memberName='" + memberName + '\'' +
                ", accountId=" + accountId +
                ", avatarMember='" + avatarMember + '\'' +
                ", gender='" + gender + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", position='" + position + '\'' +
                ", speciality='" + speciality + '\'' +
                ", experienceYears=" + experienceYears +
                ", skills='" + skills + '\'' +
                ", bio='" + bio + '\'' +
                ", education='" + education + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}

package jobtrans.model;

import java.util.Date;
import java.util.List;

public class CV {
    private int cvId;
    private String cvName;
    private int accountId;
    private String jobPosition;
    private String summary;
    private Date createdAt;
    private String cvUpload;
    private String backroundColor;
    private String moreInfo;

    private String sex;
    private Date dateOfBirth;
    private String sdt;
    private String email;
    private String address;
    private String avatarCv;


    private int cvType;


    private List<Skill> skillList;
    private List<Education> educationList;
    private List<Certification> certificationList;
    private List<Experience> experienceList;


    public CV() {
    }

    public CV(int cvId, int accountId, String jobPosition, String summary, Date createdAt) {
        this.cvId = cvId;
        this.accountId = accountId;
        this.jobPosition = jobPosition;
        this.summary = summary;
        this.createdAt = createdAt;
    }

    public CV(int cvId, String cvName, int accountId, String jobPosition, String summary, Date createdAt, String cvUpload, String backroundColor, String moreInfo, String sex, Date dateOfBirth, String sdt, String email, String address, String avatarCv, int cvType, List<Skill> skillList, List<Education> educationList, List<Certification> certificationList, List<Experience> experienceList) {
        this.cvId = cvId;
        this.cvName = cvName;
        this.accountId = accountId;
        this.jobPosition = jobPosition;
        this.summary = summary;
        this.createdAt = createdAt;
        this.cvUpload = cvUpload;
        this.backroundColor = backroundColor;
        this.moreInfo = moreInfo;
        this.sex = sex;
        this.dateOfBirth = dateOfBirth;
        this.sdt = sdt;
        this.email = email;
        this.address = address;
        this.avatarCv = avatarCv;
        this.cvType = cvType;
        this.skillList = skillList;
        this.educationList = educationList;
        this.certificationList = certificationList;
        this.experienceList = experienceList;
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public String getCvName() {
        return cvName;
    }

    public void setCvName(String cvName) {
        this.cvName = cvName;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getJobPosition() {
        return jobPosition;
    }

    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getCvUpload() {
        return cvUpload;
    }

    public void setCvUpload(String cvUpload) {
        this.cvUpload = cvUpload;
    }

    public String getBackroundColor() {
        return backroundColor;
    }

    public void setBackroundColor(String backroundColor) {
        this.backroundColor = backroundColor;
    }

    public String getMoreInfo() {
        return moreInfo;
    }

    public void setMoreInfo(String moreInfo) {
        this.moreInfo = moreInfo;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatarCv() {
        return avatarCv;
    }

    public void setAvatarCv(String avatarCv) {
        this.avatarCv = avatarCv;
    }

    public int getCvType() {
        return cvType;
    }

    public void setCvType(int cvType) {
        this.cvType = cvType;
    }

    public List<Skill> getSkillList() {
        return skillList;
    }

    public void setSkillList(List<Skill> skillList) {
        this.skillList = skillList;
    }

    public List<Education> getEducationList() {
        return educationList;
    }

    public void setEducationList(List<Education> educationList) {
        this.educationList = educationList;
    }

    public List<Certification> getCertificationList() {
        return certificationList;
    }

    public void setCertificationList(List<Certification> certificationList) {
        this.certificationList = certificationList;
    }

    public List<Experience> getExperienceList() {
        return experienceList;
    }

    public void setExperienceList(List<Experience> experienceList) {
        this.experienceList = experienceList;
    }

    @Override
    public String toString() {
        return "CV{" +
                "cvId=" + cvId +
                ", cvName='" + cvName + '\'' +
                ", accountId=" + accountId +
                ", jobPosition='" + jobPosition + '\'' +
                ", summary='" + summary + '\'' +
                ", createdAt=" + createdAt +
                ", cvUpload='" + cvUpload + '\'' +
                ", backroundColor='" + backroundColor + '\'' +
                ", moreInfo='" + moreInfo + '\'' +
                ", sex='" + sex + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", sdt='" + sdt + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", avatarCv='" + avatarCv + '\'' +
                ", cvType=" + cvType +
                ", skillList=" + skillList +
                ", educationList=" + educationList +
                ", certificationList=" + certificationList +
                ", experienceList=" + experienceList +
                '}';
    }
}

package jobtrans.model;

import java.util.Date;
import java.util.List;

public class CV {
    private int cvId;
    private int accountId;
    private String jobPosition;
    private String summary;
    private Date createdAt;
    private String cvUpload;

    private List<Skill> skills;
    private List<Education> educationList;
    private List<Certification> certifications;
    private List<Experience> experiences;

    // Constructor không tham số
    public CV() {}

    // Constructor có tham số
    public CV(int cvId, int accountId, String jobPosition, String summary, Date createdAt, String cvUpload,
              List<Skill> skills, List<Education> educationList, List<Certification> certifications, List<Experience> experiences) {
        this.cvId = cvId;
        this.accountId = accountId;
        this.jobPosition = jobPosition;
        this.summary = summary;
        this.createdAt = createdAt;
        this.cvUpload = cvUpload;
        this.skills = skills;
        this.educationList = educationList;
        this.certifications = certifications;
        this.experiences = experiences;
    }

    // Getter và Setter
    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
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

    public List<Skill> getSkills() {
        return skills;
    }

    public void setSkills(List<Skill> skills) {
        this.skills = skills;
    }

    public List<Education> getEducationList() {
        return educationList;
    }

    public void setEducationList(List<Education> educationList) {
        this.educationList = educationList;
    }

    public List<Certification> getCertifications() {
        return certifications;
    }

    public void setCertifications(List<Certification> certifications) {
        this.certifications = certifications;
    }

    public List<Experience> getExperiences() {
        return experiences;
    }

    public void setExperiences(List<Experience> experiences) {
        this.experiences = experiences;
    }

    @Override
    public String toString() {
        return "CV{" +
                "cvId=" + cvId +
                ", accountId=" + accountId +
                ", jobPosition='" + jobPosition + '\'' +
                ", summary='" + summary + '\'' +
                ", createdAt=" + createdAt +
                ", cvUpload='" + cvUpload + '\'' +
                ", skills=" + skills +
                ", educationList=" + educationList +
                ", certifications=" + certifications +
                ", experiences=" + experiences +
                '}';
    }
}

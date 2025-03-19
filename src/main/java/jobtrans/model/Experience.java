package jobtrans.model;

import java.util.Date;

public class Experience {
    private int experienceId;
    private int cvId; // Liên kết với CV
    private String companyName;
    private Date startAt;
    private Date endAt;
    private String customCompany;
    private String jobPosition;
    private String address;
    private String description;

    // Constructor không tham số
    public Experience() {}

    // Constructor có tham số đầy đủ
    public Experience(int experienceId, int cvId, String companyName, Date startAt, Date endAt,
                      String customCompany, String jobPosition, String address, String description) {
        this.experienceId = experienceId;
        this.cvId = cvId;
        this.companyName = companyName;
        this.startAt = startAt;
        this.endAt = endAt;
        this.customCompany = customCompany;
        this.jobPosition = jobPosition;
        this.address = address;
        this.description = description;
    }

    // Getter và Setter
    public int getExperienceId() {
        return experienceId;
    }

    public void setExperienceId(int experienceId) {
        this.experienceId = experienceId;
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Date getStartAt() {
        return startAt;
    }

    public void setStartAt(Date startAt) {
        this.startAt = startAt;
    }

    public Date getEndAt() {
        return endAt;
    }

    public void setEndAt(Date endAt) {
        this.endAt = endAt;
    }

    public String getCustomCompany() {
        return customCompany;
    }

    public void setCustomCompany(String customCompany) {
        this.customCompany = customCompany;
    }

    public String getJobPosition() {
        return jobPosition;
    }

    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Phương thức toString để hiển thị thông tin kinh nghiệm làm việc
    @Override
    public String toString() {
        return "Experience{" +
                "experienceId=" + experienceId +
                ", cvId=" + cvId +
                ", companyName='" + companyName + '\'' +
                ", startAt=" + startAt +
                ", endAt=" + endAt +
                ", customCompany='" + customCompany + '\'' +
                ", jobPosition='" + jobPosition + '\'' +
                ", address='" + address + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}

package jobtrans.model;

import java.util.Date;

public class Education {
    private int educationId;
    private String schoolName;
    private Date startDate;
    private Date endDate;
    private String fieldOfStudy;
    private String degree;
    private String customSchool;

    // Constructor
    public Education(int educationId, String schoolName, Date startDate, Date endDate, String fieldOfStudy, String degree, String customSchool) {
        this.educationId = educationId;
        this.schoolName = schoolName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.fieldOfStudy = fieldOfStudy;
        this.degree = degree;
        this.customSchool = customSchool;
    }

    // Getter và Setter
    public int getEducationId() {
        return educationId;
    }

    public void setEducationId(int educationId) {
        this.educationId = educationId;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getFieldOfStudy() {
        return fieldOfStudy;
    }

    public void setFieldOfStudy(String fieldOfStudy) {
        this.fieldOfStudy = fieldOfStudy;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getCustomSchool() {
        return customSchool;
    }

    public void setCustomSchool(String customSchool) {
        this.customSchool = customSchool;
    }

    @Override
    public String toString() {
        return "Education{" +
                "educationId=" + educationId +
                ", schoolName='" + schoolName + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", fieldOfStudy='" + fieldOfStudy + '\'' +
                ", degree='" + degree + '\'' +
                ", customSchool='" + customSchool + '\'' +
                '}';
    }
}

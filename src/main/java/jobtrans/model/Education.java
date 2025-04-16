package jobtrans.model;

import java.util.Date;

public class Education {
    private int educationId;
    private String schoolName;
    private Date startDate;
    private Date endDate;
    private String fieldOfStudy;
    private String degree;
    private String moreInfor;
    private String customSchool;


    // Constructor


    public Education() {
    }
    public Education(int educationId, String schoolName, Date startDate, Date endDate, String fieldOfStudy, String degree, String moreInfor, String customSchool) {
        this.educationId = educationId;
        this.schoolName = schoolName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.fieldOfStudy = fieldOfStudy;
        this.degree = degree;
        this.moreInfor = moreInfor;
        this.customSchool = customSchool;
    }
    // Getters and Setters


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

    public String getMoreInfor() {
        return moreInfor;
    }

    public void setMoreInfor(String moreInfor) {
        this.moreInfor = moreInfor;
    }

    public String getCustomSchool() {
        return customSchool;
    }

    public void setCustomSchool(String customSchool) {
        this.customSchool = customSchool;
    }
}

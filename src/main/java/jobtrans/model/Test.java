package jobtrans.model;

import java.util.Date;

public class Test {
    private int testId;
    private int jobId;
    private String testLink;
    private boolean isRequired;
    private Date createdAt;

    // Constructors
    public Test() {
    }

    public Test(int testId, int jobId, String testLink, boolean isRequired, Date createdAt) {
        this.testId = testId;
        this.jobId = jobId;
        this.testLink = testLink;
        this.isRequired = isRequired;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getTestLink() {
        return testLink;
    }

    public void setTestLink(String testLink) {
        this.testLink = testLink;
    }

    public boolean isRequired() {
        return isRequired;
    }

    public void setRequired(boolean isRequired) {
        this.isRequired = isRequired;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}

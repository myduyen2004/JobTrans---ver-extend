package jobtrans.model;

import java.util.Date;

public class Test {
    private int testId;
    private int jobId;
    private String testLink;
    private boolean haveRequired;
    private Date createdAt;

    // Constructors
    public Test() {
    }

    public Test(int testId, int jobId, String testLink, boolean haveRequired, Date createdAt) {
        this.testId = testId;
        this.jobId = jobId;
        this.testLink = testLink;
        this.haveRequired = haveRequired;
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

    public boolean isHaveRequired() {
        return haveRequired;
    }

    public void setHaveRequired(boolean haveRequired) {
        this.haveRequired = haveRequired;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}

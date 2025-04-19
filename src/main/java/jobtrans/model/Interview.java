package jobtrans.model;

import java.util.Date;

public class Interview {
    private int interviewId;
    private Date startDate;
    private String interviewLink;
    private String interviewRecord;
    private int jobId;

    public Interview() {
    }

    public Interview(int interviewId, Date startDate, String interviewLink, String interviewRecord, int jobId) {
        this.interviewId = interviewId;
        this.startDate = startDate;
        this.interviewLink = interviewLink;
        this.interviewRecord = interviewRecord;
        this.jobId = jobId;
    }

    public int getInterviewId() {
        return interviewId;
    }

    public void setInterviewId(int interviewId) {
        this.interviewId = interviewId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getInterviewLink() {
        return interviewLink;
    }

    public void setInterviewLink(String interviewLink) {
        this.interviewLink = interviewLink;
    }

    public String getInterviewRecord() {
        return interviewRecord;
    }

    public void setInterviewRecord(String interviewRecord) {
        this.interviewRecord = interviewRecord;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }
}

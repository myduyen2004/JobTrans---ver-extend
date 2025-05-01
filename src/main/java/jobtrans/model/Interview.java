package jobtrans.model; // Thay đổi theo package của bạn

import java.sql.Date;
import java.sql.Time;

public class Interview {
    private int interviewId;
    private Date interviewDate;
    private Time interviewTime;
    private String interviewForm;
    private String interviewAddress;
    private String interviewLink;
    private String interviewRecord;
    private String interviewNote;
    private int jobId;
    private int greetingId;

    // Constructor mặc định
    public Interview() {
    }

    // Constructor đầy đủ
    public Interview(int interviewId, Date interviewDate, Time interviewTime, String interviewForm,
                     String interviewAddress, String interviewLink, String interviewRecord,
                     String interviewNote, int jobId, int greetingId) {
        this.interviewId = interviewId;
        this.interviewDate = interviewDate;
        this.interviewTime = interviewTime;
        this.interviewForm = interviewForm;
        this.interviewAddress = interviewAddress;
        this.interviewLink = interviewLink;
        this.interviewRecord = interviewRecord;
        this.interviewNote = interviewNote;
        this.jobId = jobId;
        this.greetingId = greetingId;
    }

    // Getters và setters
    public int getInterviewId() {
        return interviewId;
    }

    public void setInterviewId(int interviewId) {
        this.interviewId = interviewId;
    }

    public Date getInterviewDate() {
        return interviewDate;
    }

    public void setInterviewDate(Date interviewDate) {
        this.interviewDate = interviewDate;
    }

    public Time getInterviewTime() {
        return interviewTime;
    }

    public void setInterviewTime(Time interviewTime) {
        this.interviewTime = interviewTime;
    }

    public String getInterviewForm() {
        return interviewForm;
    }

    public void setInterviewForm(String interviewForm) {
        this.interviewForm = interviewForm;
    }

    public String getInterviewAddress() {
        return interviewAddress;
    }

    public void setInterviewAddress(String interviewAddress) {
        this.interviewAddress = interviewAddress;
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

    public String getInterviewNote() {
        return interviewNote;
    }

    public void setInterviewNote(String interviewNote) {
        this.interviewNote = interviewNote;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getGreetingId() {
        return greetingId;
    }

    public void setGreetingId(int greetingId) {
        this.greetingId = greetingId;
    }

    @Override
    public String toString() {
        return "Interview{" +
                "interviewId=" + interviewId +
                ", interviewDate=" + interviewDate +
                ", interviewTime=" + interviewTime +
                ", interviewForm='" + interviewForm + '\'' +
                ", interviewAddress='" + interviewAddress + '\'' +
                ", interviewLink='" + interviewLink + '\'' +
                ", interviewRecord='" + interviewRecord + '\'' +
                ", interviewNote='" + interviewNote + '\'' +
                ", jobId=" + jobId +
                ", greetingId=" + greetingId +
                '}';
    }

}
package jobtrans.model;

import java.util.Date;

public class Feedback {
    private int feedbackId;
    private int jobId;
    private int fromUserId;
    private int toUserId;
    private int rating;
    private String content;
    private Date createdAt;
    private String type; // "EmployerToSeeker" hoặc "SeekerToEmployer"

    public Feedback() {
    }

    public Feedback(int feedbackId, int jobId, int fromUserId, int toUserId, int rating,
                    String content, Date createdAt, String type) {
        this.feedbackId = feedbackId;
        this.jobId = jobId;
        this.fromUserId = fromUserId;
        this.toUserId = toUserId;
        this.rating = rating;
        this.content = content;
        this.createdAt = createdAt;
        this.type = type;
    }

    // Getters and Setters
    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getFromUserId() {
        return fromUserId;
    }

    public void setFromUserId(int fromUserId) {
        this.fromUserId = fromUserId;
    }

    public int getToUserId() {
        return toUserId;
    }

    public void setToUserId(int toUserId) {
        this.toUserId = toUserId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "feedbackId=" + feedbackId +
                ", jobId=" + jobId +
                ", fromUserId=" + fromUserId +
                ", toUserId=" + toUserId +
                ", rating=" + rating +
                ", content='" + content + '\'' +
                ", createdAt=" + createdAt +
                ", type='" + type + '\'' +
                '}';
    }
}

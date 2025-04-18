package jobtrans.model;

import java.util.Date;

public class CancelRequest {
    private int cancelRequestId;
    private int jobId;
    private int requesterId;
    private String reason;
    private Date createdAt;
    private boolean haveApproved;

    // Constructors
    public CancelRequest() {
    }

    public CancelRequest(int cancelRequestId, int jobId, int requesterId, String reason, Date createdAt, boolean haveApproved) {
        this.cancelRequestId = cancelRequestId;
        this.jobId = jobId;
        this.requesterId = requesterId;
        this.reason = reason;
        this.createdAt = createdAt;
        this.haveApproved = haveApproved;
    }

    // Getters and Setters
    public int getCancelRequestId() {
        return cancelRequestId;
    }

    public void setCancelRequestId(int cancelRequestId) {
        this.cancelRequestId = cancelRequestId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getRequesterId() {
        return requesterId;
    }

    public void setRequesterId(int requesterId) {
        this.requesterId = requesterId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isHaveApproved() {
        return haveApproved;
    }

    public void setHaveApproved(boolean haveApproved) {
        this.haveApproved = haveApproved;
    }
}

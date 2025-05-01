package jobtrans.model;

import jdk.jfr.Category;

import java.math.BigDecimal;
import java.util.Date;

public class Transaction {
    private int transactionId;
    private int senderId;
    private int receiverId;
    private Integer jobId;
    private BigDecimal amount;
    private Date createdDate;
    private String description;
    private String transactionType;
    private boolean status;
    private JobCategory category;

    public JobCategory getCategory() {
        return category;
    }

    public void setCategory(JobCategory category) {
        this.category = category;
    }

    public Transaction() {
    }

    public Transaction(int senderId, int receiverId, Integer jobId, BigDecimal amount, Date createdDate, String description, String transactionType, boolean status, JobCategory category) {
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.jobId = jobId;
        this.amount = amount;
        this.createdDate = createdDate;
        this.description = description;
        this.transactionType = transactionType;
        this.status = status;
        this.category = category;
    }

    public Transaction(int transactionId, int senderId, int receiverId, Integer jobId, BigDecimal amount, Date createdDate,
                       String description, String transactionType, boolean status) {
        this.transactionId = transactionId;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.jobId = jobId;
        this.amount = amount;
        this.createdDate = createdDate;
        this.description = description;
        this.transactionType = transactionType;
        this.status = status;
    }

    // Getters and Setters

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Transaction{" +
                "transactionId=" + transactionId +
                ", senderId=" + senderId +
                ", receiverId=" + receiverId +
                ", jobId=" + jobId +
                ", amount=" + amount +
                ", createdDate=" + createdDate +
                ", description='" + description + '\'' +
                ", transactionType='" + transactionType + '\'' +
                ", status=" + status +
                '}';
    }
}

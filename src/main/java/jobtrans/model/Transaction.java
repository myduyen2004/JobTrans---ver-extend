package jobtrans.model;

import java.sql.Timestamp;

public class Transaction {
    private int transactionId;
    private int senderId;
    private int receiverId;
    private int jobId;
    private double amount;
    private java.sql.Timestamp createdDate;
    private String transactionType;
    private String description;
    private String status;

    // Constructor
    public Transaction(int transactionId, int senderId, int receiverId, int jobId, double amount,
                       java.sql.Timestamp createdDate, String transactionType, String description, String status) {
        this.transactionId = transactionId;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.jobId = jobId;
        this.amount = amount;
        this.createdDate = createdDate;
        this.transactionType = transactionType;
        this.description = description;
        this.status = status;
    }

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

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

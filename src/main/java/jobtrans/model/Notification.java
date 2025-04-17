package jobtrans.model;

import java.util.Date;

public class Notification {
    private int notificationId;
    private int accountId;
    private String notificationTitle;
    private String notificationContent;
    private Date notificationTime;
    private boolean isRead;

    // Constructors
    public Notification() {
    }

    public Notification(int notificationId, int accountId, String notificationTitle, String notificationContent, Date notificationTime, boolean isRead) {
        this.notificationId = notificationId;
        this.accountId = accountId;
        this.notificationTitle = notificationTitle;
        this.notificationContent = notificationContent;
        this.notificationTime = notificationTime;
        this.isRead = isRead;
    }

    // Getters and Setters
    public int getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getNotificationTitle() {
        return notificationTitle;
    }

    public void setNotificationTitle(String notificationTitle) {
        this.notificationTitle = notificationTitle;
    }

    public String getNotificationContent() {
        return notificationContent;
    }

    public void setNotificationContent(String notificationContent) {
        this.notificationContent = notificationContent;
    }

    public Date getNotificationTime() {
        return notificationTime;
    }

    public void setNotificationTime(Date notificationTime) {
        this.notificationTime = notificationTime;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean isRead) {
        this.isRead = isRead;
    }
}

package jobtrans.model;

import java.time.LocalDateTime;

public class Notification {
    private int notificationId;
    private int accountId;
    private String notificationTitle;
    private String notificationContent;
    private String notificationType; // "Giao dịch", "Hệ thống", "Tương tác"
    private LocalDateTime notificationTime;
    private boolean haveRead;
    private String linkDetail;

    public String getLinkDetail() {
        return linkDetail;
    }

    public void setLinkDetail(String linkDetail) {
        this.linkDetail = linkDetail;
    }

    public Notification() {
    }

    public Notification(int notificationId, int accountId, String notificationTitle,
                        String notificationContent, String notificationType,
                        LocalDateTime notificationTime, boolean haveRead, String linkDetail) {
        this.notificationId = notificationId;
        this.accountId = accountId;
        this.notificationTitle = notificationTitle;
        this.notificationContent = notificationContent;
        this.notificationType = notificationType;
        this.notificationTime = notificationTime;
        this.haveRead = haveRead;
        this.linkDetail = linkDetail;
    }


    // Getter và Setter

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

    public String getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(String notificationType) {
        this.notificationType = notificationType;
    }

    public LocalDateTime getNotificationTime() {
        return notificationTime;
    }

    public void setNotificationTime(LocalDateTime notificationTime) {
        this.notificationTime = notificationTime;
    }

    public boolean isHaveRead() {
        return haveRead;
    }

    public void setHaveRead(boolean haveRead) {
        this.haveRead = haveRead;
    }
}

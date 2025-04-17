package jobtrans.model;

import java.util.Date;

public class PointHistory {
    private int historyId;
    private int accountId;
    private int criteriaId;
    private Date time;
    private String pointNote;

    // Constructors
    public PointHistory() {
    }

    public PointHistory(int historyId, int accountId, int criteriaId, Date time, String pointNote) {
        this.historyId = historyId;
        this.accountId = accountId;
        this.criteriaId = criteriaId;
        this.time = time;
        this.pointNote = pointNote;
    }

    // Getters and Setters
    public int getHistoryId() {
        return historyId;
    }

    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getCriteriaId() {
        return criteriaId;
    }

    public void setCriteriaId(int criteriaId) {
        this.criteriaId = criteriaId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPointNote() {
        return pointNote;
    }

    public void setPointNote(String pointNote) {
        this.pointNote = pointNote;
    }
}

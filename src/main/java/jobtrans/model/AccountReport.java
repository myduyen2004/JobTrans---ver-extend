package jobtrans.model;

import java.util.Date;

public class AccountReport {
    private int accountReportId;
    private int reportedAccount;
    private int reportBy;
    private int criteriaId;
    private String contentReport;
    private String attachment;
    private Date reportTime;
    private String status;

    // Constructors
    public AccountReport() {
    }

    public AccountReport(int accountReportId, int reportedAccount, int reportBy, int criteriaId,
                         String contentReport, String attachment, Date reportTime, String status) {
        this.accountReportId = accountReportId;
        this.reportedAccount = reportedAccount;
        this.reportBy = reportBy;
        this.criteriaId = criteriaId;
        this.contentReport = contentReport;
        this.attachment = attachment;
        this.reportTime = reportTime;
        this.status = status;
    }

    // Getters and Setters
    public int getAccountReportId() {
        return accountReportId;
    }

    public void setAccountReportId(int accountReportId) {
        this.accountReportId = accountReportId;
    }

    public int getReportedAccount() {
        return reportedAccount;
    }

    public void setReportedAccount(int reportedAccount) {
        this.reportedAccount = reportedAccount;
    }

    public int getReportBy() {
        return reportBy;
    }

    public void setReportBy(int reportBy) {
        this.reportBy = reportBy;
    }

    public int getCriteriaId() {
        return criteriaId;
    }

    public void setCriteriaId(int criteriaId) {
        this.criteriaId = criteriaId;
    }

    public String getContentReport() {
        return contentReport;
    }

    public void setContentReport(String contentReport) {
        this.contentReport = contentReport;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

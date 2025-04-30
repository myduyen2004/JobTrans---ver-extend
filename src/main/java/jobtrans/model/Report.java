package jobtrans.model;

import java.sql.Timestamp;

public class Report {
    private int reportId;
    private Integer jobId;
    private int reportedAccount;
    private int reportBy;
    private int criteriaId;
    private String contentReport;
    private String attachment;
    private Timestamp reportTime;
    private String status;

    public Report() {
    }

    public Report(int reportId, Integer jobId, int reportedAccount, int reportBy, int criteriaId,
                  String contentReport, String attachment, Timestamp reportTime, String status) {
        this.reportId = reportId;
        this.jobId = jobId;
        this.reportedAccount = reportedAccount;
        this.reportBy = reportBy;
        this.criteriaId = criteriaId;
        this.contentReport = contentReport;
        this.attachment = attachment;
        this.reportTime = reportTime;
        this.status = status;
    }

    public int getReportId() {
        return reportId;
    }

    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
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

    public Timestamp getReportTime() {
        return reportTime;
    }

    public void setReportTime(Timestamp reportTime) {
        this.reportTime = reportTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

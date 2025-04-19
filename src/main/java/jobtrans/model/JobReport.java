package jobtrans.model;

public class JobReport {
    private int jobReportId;
    private int jobId;
    private int reportedAccount;
    private int reportedBy;
    private Integer criteriaId; // nullable
    private String contentReport;
    private String attachment;
    private String status;

    public JobReport() {
    }

    public JobReport(int jobReportId, int jobId, int reportedAccount, int reportedBy, Integer criteriaId,
                     String contentReport, String attachment, String status) {
        this.jobReportId = jobReportId;
        this.jobId = jobId;
        this.reportedAccount = reportedAccount;
        this.reportedBy = reportedBy;
        this.criteriaId = criteriaId;
        this.contentReport = contentReport;
        this.attachment = attachment;
        this.status = status;
    }

    // Getters and Setters
    public int getJobReportId() {
        return jobReportId;
    }

    public void setJobReportId(int jobReportId) {
        this.jobReportId = jobReportId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getReportedAccount() {
        return reportedAccount;
    }

    public void setReportedAccount(int reportedAccount) {
        this.reportedAccount = reportedAccount;
    }

    public int getReportedBy() {
        return reportedBy;
    }

    public void setReportedBy(int reportedBy) {
        this.reportedBy = reportedBy;
    }

    public Integer getCriteriaId() {
        return criteriaId;
    }

    public void setCriteriaId(Integer criteriaId) {
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

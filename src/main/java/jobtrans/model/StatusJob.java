package jobtrans.model;

public class StatusJob {
    private int statusJobId;
    private String statusJobName;
    private String statusJobDescription;

    public StatusJob() {
    }

    public StatusJob(int statusJobId, String statusJobName, String statusJobDescription) {
        this.statusJobId = statusJobId;
        this.statusJobName = statusJobName;
        this.statusJobDescription = statusJobDescription;
    }

    public int getStatusJobId() {
        return statusJobId;
    }

    public void setStatusJobId(int statusJobId) {
        this.statusJobId = statusJobId;
    }

    public String getStatusJobName() {
        return statusJobName;
    }

    public void setStatusJobName(String statusJobName) {
        this.statusJobName = statusJobName;
    }

    public String getStatusJobDescription() {
        return statusJobDescription;
    }

    public void setStatusJobDescription(String statusJobDescription) {
        this.statusJobDescription = statusJobDescription;
    }
}

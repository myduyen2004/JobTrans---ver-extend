package jobtrans.model;

public class JobGreeting {
    private int greetingId;
    private int jobSeekerId;
    private int jobId;
    private int cvId;
    private int price;
    private int expectedDay;
    private String introduction;
    private String attachment;
    private boolean haveRead;
    private String status;

    // Constructors
    public JobGreeting() {
    }

    public JobGreeting(int greetingId, int jobSeekerId, int jobId, int cvId, int price, int expectedDay,
                       String introduction, String attachment, boolean haveRead, String status) {
        this.greetingId = greetingId;
        this.jobSeekerId = jobSeekerId;
        this.jobId = jobId;
        this.cvId = cvId;
        this.price = price;
        this.expectedDay = expectedDay;
        this.introduction = introduction;
        this.attachment = attachment;
        this.haveRead = haveRead;
        this.status = status;
    }

    // Getters and Setters
    public int getGreetingId() {
        return greetingId;
    }

    public void setGreetingId(int greetingId) {
        this.greetingId = greetingId;
    }

    public int getJobSeekerId() {
        return jobSeekerId;
    }

    public void setJobSeekerId(int jobSeekerId) {
        this.jobSeekerId = jobSeekerId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getExpectedDay() {
        return expectedDay;
    }

    public void setExpectedDay(int expectedDay) {
        this.expectedDay = expectedDay;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public boolean isHaveRead() {
        return haveRead;
    }

    public void setHaveRead(boolean haveRead) {
        this.haveRead = haveRead;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "JobGreeting{" +
                "greetingId=" + greetingId +
                ", jobSeekerId=" + jobSeekerId +
                ", jobId=" + jobId +
                ", cvId=" + cvId +
                ", price=" + price +
                ", expectedDay=" + expectedDay +
                ", introduction='" + introduction + '\'' +
                ", attachment='" + attachment + '\'' +
                ", haveRead=" + haveRead +
                ", status='" + status + '\'' +
                '}';
    }
}

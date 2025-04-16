package jobtrans.model;

public class JobGreeting {
    private int greetingId;
    private int jobSeekerId;
    private int jobId;
    private String introduction;
    private String attachment;
    private int price;
    private String status;
    private int expectedDay;
    private String comments;
    private int cvId;

    public JobGreeting() {
    }

    public JobGreeting(int greetingId, int jobSeekerId, int jobId, String introduction, String attachment, int price, String status, int expectedDay, String comments, int cvId) {
        this.greetingId = greetingId;
        this.jobSeekerId = jobSeekerId;
        this.jobId = jobId;
        this.introduction = introduction;
        this.attachment = attachment;
        this.price = price;
        this.status = status;
        this.expectedDay = expectedDay;
        this.comments = comments;
        this.cvId = cvId;
    }


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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getExpectedDay() {
        return expectedDay;
    }

    public void setExpectedDay(int expectedDay) {
        this.expectedDay = expectedDay;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getCvId() {
        return cvId;
    }

    public void setCvId(int cvId) {
        this.cvId = cvId;
    }
}
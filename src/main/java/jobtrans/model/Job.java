package jobtrans.model;

import java.util.Date;

public class Job {
    private int jobId;
    private int postAccountId;
    private String jobTitle;
    private Date postDate;
    private String jobDescription;
    private int categoryId;
    private Float budgetMax;
    private Float budgetMin;
    private Date dueDatePost;
    private Date dueDateJob;
    private Boolean isInterviewed;
    private Boolean isTested;
    private Integer numOfMember;
    private Integer secureWallet;
    private String statusPost;
    private int statusJobId;

    // Constructors
    public Job() {
    }

    public Job(int jobId, int postAccountId, String jobTitle, Date postDate,
               String jobDescription, int categoryId, Float budgetMax,
               Float budgetMin, Date dueDatePost, Date dueDateJob,
               Boolean isInterviewed, Boolean isTested, Integer numOfMember,
               Integer secureWallet, String statusPost, int statusJobId) {
        this.jobId = jobId;
        this.postAccountId = postAccountId;
        this.jobTitle = jobTitle;
        this.postDate = postDate;
        this.jobDescription = jobDescription;
        this.categoryId = categoryId;
        this.budgetMax = budgetMax;
        this.budgetMin = budgetMin;
        this.dueDatePost = dueDatePost;
        this.dueDateJob = dueDateJob;
        this.isInterviewed = isInterviewed;
        this.isTested = isTested;
        this.numOfMember = numOfMember;
        this.secureWallet = secureWallet;
        this.statusPost = statusPost;
        this.statusJobId = statusJobId;
    }

    // Getters and Setters
    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getPostAccountId() {
        return postAccountId;
    }

    public void setPostAccountId(int postAccountId) {
        this.postAccountId = postAccountId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Float getBudgetMax() {
        return budgetMax;
    }

    public void setBudgetMax(Float budgetMax) {
        this.budgetMax = budgetMax;
    }

    public Float getBudgetMin() {
        return budgetMin;
    }

    public void setBudgetMin(Float budgetMin) {
        this.budgetMin = budgetMin;
    }

    public Date getDueDatePost() {
        return dueDatePost;
    }

    public void setDueDatePost(Date dueDatePost) {
        this.dueDatePost = dueDatePost;
    }

    public Date getDueDateJob() {
        return dueDateJob;
    }

    public void setDueDateJob(Date dueDateJob) {
        this.dueDateJob = dueDateJob;
    }

    public Boolean getIsInterviewed() {
        return isInterviewed;
    }

    public void setIsInterviewed(Boolean isInterviewed) {
        this.isInterviewed = isInterviewed;
    }

    public Boolean getIsTested() {
        return isTested;
    }

    public void setIsTested(Boolean isTested) {
        this.isTested = isTested;
    }

    public Integer getNumOfMember() {
        return numOfMember;
    }

    public void setNumOfMember(Integer numOfMember) {
        this.numOfMember = numOfMember;
    }

    public Integer getSecureWallet() {
        return secureWallet;
    }

    public void setSecureWallet(Integer secureWallet) {
        this.secureWallet = secureWallet;
    }

    public String getStatusPost() {
        return statusPost;
    }

    public void setStatusPost(String statusPost) {
        this.statusPost = statusPost;
    }

    public int getStatusJobId() {
        return statusJobId;
    }

    public void setStatusJobId(int statusJobId) {
        this.statusJobId = statusJobId;
    }
}

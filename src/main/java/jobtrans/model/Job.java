package jobtrans.model;

import jobtrans.model.CancelRequest;
import jobtrans.model.JobGreeting;
import jobtrans.model.JobReport;
import jobtrans.model.Tag;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class Job {
    private int jobId;
    private int postAccountId;
    private String jobTitle;
    private Timestamp postDate;
    private String jobDescription;
    private String attachment;
    private int categoryId;
    private BigDecimal budgetMax;
    private BigDecimal budgetMin;
    private Date dueDatePost;
    private Date dueDateJob;
    private boolean haveInterviewed;
    private boolean haveTested;
    private int numOfMember;
    private int secureWallet;
    private String statusPost;
    private int statusJobId;

    private List<Tag> tagList;
    private List<JobGreeting> jobGreetingList;
    private List<JobReport> jobReportList;
    private List<CancelRequest> cancelRequestList;

    public Job() {
    }

    public Job(int jobId, int postAccountId, String jobTitle, Timestamp postDate, String jobDescription,
               String attachment, int categoryId, BigDecimal budgetMax, BigDecimal budgetMin,
               Date dueDatePost, Date dueDateJob, boolean haveInterviewed, boolean haveTested,
               int numOfMember, int secureWallet, String statusPost, int statusJobId) {
        this.jobId = jobId;
        this.postAccountId = postAccountId;
        this.jobTitle = jobTitle;
        this.postDate = postDate;
        this.jobDescription = jobDescription;
        this.attachment = attachment;
        this.categoryId = categoryId;
        this.budgetMax = budgetMax;
        this.budgetMin = budgetMin;
        this.dueDatePost = dueDatePost;
        this.dueDateJob = dueDateJob;
        this.haveInterviewed = haveInterviewed;
        this.haveTested = haveTested;
        this.numOfMember = numOfMember;
        this.secureWallet = secureWallet;
        this.statusPost = statusPost;
        this.statusJobId = statusJobId;
    }

    // Getters và Setters

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

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public BigDecimal getBudgetMax() {
        return budgetMax;
    }

    public void setBudgetMax(BigDecimal budgetMax) {
        this.budgetMax = budgetMax;
    }

    public BigDecimal getBudgetMin() {
        return budgetMin;
    }

    public void setBudgetMin(BigDecimal budgetMin) {
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

    public boolean isHaveInterviewed() {
        return haveInterviewed;
    }

    public void setHaveInterviewed(boolean haveInterviewed) {
        this.haveInterviewed = haveInterviewed;
    }

    public boolean isHaveTested() {
        return haveTested;
    }

    public void setHaveTested(boolean haveTested) {
        this.haveTested = haveTested;
    }

    public int getNumOfMember() {
        return numOfMember;
    }

    public void setNumOfMember(int numOfMember) {
        this.numOfMember = numOfMember;
    }

    public int getSecureWallet() {
        return secureWallet;
    }

    public void setSecureWallet(int secureWallet) {
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

    public List<Tag> getTagList() {
        return tagList;
    }

    public void setTagList(List<Tag> tagList) {
        this.tagList = tagList;
    }

    public List<JobGreeting> getJobGreetingList() {
        return jobGreetingList;
    }

    public void setJobGreetingList(List<JobGreeting> jobGreetingList) {
        this.jobGreetingList = jobGreetingList;
    }

    public List<JobReport> getJobReportList() {
        return jobReportList;
    }

    public void setJobReportList(List<JobReport> jobReportList) {
        this.jobReportList = jobReportList;
    }

    public List<CancelRequest> getCancelRequestList() {
        return cancelRequestList;
    }

    public void setCancelRequestList(List<CancelRequest> cancelRequestList) {
        this.cancelRequestList = cancelRequestList;
    }
}

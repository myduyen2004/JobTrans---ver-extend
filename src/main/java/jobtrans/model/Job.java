package jobtrans.model;

import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

public class Job {
    private int jobId;
    private String jobTitle;
    private Date postDate;
    private String description;
    private int categoryId;
    private int jobTagId;
    private boolean isInterviewed;
    private double budgetMax;
    private double budgetMin;
    private Date dueDate;
    private String status;
    private int numOfMem;
    private int secureWallet;
    private boolean isTested;
    private int postAccountId;
    private JobCategory jobCategory;
    public Job() {
    }

    public Job(int jobId, String jobTitle, Date postDate, String description, int categoryId, int jobTagId, boolean isInterviewed, double budgetMax, double budgetMin, Date dueDate, String status, int numOfMem, int secureWallet, boolean isTested, int postAccountId) {
        this.jobId = jobId;
        this.jobTitle = jobTitle;
        this.postDate = postDate;
        this.description = description;
        this.categoryId = categoryId;
        this.jobTagId = jobTagId;
        this.isInterviewed = isInterviewed;
        this.budgetMax = budgetMax;
        this.budgetMin = budgetMin;
        this.dueDate = dueDate;
        this.status = status;
        this.numOfMem = numOfMem;
        this.secureWallet = secureWallet;
        this.isTested = isTested;
        this.postAccountId = postAccountId;
    }

    public JobCategory getJobCategory() {
        return jobCategory;
    }

    public void setJobCategory(JobCategory jobCategory) {
        this.jobCategory = jobCategory;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getJobTagId() {
        return jobTagId;
    }

    public void setJobTagId(int jobTagId) {
        this.jobTagId = jobTagId;
    }

    public boolean isInterviewed() {
        return isInterviewed;
    }

    public void setInterviewed(boolean interviewed) {
        isInterviewed = interviewed;
    }

    public String getFormattedBudgetMax() {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return currencyFormatter.format(budgetMax);
    }

    public double getBudgetMax() {
        return budgetMax;
    }

    public void setBudgetMax(double budgetMax) {
        this.budgetMax = budgetMax;
    }

    public double getBudgetMin() {
        return budgetMin;
    }

    public void setBudgetMin(double budgetMin) {
        this.budgetMin = budgetMin;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getNumOfMem() {
        return numOfMem;
    }

    public void setNumOfMem(int numOfMem) {
        this.numOfMem = numOfMem;
    }

    public int getSecureWallet() {
        return secureWallet;
    }

    public void setSecureWallet(int secureWallet) {
        this.secureWallet = secureWallet;
    }

    public boolean isTested() {
        return isTested;
    }

    public void setTested(boolean tested) {
        isTested = tested;
    }

    public int getPostAccountId() {
        return postAccountId;
    }

    public void setPostAccountId(int postAccountId) {
        this.postAccountId = postAccountId;
    }
    public static void main(String[] args) {
        // Tạo một đối tượng Job (hoặc class chứa budgetMax của bạn)
        Job job = new Job();
        job.setBudgetMax(15000000.50); // Ví dụ giá trị

        // Lấy giá trị gốc
        double originalBudget = job.getBudgetMax();
        System.out.println("Budget Max (gốc): " + originalBudget);

        // Lấy giá trị đã định dạng
        String formattedBudget = job.getFormattedBudgetMax();
        System.out.println("Budget Max (đã định dạng): " + formattedBudget);
    }
}

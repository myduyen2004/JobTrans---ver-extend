package jobtrans.dal;

import jobtrans.model.Job;
import jobtrans.model.JobGreeting;
import jobtrans.utils.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JobDAO {
    private final DBConnection dbConnection;
    List<Job> jobs = new ArrayList<>();
//tao setter
    public void setJobs(List<Job> jobs) {
        this.jobs = jobs;
    }

    public JobDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<JobGreeting> getJobGreetingByJobSeekerId(int jobSeekerId) {
        List<JobGreeting> list = new ArrayList<>();
        String sql = "SELECT * FROM JobGreeting WHERE job_seeker_id = ?";

        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobSeekerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                JobGreeting greeting = new JobGreeting();
                greeting.setGreetingId(rs.getInt("greeting_id"));
                greeting.setJobSeekerId(rs.getInt("job_seeker_id"));
                greeting.setJobId(rs.getInt("job_id"));
                greeting.setIntroduction(rs.getString("introduction"));
                greeting.setAttachment(rs.getString("attachment"));
                greeting.setPrice(rs.getInt("price"));
                greeting.setStatus(rs.getString("status"));
                greeting.setExpectedDay(rs.getInt("expectedDay"));
               // greeting.setComments(rs.getString("comments"));
                greeting.setCvId(rs.getInt("cv_id"));

                list.add(greeting);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Job getJobById(int jobId) {
        Job job = new Job();
        String sql = "SELECT * FROM Job WHERE job_id = ?";

        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                job.setJobId(rs.getInt("job_id"));
                job.setPostAccountId(rs.getInt("post_account_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setPostDate(Timestamp.valueOf(rs.getTimestamp("post_date").toLocalDateTime())); // Chuyển đổi Timestamp sang LocalDateTime (Java 8+)
                job.setJobDescription(rs.getString("job_description"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setBudgetMax(BigDecimal.valueOf(rs.getFloat("budget_max")));
                job.setBudgetMin(BigDecimal.valueOf(rs.getFloat("budget_min")));
                job.setDueDatePost(Date.valueOf(rs.getDate("due_date_post").toLocalDate())); // Chuyển đổi Date sang LocalDate (Java 8+)
                job.setDueDateJob(Date.valueOf(rs.getDate("due_date_job").toLocalDate())); // Chuyển đổi Date sang LocalDate (Java 8+)
                job.setHaveInterviewed(rs.getBoolean("is_interviewed"));
                job.setHaveTested(rs.getBoolean("is_tested"));
                job.setNumOfMember(rs.getInt("num_of_member"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setStatusPost(rs.getString("status_post"));
                job.setStatusJobId(rs.getInt("status_job_id"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return job;
    }

    public List<Job> searchJobsByKeyword(String keyword) throws SQLException, Exception {
        String sql = "SELECT * " +
                "FROM Job " +
                "WHERE LOWER(job_title) LIKE LOWER(?) OR LOWER(job_description) LIKE LOWER(?)";

        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Job> jobList = new ArrayList<>();

        try {
            ps = dbConnection.openConnection().prepareStatement(sql);
            String searchKeyword = "%" + keyword + "%";
            ps.setNString(1, searchKeyword); // Gán từ khóa cho job_title
            ps.setNString(2, searchKeyword); // Gán từ khóa cho description
            rs = ps.executeQuery();
            // In giá trị searchKeyword để kiểm tra ở Java
            System.out.println("Search Keyword (Java): " + searchKeyword);

            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setPostAccountId(rs.getInt("post_account_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setPostDate(Timestamp.valueOf(rs.getTimestamp("post_date").toLocalDateTime())); // Chuyển đổi Timestamp sang LocalDateTime (Java 8+)
                job.setJobDescription(rs.getString("job_description"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setBudgetMax(BigDecimal.valueOf(rs.getFloat("budget_max")));
                job.setBudgetMin(BigDecimal.valueOf(rs.getFloat("budget_min")));
                job.setDueDatePost(Date.valueOf(rs.getDate("due_date_post").toLocalDate())); // Chuyển đổi Date sang LocalDate (Java 8+)
                job.setDueDateJob(Date.valueOf(rs.getDate("due_date_job").toLocalDate())); // Chuyển đổi Date sang LocalDate (Java 8+)
                job.setHaveInterviewed(rs.getBoolean("is_interviewed"));
                job.setHaveTested(rs.getBoolean("is_tested"));
                job.setNumOfMember(rs.getInt("num_of_member"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setStatusPost(rs.getString("status_post"));
                job.setStatusJobId(rs.getInt("status_job_id"));
                jobList.add(job);

                // Log the found job
                System.out.println("Đã tìm thấy kết quả.");
                System.out.println("Job Title: " + job.getJobTitle());
                System.out.println("Description: " + job.getJobDescription());
            }

            if (jobList.isEmpty()) {
                System.out.println("Không tìm thấy kết quả nào.");
            }

        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        }

        return jobList;
    }

    public List<Job> get6Job() {
        List<Job> jobs = new ArrayList<>();
        String query = "SELECT j.budget_max, j.budget_min, j.due_date_post, j.status_post, j.job_title, a.avatar, a.account_name,jc.category_name, COUNT(jg.job_id) AS greeting_count\n" +
                "                FROM Job j\n" +
                "                LEFT JOIN JobGreeting jg ON jg.job_id = j.job_id\n" +
                "                INNER JOIN Account a ON a.account_id = j.post_account_id\n" +
                "\t\t\t\tinner join JobCategory jc ON jc.category_id=j.category_id\n" +
                "                GROUP BY j.budget_max, j.budget_min, j.due_date_post, j.status_post, j.job_title, a.avatar, a.account_name,jc.category_name\n" +
                "                ORDER BY greeting_count DESC\n" +
                "                OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY;";
        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Job job = new Job();
                job.setBudgetMax(BigDecimal.valueOf(rs.getFloat("budget_max")));
                job.setBudgetMin(BigDecimal.valueOf(rs.getFloat("budget_min")));
                job.setDueDatePost(Date.valueOf(rs.getDate("due_date_post").toLocalDate()));
                job.setCategoryName(rs.getString("category_name"));
                job.setStatusPost(rs.getString("status_post"));
                job.setJobTitle(rs.getString("job_title"));
                job.setAvatar(rs.getString("avatar")); // Cần thêm trường avatar vào class Job
                job.setAccountName(rs.getString("account_name")); // Cần thêm trường accountName vào class Job
                job.setGreetingCount(rs.getInt("greeting_count")); // Cần thêm trường greetingCount vào class Job
                jobs.add(job);
            }
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return jobs;
    }
    public List<Job> getAllJob() {

        String query = "SELECT * FROM Job";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setPostAccountId(rs.getInt("post_account_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setPostDate(Timestamp.valueOf(rs.getTimestamp("post_date").toLocalDateTime())); // Chuyển đổi Timestamp sang LocalDateTime (Java 8+)
                job.setJobDescription(rs.getString("job_description"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setBudgetMax(BigDecimal.valueOf(rs.getFloat("budget_max")));
                job.setBudgetMin(BigDecimal.valueOf(rs.getFloat("budget_min")));
                job.setDueDatePost(Date.valueOf(rs.getDate("due_date_post").toLocalDate())); // Chuyển đổi Date sang LocalDate (Java 8+)
                job.setDueDateJob(Date.valueOf(rs.getDate("due_date_job").toLocalDate())); // Chuyển đổi Date sang LocalDate (Java 8+)
                job.setHaveInterviewed(rs.getBoolean("is_interviewed"));
                job.setHaveTested(rs.getBoolean("is_tested"));
                job.setNumOfMember(rs.getInt("num_of_member"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setStatusPost(rs.getString("status_post"));
                job.setStatusJobId(rs.getInt("status_job_id"));
                jobs.add(job);
            }
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return jobs;
    }

    public static void main(String[] args) throws Exception {
        JobDAO jobDAO = new JobDAO();
        System.out.println(jobDAO.get6Job().get(0).getAccountName());


    }
}




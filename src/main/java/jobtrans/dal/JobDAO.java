package jobtrans.dal;

import jobtrans.model.Job;
import jobtrans.model.JobGreeting;
import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                greeting.setComments(rs.getString("comments"));
                greeting.setCvId(rs.getInt("cv_id"));

                list.add(greeting);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Job getJobById(int jobId) {
        Job job = null;
        String sql = "SELECT * FROM Job WHERE job_id = ?";

        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setPostDate(rs.getDate("post_date"));
                job.setDescription(rs.getString("description"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setJobTagId(rs.getInt("job_tag_id"));
                job.setInterviewed(rs.getBoolean("is_interviewed"));
                job.setBudgetMax(rs.getDouble("budget_max"));
                job.setBudgetMin(rs.getDouble("budget_min"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getString("status"));
                job.setNumOfMem(rs.getInt("num_of_mem"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setTested(rs.getBoolean("is_tested"));
                job.setPostAccountId(rs.getInt("post_account_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return job;
    }

    public List<Job> searchJobsByKeyword(String keyword) throws SQLException, Exception {
        String sql = "SELECT * " +
                "FROM Job " +
                "WHERE LOWER(job_title) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)";

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
                job.setJobTitle(rs.getString("job_title"));
                job.setPostDate(rs.getDate("post_date"));
                job.setDescription(rs.getString("description"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setJobTagId(rs.getInt("job_tag_id"));
                job.setInterviewed(rs.getBoolean("is_interviewed"));
                job.setBudgetMax(rs.getDouble("budget_max"));
                job.setBudgetMin(rs.getDouble("budget_min"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getString("status"));
                job.setNumOfMem(rs.getInt("num_of_mem"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setTested(rs.getBoolean("is_tested"));
                job.setPostAccountId(rs.getInt("post_account_id"));
                jobList.add(job);

                // Log the found job
                System.out.println("Đã tìm thấy kết quả.");
                System.out.println("Job Title: " + job.getJobTitle());
                System.out.println("Description: " + job.getDescription());
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
    public List<Job> getAllJob() {

        String query = "SELECT * FROM Job";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setPostDate(rs.getDate("post_date"));
                job.setDescription(rs.getString("description"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setJobTagId(rs.getInt("job_tag_id"));
                job.setInterviewed(rs.getBoolean("is_interviewed"));
                job.setBudgetMax(rs.getDouble("budget_max"));
                job.setBudgetMin(rs.getDouble("budget_min"));
                job.setDueDate(rs.getDate("due_date"));
                job.setStatus(rs.getString("status"));
               job.setNumOfMem(rs.getInt("num_of_mem"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setTested(rs.getBoolean("is_tested"));
                job.setPostAccountId(rs.getInt("post_account_id"));
                jobs.add(job);
            }
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return jobs;
    }

    public static void main(String[] args) throws Exception {
        JobDAO jobDAO = new JobDAO();
        System.out.println(jobDAO.searchJobsByKeyword("Dịch").size());

    }
}




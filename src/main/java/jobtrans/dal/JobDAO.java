package jobtrans.dal;

import jobtrans.model.Job;
import jobtrans.model.JobCategory;
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

    public JobDAO() {
        dbConnection = DBConnection.getInstance();
    }
    public JobCategory getCategoryById(int categoryId) {
        JobCategory jobCategory = null;
        String sql = "SELECT * FROM JobCategory WHERE category_id = ?";

        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    jobCategory = new JobCategory();
                    jobCategory.setCategoryId(rs.getInt("category_id"));
                    jobCategory.setCategoryName(rs.getString("category_name"));
                    jobCategory.setDescription(rs.getString("description"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return jobCategory;
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
                greeting.setCvId(rs.getInt("cv_id"));
                greeting.setPrice(rs.getInt("price"));
                greeting.setExpectedDay(rs.getInt("expected_day"));
                greeting.setIntroduction(rs.getString("introduction"));
                greeting.setAttachment(rs.getString("attachment"));
                greeting.setHaveRead(rs.getBoolean("have_read"));
                greeting.setStatus(rs.getString("status"));
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
                job.setPostAccountId(rs.getInt("post_account_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setPostDate(rs.getTimestamp("post_date"));
                job.setJobDescription(rs.getString("job_description"));
                job.setRequirements(rs.getString("requirements"));
                job.setBenefit(rs.getString("benefit"));
                job.setAttachment(rs.getString("attachment"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setBudgetMax(rs.getBigDecimal("budget_max"));
                job.setBudgetMin(rs.getBigDecimal("budget_min"));
                job.setDueDatePost(rs.getDate("due_date_post"));
                job.setDueDateJob(rs.getDate("due_date_job"));
                job.setHaveInterviewed(rs.getBoolean("have_interviewed"));
                job.setHaveTested(rs.getBoolean("have_tested"));
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
    public List<Job> getAllJob() {
        List<Job> jobs = new ArrayList<>();
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
                job.setPostDate(rs.getTimestamp("post_date"));
                job.setJobDescription(rs.getString("job_description"));
                job.setRequirements(rs.getString("requirements"));
                job.setBenefit(rs.getString("benefit"));
                job.setAttachment(rs.getString("attachment"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setBudgetMax(rs.getBigDecimal("budget_max"));
                job.setBudgetMin(rs.getBigDecimal("budget_min"));
                job.setDueDatePost(rs.getDate("due_date_post"));
                job.setDueDateJob(rs.getDate("due_date_job"));
                job.setHaveInterviewed(rs.getBoolean("have_interviewed"));
                job.setHaveTested(rs.getBoolean("have_tested"));
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
    public JobGreeting getJobGreetingById(int greetingId) {
        JobGreeting jobGreeting = null;
        String sql = "SELECT greeting_id, job_seeker_id, job_id, introduction, attachment, " +
                "price, status, expected_day, cv_id, have_read " +
                "FROM JobGreeting WHERE greeting_id = ?";

        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, greetingId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                jobGreeting = new JobGreeting();
                jobGreeting.setGreetingId(rs.getInt("greeting_id"));
                jobGreeting.setJobSeekerId(rs.getInt("job_seeker_id"));
                jobGreeting.setJobId(rs.getInt("job_id"));
                jobGreeting.setIntroduction(rs.getString("introduction"));
                jobGreeting.setAttachment(rs.getString("attachment"));
                jobGreeting.setPrice(rs.getInt("price"));
                jobGreeting.setStatus(rs.getString("status"));
                jobGreeting.setExpectedDay(rs.getInt("expected_day")); // tên cột mới
                jobGreeting.setCvId(rs.getInt("cv_id"));
                // Nếu muốn xử lý have_read:
                // jobGreeting.setHaveRead(rs.getBoolean("have_read"));
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return jobGreeting;
    }
    public List<JobGreeting> getJobGreetingByStatus(int accountId, String status) {
        List<JobGreeting> list = new ArrayList<>();
        String sql = "SELECT * FROM JobGreeting WHERE job_seeker_id = ? AND status = ?";

        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, accountId);
            ps.setString(2, status);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    JobGreeting greeting = new JobGreeting();
                    greeting.setGreetingId(rs.getInt("greeting_id"));
                    greeting.setJobSeekerId(rs.getInt("job_seeker_id"));
                    greeting.setJobId(rs.getInt("job_id"));
                    greeting.setCvId(rs.getInt("cv_id"));
                    greeting.setPrice(rs.getInt("price"));
                    greeting.setExpectedDay(rs.getInt("expected_day"));
                    greeting.setIntroduction(rs.getString("introduction"));
                    greeting.setAttachment(rs.getString("attachment"));
                    greeting.setHaveRead(rs.getBoolean("have_read"));
                    greeting.setStatus(rs.getString("status"));

                    list.add(greeting);
                }
            }

        } catch (Exception e) {
            // Sử dụng logger thay vì printStackTrace
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, "Lỗi khi truy vấn công việc theo trạng thái", e);
            throw new RuntimeException("Lỗi truy vấn database", e);
        }

        return list;
    }
    public List<JobGreeting> search(int accountId, String sort) {
        List<JobGreeting> list = new ArrayList<>();

        // Xây dựng câu SQL với sắp xếp
        String sql = "SELECT * FROM JobGreeting WHERE job_seeker_id = ? ";

        // Thêm điều kiện sắp xếp
        switch (sort) {
            case "newest":
                sql += " ORDER BY greeting_id DESC";
                break;
            case "oldest":
                sql += " ORDER BY greeting_id ASC";
                break;
            case "salary_high":
                sql += " ORDER BY price DESC";
                break;
            case "salary_low":
                sql += " ORDER BY price ASC";
                break;
            default:
                sql += " ORDER BY greeting_id DESC"; // Mặc định: mới nhất
        }

        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, accountId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    JobGreeting greeting = new JobGreeting();
                    greeting.setGreetingId(rs.getInt("greeting_id"));
                    greeting.setJobSeekerId(rs.getInt("job_seeker_id"));
                    greeting.setJobId(rs.getInt("job_id"));
                    greeting.setCvId(rs.getInt("cv_id"));
                    greeting.setPrice(rs.getInt("price"));
                    greeting.setExpectedDay(rs.getInt("expected_day"));
                    greeting.setIntroduction(rs.getString("introduction"));
                    greeting.setAttachment(rs.getString("attachment"));
                    greeting.setHaveRead(rs.getBoolean("have_read"));
                    greeting.setStatus(rs.getString("status"));

                    list.add(greeting);
                }
            }

        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, "Lỗi khi truy vấn công việc", e);
            throw new RuntimeException("Lỗi truy vấn database", e);
        }
        return list;
    }
    public static void main(String[] args) {
        JobDAO jobDAO = new JobDAO();
        System.out.println(jobDAO.getAllJob());

    }
}




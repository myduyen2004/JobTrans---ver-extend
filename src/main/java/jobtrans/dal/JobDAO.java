//package jobtrans.dal;
//
//import jobtrans.model.Job;
//import jobtrans.model.JobGreeting;
//import jobtrans.utils.DBConnection;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//public class JobDAO {
//    private final DBConnection dbConnection;
//
//    public JobDAO() {
//        dbConnection = DBConnection.getInstance();
//    }
//
//    public List<JobGreeting> getJobGreetingByJobSeekerId(int jobSeekerId) {
//        List<JobGreeting> list = new ArrayList<>();
//        String sql = "SELECT * FROM JobGreeting WHERE job_seeker_id = ?";
//
//        try (Connection con = dbConnection.openConnection();
//             PreparedStatement ps = con.prepareStatement(sql)) {
//
//            ps.setInt(1, jobSeekerId);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                JobGreeting greeting = new JobGreeting();
//                greeting.setGreetingId(rs.getInt("greeting_id"));
//                greeting.setJobSeekerId(rs.getInt("job_seeker_id"));
//                greeting.setJobId(rs.getInt("job_id"));
//                greeting.setIntroduction(rs.getString("introduction"));
//                greeting.setAttachment(rs.getString("attachment"));
//                greeting.setPrice(rs.getInt("price"));
//                greeting.setStatus(rs.getString("status"));
//                greeting.setExpectedDay(rs.getInt("expectedDay"));
//                greeting.setComments(rs.getString("comments"));
//                greeting.setCvId(rs.getInt("cv_id"));
//
//                list.add(greeting);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//    public Job getJobById(int jobId) {
//        Job job = null;
//        String sql = "SELECT * FROM Job WHERE job_id = ?";
//
//        try (Connection con = dbConnection.openConnection();
//             PreparedStatement ps = con.prepareStatement(sql)) {
//
//            ps.setInt(1, jobId);
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                job = new Job();
//                job.setJobId(rs.getInt("job_id"));
//                job.setJobTitle(rs.getString("job_title"));
//                job.setPostDate(rs.getDate("post_date"));
//                job.setDescription(rs.getString("description"));
//                job.setCategoryId(rs.getInt("category_id"));
//                job.setJobTagId(rs.getInt("job_tag_id"));
//                job.setInterviewed(rs.getBoolean("is_interviewed"));
//                job.setBudgetMax(rs.getDouble("budget_max"));
//                job.setBudgetMin(rs.getDouble("budget_min"));
//                job.setDueDate(rs.getDate("due_date"));
//                job.setStatus(rs.getString("status"));
//                job.setNumOfMem(rs.getInt("num_of_mem"));
//                job.setSecureWallet(rs.getInt("secure_wallet"));
//                job.setTested(rs.getBoolean("is_tested"));
//                job.setPostAccountId(rs.getInt("post_account_id"));
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return job;
//    }
//    public List<Job> getAllJob() {
//        List<Job> jobs = new ArrayList<>();
//        String query = "SELECT * FROM Job";
//
//        try {
//            Connection con = dbConnection.openConnection();
//            PreparedStatement ps = con.prepareStatement(query);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Job job = new Job();
//                job.setJobId(rs.getInt("job_id"));
//                job.setJobTitle(rs.getString("job_title"));
//                job.setPostDate(rs.getDate("post_date"));
//                job.setDescription(rs.getString("description"));
//                job.setCategoryId(rs.getInt("category_id"));
//                job.setJobTagId(rs.getInt("job_tag_id"));
//                job.setInterviewed(rs.getBoolean("is_interviewed"));
//                job.setBudgetMax(rs.getDouble("budget_max"));
//                job.setBudgetMin(rs.getDouble("budget_min"));
//                job.setDueDate(rs.getDate("due_date"));
//                job.setStatus(rs.getString("status"));
//               job.setNumOfMem(rs.getInt("num_of_mem"));
//                job.setSecureWallet(rs.getInt("secure_wallet"));
//                job.setTested(rs.getBoolean("is_tested"));
//                job.setPostAccountId(rs.getInt("post_account_id"));
//                jobs.add(job);
//            }
//        } catch (Exception e) {
//            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//        return jobs;
//    }
//
//    public static void main(String[] args) {
//        JobDAO jobDAO = new JobDAO();
//        System.out.println(jobDAO.getAllJob());
//
//    }
//}
//
//
//

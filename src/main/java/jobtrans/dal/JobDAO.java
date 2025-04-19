package jobtrans.dal;

import jobtrans.model.Job;
import jobtrans.utils.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class JobDAO {
    private final DBConnection dbConnection;

    public JobDAO() {
        dbConnection = DBConnection.getInstance();
    }

    private Job mapToJob(ResultSet rs) throws Exception {
        Job job = new Job();
        job.setJobId(rs.getInt("job_id"));
        job.setPostAccountId(rs.getInt("post_account_id"));
        job.setJobTitle(rs.getString("job_title"));
        job.setPostDate(rs.getTimestamp("post_date"));
        job.setJobDescription(rs.getString("job_description"));
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
        return job;
    }

    public List<Job> getAllJobs() {
        List<Job> list = new ArrayList<>();
        String sql = "SELECT * FROM Job";
        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToJob(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Hàm lấy 1 job theo jobId
    public Job getJobById(int jobId) {
        String sql = "SELECT * FROM Job WHERE job_id = ?";
        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapToJob(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }



}
package jobtrans.dal;

import jobtrans.model.*;
import jobtrans.utils.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JobDAO {
    private final DBConnection dbConnection;

    public JobDAO() {
        dbConnection = DBConnection.getInstance();
    }

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
                job.setPostDate(rs.getTimestamp("post_date"));
                job.setJobDescription(rs.getString("job_description"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setAttachment(rs.getString("attachment"));
                job.setRequirements(rs.getString("requirements"));
                job.setBenefit(rs.getString("benefit"));
                job.setHaveInterviewed(rs.getBoolean("have_interviewed"));
                job.setBudgetMax(rs.getBigDecimal("budget_max"));
                job.setBudgetMin(rs.getBigDecimal("budget_min"));
                job.setDueDatePost(rs.getDate("due_date_post"));
                job.setDueDateJob(rs.getDate("due_date_job"));
                job.setStatusPost(rs.getString("status_post"));
                job.setStatusJobId(rs.getInt("status_job_id"));
                job.setNumOfMember(rs.getInt("num_of_member"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setHaveTested(rs.getBoolean("have_tested"));
                job.setPostAccountId(rs.getInt("post_account_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return job;
    }


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

    public List<Job> getAllJobByPostAccountId(int postAccountId) {
        List<Job> jobs = new ArrayList<>();
        String query = "SELECT * FROM Job WHERE post_account_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, postAccountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setJobTitle(rs.getString("job_title"));
                job.setPostDate(rs.getTimestamp("post_date"));
                job.setJobDescription(rs.getString("job_description"));
                job.setCategoryId(rs.getInt("category_id"));
                job.setAttachment(rs.getString("attachment"));
                job.setRequirements(rs.getString("requirements"));
                job.setBenefit(rs.getString("benefit"));
                job.setHaveInterviewed(rs.getBoolean("have_interviewed"));
                job.setBudgetMax(rs.getBigDecimal("budget_max"));
                job.setBudgetMin(rs.getBigDecimal("budget_min"));
                job.setDueDatePost(rs.getDate("due_date_post"));
                job.setDueDateJob(rs.getDate("due_date_job"));
                job.setStatusPost(rs.getString("status_post"));
                job.setStatusJobId(rs.getInt("status_job_id"));
                job.setNumOfMember(rs.getInt("num_of_member"));
                job.setSecureWallet(rs.getInt("secure_wallet"));
                job.setHaveTested(rs.getBoolean("have_tested"));
                job.setPostAccountId(rs.getInt("post_account_id"));
                jobs.add(job);
            }
        } catch (Exception e) {
            Logger.getLogger(JobDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return jobs;
    }

    public List<JobGreeting> getJobGreetingsByJobId(int jobId) {
        List<JobGreeting> list = new ArrayList<>();
        String query = "Select * FROM JobGreeting WHERE job_id=?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, jobId);
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
                greeting.setExpectedDay(rs.getInt("expected_day"));
                greeting.setCvId(rs.getInt("cv_id"));
                greeting.setHaveRead(rs.getBoolean("have_read"));

                list.add(greeting);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    public JobCategory getCategoryById(int categoryId) {
        JobCategory jobCategory = new JobCategory();

        String query = "Select * FROM JobCategory WHERE category_id=?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                jobCategory.setCategoryId(rs.getInt("category_id"));
                jobCategory.setCategoryName(rs.getString("category_name"));
                jobCategory.setDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return jobCategory;
    }

    public int getNumOfJobGreetingByJobId(int jobId) {
        int numOfJobGreeting = 0;
        String query = "Select COUNT(*) num_of_jobGreeting FROM JobGreeting WHERE job_id=?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                numOfJobGreeting = rs.getInt("num_of_jobGreeting");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return numOfJobGreeting;
    }

    public List<JobCategory> getAllCategory() {
        List<JobCategory> list = new ArrayList<>();

        String query = "Select * FROM JobCategory";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                JobCategory category = new JobCategory();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                category.setDescription(rs.getString("description"));
                list.add(category);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    public List<Tag> getAllTag() {
        List<Tag> list = new ArrayList<>();

        String query = "Select * FROM Tag";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Tag tag = new Tag();
                tag.setTagId(rs.getInt("tag_id"));
                tag.setTagName(rs.getString("tag_name"));
                tag.setDescription(rs.getString("description"));
                list.add(tag);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    public int getMaxJobId() {
        String sql = "SELECT MAX(job_id) AS maxJobId FROM Job";
        try{
            Connection conn = dbConnection.openConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("maxJobId");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // Trả về -1 nếu có lỗi hoặc bảng rỗng
    }

    public void insertInterview(Interview interview) {
        String sql = "INSERT INTO Interview (start_date, interview_link, job_id) " +
                "VALUES (?, ?, ?)";

        try {
            Connection conn = dbConnection.openConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setTimestamp(1, new java.sql.Timestamp(interview.getStartDate().getTime()));  // LocalDateTime -> Timestamp
            ps.setString(2, interview.getInterviewLink());
            ps.setInt(3, interview.getJobId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int addJob(Job job) {
        int jobId = -1;

        String sql = "INSERT INTO Job (" +
                "post_account_id, job_title, job_description, attachment, category_id, " +
                "budget_max, budget_min, due_date_post, " +
                "have_interviewed, have_tested, num_of_member, requirements, benefit) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection conn = dbConnection.openConnection();  // Your DB helper
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, job.getPostAccountId());
            ps.setNString(2, job.getJobTitle());
            ps.setNString(3, job.getJobDescription());
            ps.setString(4, job.getAttachment());
            ps.setInt(5, job.getCategoryId());
            ps.setBigDecimal(6, job.getBudgetMax());
            ps.setBigDecimal(7, job.getBudgetMin());
            ps.setDate(8, new Date(job.getDueDatePost().getTime()));
            ps.setBoolean(9, job.isHaveInterviewed());
            ps.setBoolean(10, job.isHaveTested());
            ps.setInt(11, job.getNumOfMember());
            ps.setNString(12, job.getRequirements());
            ps.setNString(13, job.getBenefit());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        jobId = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobId;
    }

    public boolean addJobTag(int jobId, int tagId) {
        String sql = "INSERT INTO JobTag (job_id, tag_id) VALUES (?, ?)";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, jobId);
            ps.setInt(2, tagId);

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updateInterviewByJobId(Interview interview){
        String sql = "UPDATE Interview SET "
                + "start_date = ?, "
                + "interview_link = ?, "
                + "WHERE job_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setTimestamp(1, new java.sql.Timestamp(interview.getStartDate().getTime()));  // LocalDateTime -> Timestamp
            ps.setString(2, interview.getInterviewLink());
            ps.setInt(3, interview.getJobId());

            int rowsAffected = ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteJobTagByJobId(int jobId){
        String sql = "DELETE FROM JobTag WHERE job_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, jobId);
            int rowsAffected = ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void updateJobByJobId(Job job){
        String sql = "UPDATE Job SET " +
                "job_title = ?, " +
                "job_description = ?, " +
                "requirements = ?, " +
                "benefit = ?, " +
                "attachment = ?, " +
                "category_id = ?, " +
                "budget_max = ?, " +
                "budget_min = ?, " +
                "due_date_post = ?, " +
                "have_interviewed = ?, " +
                "have_tested = ?, " +
                "num_of_member = ?, " +
                "WHERE job_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, job.getJobTitle());
            ps.setString(2, job.getJobDescription());
            ps.setString(3, job.getRequirements());
            ps.setString(4, job.getBenefit());
            ps.setString(5, job.getAttachment());
            ps.setInt(6, job.getCategoryId());
            ps.setBigDecimal(7, job.getBudgetMax());
            ps.setBigDecimal(8, job.getBudgetMin());
            ps.setDate(9, new Date(job.getDueDatePost().getTime()));
            ps.setBoolean(10, job.isHaveInterviewed());
            ps.setBoolean(11, job.isHaveTested());
            ps.setInt(12, job.getNumOfMember());
            ps.setInt(13, job.getJobId());

            int rows = ps.executeUpdate();
            System.out.println("Đã cập nhật " + rows + " bản ghi Job.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteJobByJobId(int jobId){
        String sql = "DELETE FROM Job WHERE job_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, jobId);
            int rowsAffected = ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
        JobDAO jobDAO = new JobDAO();
        Job j = new Job();
        j.setPostAccountId(1);
        j.setJobTitle("Công việc test 3");
        j.setCategoryId(2);
        j.setNumOfMember(3);
        j.setJobDescription("Thiết kế");
        j.setRequirements("Hoàn thành");
        j.setBenefit("Lương cao");
        j.setBudgetMin(new BigDecimal("1000"));
        j.setBudgetMax(new BigDecimal("2000"));
        j.setHaveTested(true);
        j.setHaveInterviewed(true);
        j.setDueDatePost(new java.sql.Date(System.currentTimeMillis()));
        System.out.println(jobDAO.addJob(j));

    }
}




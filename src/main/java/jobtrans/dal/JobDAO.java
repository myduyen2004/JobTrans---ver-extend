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
    List<Job> jobs = new ArrayList<>();
    //tao setter
    public void setJobs(List<Job> jobs) {
        this.jobs = jobs;
    }

    public JobDAO() {
        dbConnection = DBConnection.getInstance();
    }

    private Job mapToJob(ResultSet rs) throws SQLException {
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
    public Job getJobById(int id) {
        Job job = null;
        String sql = "SELECT * FROM Job WHERE job_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    job = mapToJob(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // hoặc log lỗi nếu bạn dùng logger
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

    public int getNumOfCompleteJobByJobSeekerId(int jobSeekerId) {
        int numOfComplete = 0;
        String query = "select count(*) as num_job_complete from Job join JobGreeting on Job.job_id = JobGreeting.job_id where JobGreeting.status = N'Được nhận' and job.status_job_id = 6 and JobGreeting.job_seeker_id = ?;";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, jobSeekerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                numOfComplete = rs.getInt("num_job_complete");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return numOfComplete;
    }

}




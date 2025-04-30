package jobtrans.dal;

import jobtrans.model.Account;
import jobtrans.model.JobGreeting;
import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JobGreetingDAO {
    private final DBConnection dbConnection;

    public JobGreetingDAO() {
        dbConnection = DBConnection.getInstance();
    }
    private JobGreeting mapToJobGreeting(ResultSet rs) throws Exception {
        JobGreeting jg = new JobGreeting();
        jg.setGreetingId(rs.getInt("greeting_id"));
        jg.setJobSeekerId(rs.getInt("job_seeker_id"));
        jg.setJobId(rs.getInt("job_id"));
        jg.setCvId(rs.getInt("cv_id"));
        jg.setPrice(rs.getInt("price"));
        jg.setExpectedDay(rs.getInt("expected_day"));
        jg.setIntroduction(rs.getString("introduction"));
        jg.setAttachment(rs.getString("attachment"));
        jg.setHaveRead(rs.getBoolean("have_read"));
        jg.setStatus(rs.getString("status"));
        return jg;
    }

    public boolean insertJobGreeting(JobGreeting greeting) throws SQLException {
        String sql = "INSERT INTO JobGreeting (job_seeker_id, job_id, cv_id, price, expected_day, introduction, attachment, have_read, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, greeting.getJobSeekerId());
            ps.setInt(2, greeting.getJobId());
            ps.setInt(3, greeting.getCvId());
            ps.setInt(4, greeting.getPrice());
            ps.setInt(5, greeting.getExpectedDay());
            ps.setString(6, greeting.getIntroduction());
            ps.setString(7, greeting.getAttachment());
            ps.setBoolean(8, greeting.isHaveRead());
            ps.setString(9, greeting.getStatus());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public List<JobGreeting> getListJobGreetingBySeekerId(Account account) {
        List<JobGreeting> list = new ArrayList<>();
        String sql = "SELECT greeting_id, job_seeker_id, job_id, cv_id, price, expected_day, " +
                "introduction, attachment, have_read, status " +
                "FROM JobGreeting WHERE job_seeker_id = ?";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, account.getAccountId());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToJobGreeting(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<JobGreeting> getJobGreetingsByJobId(int jobId) throws Exception {
        List<JobGreeting> greetings = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getInstance().openConnection();
            String sql = "SELECT greeting_id, job_id, job_seeker_id, cv_id, price, expected_day, " +
                    "introduction, attachment, have_read, status " +
                    "FROM JobGreeting WHERE job_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, jobId);
            rs = ps.executeQuery();

            while (rs.next()) {
                JobGreeting g = new JobGreeting();
                g.setGreetingId(rs.getInt("greeting_id"));
                g.setJobId(rs.getInt("job_id"));
                g.setJobSeekerId(rs.getInt("job_seeker_id"));
                g.setCvId(rs.getInt("cv_id"));
                g.setPrice(rs.getInt("price"));
                g.setExpectedDay(rs.getInt("expected_day"));
                g.setIntroduction(rs.getString("introduction"));
                g.setAttachment(rs.getString("attachment"));
                g.setHaveRead(rs.getBoolean("have_read"));
                g.setStatus(rs.getString("status"));
                greetings.add(g);
            }
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return greetings;
    }

    public JobGreeting getJobGreetingById(int greetingId) {
        JobGreeting jobGreeting = null;
        String sql = "SELECT * FROM JobGreeting WHERE greeting_id = ?";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, greetingId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    jobGreeting = mapToJobGreeting(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobGreeting;
    }

    public boolean updateStatus(int jobGreetingId, String newStatus) {
//        Connection conn = null;
//        PreparedStatement stmt = null;
        String sql = "UPDATE JobGreeting SET status = ? WHERE greeting_id = ?";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)){

            // Thiết lập các tham số
            ps.setString(1, newStatus);
            ps.setLong(2, jobGreetingId);

            // Thực thi câu lệnh update
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

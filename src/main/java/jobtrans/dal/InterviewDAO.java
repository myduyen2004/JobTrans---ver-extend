package jobtrans.dal;

import java.sql.*;
import jobtrans.model.Interview;
import jobtrans.utils.DBConnection;

public class InterviewDAO {
    private final DBConnection dbConnection;

    public InterviewDAO() {
        dbConnection = DBConnection.getInstance();
    }

    // Lấy thông tin phỏng vấn theo greeting_id
    public Interview getInterviewByGreetingId(int greetingId) {
        Interview interview = null;
        String sql = "SELECT * FROM Interview WHERE greeting_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, greetingId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                interview = new Interview();
                interview.setInterviewId(rs.getInt("interview_id"));
                interview.setInterviewDate(rs.getDate("interview_date"));
                interview.setInterviewTime(rs.getTime("interview_time"));
                interview.setInterviewForm(rs.getString("interview_form"));
                interview.setInterviewAddress(rs.getString("interview_address"));
                interview.setInterviewLink(rs.getString("interview_link"));
                interview.setInterviewRecord(rs.getString("interview_record"));
                interview.setInterviewNote(rs.getString("interview_note"));
                interview.setJobId(rs.getInt("job_id"));
                interview.setGreetingId(rs.getInt("greeting_id"));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching interview: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return interview;
    }

    // Tạo mới một phỏng vấn
    public boolean createInterview(Interview interview) {
        String sql = "INSERT INTO Interview (interview_date, interview_time, interview_form, "
                + "interview_address, interview_link, interview_note, job_id, greeting_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, interview.getInterviewDate());
            ps.setTime(2, interview.getInterviewTime());
            ps.setString(3, interview.getInterviewForm());
            ps.setString(4, interview.getInterviewAddress());
            ps.setString(5, interview.getInterviewLink());
            ps.setString(6, interview.getInterviewNote());
            ps.setInt(7, interview.getJobId());
            ps.setInt(8, interview.getGreetingId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error creating interview: " + e.getMessage());
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Cập nhật thông tin phỏng vấn
    public boolean updateInterview(Interview interview) {
        String sql = "UPDATE Interview SET interview_date = ?, interview_time = ?, "
                + "interview_form = ?, interview_address = ?, interview_link = ?, "
                + "interview_note = ? WHERE interview_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, interview.getInterviewDate());
            ps.setTime(2, interview.getInterviewTime());
            ps.setString(3, interview.getInterviewForm());
            ps.setString(4, interview.getInterviewAddress());
            ps.setString(5, interview.getInterviewLink());
            ps.setString(6, interview.getInterviewNote());
            ps.setInt(7, interview.getInterviewId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error updating interview: " + e.getMessage());
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy thông tin phỏng vấn theo ID
    public Interview getInterviewById(int interviewId) {
        Interview interview = null;
        String sql = "SELECT * FROM Interview WHERE interview_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, interviewId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                interview = new Interview();
                interview.setInterviewId(rs.getInt("interview_id"));
                interview.setInterviewDate(rs.getDate("interview_date"));
                interview.setInterviewTime(rs.getTime("interview_time"));
                interview.setInterviewForm(rs.getString("interview_form"));
                interview.setInterviewAddress(rs.getString("interview_address"));
                interview.setInterviewLink(rs.getString("interview_link"));
                interview.setInterviewRecord(rs.getString("interview_record"));
                interview.setInterviewNote(rs.getString("interview_note"));
                interview.setJobId(rs.getInt("job_id"));
                interview.setGreetingId(rs.getInt("greeting_id"));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching interview by ID: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return interview;
    }

    // Cập nhật bản ghi phỏng vấn (interview_record)
    public boolean updateInterviewRecord(int interviewId, String interviewRecord) {
        String sql = "UPDATE Interview SET interview_record = ? WHERE interview_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, interviewRecord);
            ps.setInt(2, interviewId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error updating interview record: " + e.getMessage());
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy danh sách phỏng vấn theo job_id
    public java.util.List<Interview> getInterviewsByJobId(int jobId) {
        java.util.List<Interview> interviews = new java.util.ArrayList<>();
        String sql = "SELECT * FROM Interview WHERE job_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Interview interview = new Interview();
                interview.setInterviewId(rs.getInt("interview_id"));
                interview.setInterviewDate(rs.getDate("interview_date"));
                interview.setInterviewTime(rs.getTime("interview_time"));
                interview.setInterviewForm(rs.getString("interview_form"));
                interview.setInterviewAddress(rs.getString("interview_address"));
                interview.setInterviewLink(rs.getString("interview_link"));
                interview.setInterviewRecord(rs.getString("interview_record"));
                interview.setInterviewNote(rs.getString("interview_note"));
                interview.setJobId(rs.getInt("job_id"));
                interview.setGreetingId(rs.getInt("greeting_id"));

                interviews.add(interview);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching interviews by job ID: " + e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return interviews;
    }

    // Xóa một phỏng vấn
    public boolean deleteInterview(int interviewId) {
        String sql = "DELETE FROM Interview WHERE interview_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, interviewId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error deleting interview: " + e.getMessage());
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
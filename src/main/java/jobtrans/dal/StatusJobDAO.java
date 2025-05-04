package jobtrans.dal;

import jobtrans.model.StatusJob;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jobtrans.utils.DBConnection;

public class StatusJobDAO {
    private final DBConnection dbConnection;

    public StatusJobDAO() {
        dbConnection = DBConnection.getInstance();
    }

    // Lấy tất cả trạng thái công việc
    public List<StatusJob> getAllStatusJobs() {
        List<StatusJob> list = new ArrayList<>();
        String query = "SELECT status_job_id, status_job_name, status_job_description FROM StatusJob";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                StatusJob statusJob = new StatusJob(
                        rs.getInt("status_job_id"),
                        rs.getString("status_job_name"),
                        rs.getString("status_job_description")
                );
                list.add(statusJob);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Tìm trạng thái theo ID
    public StatusJob getStatusJobById(int id) {
        String query = "SELECT status_job_id, status_job_name, status_job_description FROM StatusJob WHERE status_job_id = ?";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new StatusJob(
                            rs.getInt("status_job_id"),
                            rs.getString("status_job_name"),
                            rs.getString("status_job_description")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Thêm trạng thái công việc
    public boolean insertStatusJob(StatusJob statusJob) {
        String query = "INSERT INTO StatusJob (status_job_name, status_job_description) VALUES (?, ?)";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, statusJob.getStatusJobName());
            ps.setString(2, statusJob.getStatusJobDescription());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật trạng thái công việc
    public boolean updateStatusJob(StatusJob statusJob) {
        String query = "UPDATE StatusJob SET status_job_name = ?, status_job_description = ? WHERE status_job_id = ?";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, statusJob.getStatusJobName());
            ps.setString(2, statusJob.getStatusJobDescription());
            ps.setInt(3, statusJob.getStatusJobId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa trạng thái công việc theo ID
    public boolean deleteStatusJob(int id) {
        String query = "DELETE FROM StatusJob WHERE status_job_id = ?";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}

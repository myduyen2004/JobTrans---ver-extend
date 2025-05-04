package jobtrans.dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List; // Assuming you have a Report model class

import jobtrans.model.Report;
import jobtrans.utils.DBConnection; // Assuming you have a DB connection utility

public class ReportDAO {
    private final DBConnection dbConnection;

    public ReportDAO() {
        dbConnection = DBConnection.getInstance();
    }

    private Report mapResultSetToReport(ResultSet rs) throws SQLException {
        Report report = new Report();
        report.setReportId(rs.getInt("report_id"));
        report.setJobId(rs.getInt("job_id"));
        report.setReportedAccount(rs.getInt("reported_account"));
        report.setReportBy(rs.getInt("report_by"));
        report.setCriteriaId(rs.getInt("criteria_id"));
        report.setContentReport(rs.getString("content_report"));
        report.setAttachment(rs.getString("attachment"));
        report.setReportTime(rs.getTimestamp("report_time"));
        report.setNoteByAdmin(rs.getString("note_by_admin"));
        report.setStatus(rs.getString("status"));
        return report;
    }

    public List<Report> getLatest5ReportsByAccount(int reportedAccountId) throws SQLException {
        List<Report> reports = new ArrayList<>();
        String sql = "SELECT TOP 5 * FROM Report WHERE reported_account = ? ORDER BY report_time DESC";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, reportedAccountId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Report report = mapResultSetToReport(rs);
                    reports.add(report);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return reports;
    }

    // Get all reports for a specific reported account
    public List<Report> getReportsByReportedAccount(int reportedAccountId) throws SQLException {
        List<Report> reports = new ArrayList<>();
        String sql = "SELECT * FROM Report WHERE reported_account = ? ORDER BY report_time DESC";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, reportedAccountId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Report report = mapResultSetToReport(rs);
                    reports.add(report);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return reports;
    }

    // Get count of reports for a reported account
    public int getReportCountByReportedAccount(int reportedAccountId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Report WHERE reported_account = ?";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, reportedAccountId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    // Get reports by status for a reported account
    public List<Report> getReportsByReportedAccountAndStatus(int reportedAccountId, String status) throws SQLException {
        List<Report> reports = new ArrayList<>();
        String sql = "SELECT * FROM Report WHERE reported_account = ? AND status = ? ORDER BY report_time DESC";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, reportedAccountId);
            stmt.setString(2, status);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Report report = mapResultSetToReport(rs);
                    reports.add(report);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return reports;
    }

    // Get recent reports for a reported account (last N days)
    public List<Report> getRecentReportsByReportedAccount(int reportedAccountId, int days) throws SQLException {
        List<Report> reports = new ArrayList<>();
        String sql = "SELECT * FROM Report WHERE reported_account = ? " +
                "AND report_time >= DATEADD(day, -?, GETDATE()) " +
                "ORDER BY report_time DESC";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, reportedAccountId);
            stmt.setInt(2, days);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Report report = mapResultSetToReport(rs);
                    reports.add(report);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return reports;
    }

    public boolean addReport(Report report) {
        String sql = "INSERT INTO Report (job_id, reported_account, report_by, criteria_id, content_report, attachment, report_time, status, note_by_admin) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setObject(1, report.getJobId()); // can be null
            ps.setInt(2, report.getReportedAccount());
            ps.setInt(3, report.getReportBy());
            ps.setInt(4, report.getCriteriaId());
            ps.setString(5, report.getContentReport());
            ps.setString(6, report.getAttachment());
            ps.setTimestamp(7, report.getReportTime());
            ps.setString(8, report.getStatus());
            ps.setString(9, report.getNoteByAdmin());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // Or use logging
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public boolean updateReport(Report report) {
        String sql = "UPDATE Report SET status = ?, note_by_admin = ? WHERE report_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, report.getStatus());
            ps.setString(2, report.getNoteByAdmin());
            ps.setInt(3, report.getReportId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // Or use logging
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

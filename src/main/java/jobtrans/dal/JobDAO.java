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

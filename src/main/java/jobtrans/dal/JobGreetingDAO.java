package jobtrans.dal;

import jobtrans.model.Account;
import jobtrans.model.JobGreeting;
import jobtrans.utils.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

}

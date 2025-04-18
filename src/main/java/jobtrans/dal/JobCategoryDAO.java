package jobtrans.dal;

import jobtrans.model.Job;
import jobtrans.model.JobCategory;
import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class JobCategoryDAO {
    private final DBConnection dbConnection;

    public JobCategoryDAO(){
        dbConnection = DBConnection.getInstance();
    }




    public JobCategory getJobCategoryByJobId(int jobId) {
        JobCategory jc = null;
        String sql = "SELECT * FROM JobCategory WHERE category_id = ?";
        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                 jc = new JobCategory();
                jc.setCategoryId(rs.getInt("category_id"));
                jc.setCategoryName(rs.getString("category_name"));
                jc.setDescription(rs.getString("description"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jc;
    }

    public static void main(String[] args) {
        JobCategoryDAO jc = new JobCategoryDAO();
        System.out.println(jc.getJobCategoryByJobId(4));

    }
}

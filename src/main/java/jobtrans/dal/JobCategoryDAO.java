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

    public JobCategory getCategoryById(int categoryId) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        JobCategory category = null;

        try {
            conn = DBConnection.getInstance().openConnection(); // Dùng kiểu kết nối giống GroupMember
            String sql = "SELECT category_id, category_name, description FROM JobCategory WHERE category_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();

            if (rs.next()) {
                category = new JobCategory();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                category.setDescription(rs.getString("description"));
            }
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return category;
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
        System.out.println(jc.getJobCategoryByJobId(1).getCategoryName());

    }
}

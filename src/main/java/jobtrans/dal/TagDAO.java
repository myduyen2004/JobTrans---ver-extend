package jobtrans.dal;

import jobtrans.model.Tag;
import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TagDAO {
    private final DBConnection dbConnection;


    public TagDAO() {
        this.dbConnection = DBConnection.getInstance();
    }


    public List<Tag> getTagsByJobId(int jobId) throws Exception {
        List<Tag> tagList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getInstance().openConnection();
            String sql = "SELECT t.tag_id, t.tag_name, t.description " +
                    "FROM Tag t " +
                    "INNER JOIN JobTag jt ON t.tag_id = jt.tag_id " +
                    "WHERE jt.job_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, jobId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Tag tag = new Tag();
                tag.setTagId(rs.getInt("tag_id"));
                tag.setTagName(rs.getString("tag_name"));
                tag.setDescription(rs.getString("description"));
                tagList.add(tag);
            }
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return tagList;
    }

}

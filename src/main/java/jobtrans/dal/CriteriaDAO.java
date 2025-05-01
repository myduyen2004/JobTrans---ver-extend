package jobtrans.dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;// Assuming you have a Criteria model class

import jobtrans.model.Criteria;
import jobtrans.utils.DBConnection; // Assuming you have a DB connection utility

public class CriteriaDAO {
    private final DBConnection dbConnection;

    public CriteriaDAO() {
        dbConnection = DBConnection.getInstance();
    }

    // Get all criteria
    public List<Criteria> getAllCriteria() throws SQLException {
        List<Criteria> criteriaList = new ArrayList<>();
        String sql = "SELECT * FROM Criteria ORDER BY criteria_id";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Criteria criteria = mapResultSetToCriteria(rs);
                criteriaList.add(criteria);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return criteriaList;
    }

    // Get criteria by ID
    public Criteria getCriteriaById(int criteriaId) throws SQLException {
        String sql = "SELECT * FROM Criteria WHERE criteria_id = ?";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, criteriaId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToCriteria(rs);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    // Get criteria by type
    public List<Criteria> getCriteriaByType(String type) throws SQLException {
        List<Criteria> criteriaList = new ArrayList<>();
        String sql = "SELECT * FROM Criteria WHERE type_criteria = ? ORDER BY criteria_id";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, type);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Criteria criteria = mapResultSetToCriteria(rs);
                    criteriaList.add(criteria);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return criteriaList;
    }

    // Get criteria with point deduction (Trừ điểm)
    public List<Criteria> getPointDeductionCriteria() throws SQLException {
        return getCriteriaByType("Trừ điểm");
    }

    // Get criteria with point addition (Cộng điểm)
    public List<Criteria> getPointAdditionCriteria() throws SQLException {
        return getCriteriaByType("Cộng điểm");
    }

    // Get blocking criteria (Block)
    public List<Criteria> getBlockingCriteria() throws SQLException {
        return getCriteriaByType("Block");
    }

    // Get warning label criteria (Nhãn cảnh báo)
    public List<Criteria> getWarningLabelCriteria() throws SQLException {
        return getCriteriaByType("Nhãn cảnh báo");
    }

    // Add new criteria
    public boolean addCriteria(Criteria criteria) throws SQLException {
        String sql = "INSERT INTO Criteria (content, criteria_point, label_tag, type_criteria) " +
                "VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, criteria.getContent());
            stmt.setInt(2, criteria.getCriteriaPoint());
            stmt.setString(3, criteria.getLabelTag());
            stmt.setString(4, criteria.getTypeCriteria());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        criteria.setCriteriaId(generatedKeys.getInt(1));
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    // Update criteria
    public boolean updateCriteria(Criteria criteria) throws SQLException {
        String sql = "UPDATE Criteria SET content = ?, criteria_point = ?, label_tag = ?, type_criteria = ? " +
                "WHERE criteria_id = ?";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, criteria.getContent());
            stmt.setInt(2, criteria.getCriteriaPoint());
            stmt.setString(3, criteria.getLabelTag());
            stmt.setString(4, criteria.getTypeCriteria());
            stmt.setInt(5, criteria.getCriteriaId());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Delete criteria
    public boolean deleteCriteria(int criteriaId) throws SQLException {
        String sql = "DELETE FROM Criteria WHERE criteria_id = ?";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, criteriaId);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Helper method to map ResultSet to Criteria object
    private Criteria mapResultSetToCriteria(ResultSet rs) throws SQLException {
        Criteria criteria = new Criteria();
        criteria.setCriteriaId(rs.getInt("criteria_id"));
        criteria.setContent(rs.getString("content"));
        criteria.setCriteriaPoint(rs.getInt("criteria_point"));
        criteria.setLabelTag(rs.getString("label_tag"));
        criteria.setTypeCriteria(rs.getString("type_criteria"));
        return criteria;
    }

    // Get criteria with pagination
    public List<Criteria> getCriteriaWithPagination(int page, int pageSize) throws SQLException {
        List<Criteria> criteriaList = new ArrayList<>();
        String sql = "SELECT * FROM Criteria ORDER BY criteria_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, (page - 1) * pageSize);
            stmt.setInt(2, pageSize);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Criteria criteria = mapResultSetToCriteria(rs);
                    criteriaList.add(criteria);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return criteriaList;
    }

    // Get total count of criteria
    public int getTotalCriteriaCount() throws SQLException {
        String sql = "SELECT COUNT(*) FROM Criteria";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return 0;
    }
}

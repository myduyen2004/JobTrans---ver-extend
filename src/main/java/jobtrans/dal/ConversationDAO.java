package jobtrans.dal;

import jobtrans.utils.DBConnection;

import java.sql.*;

public class ConversationDAO {
    private final DBConnection dbConnection;

    public ConversationDAO() {
        dbConnection = DBConnection.getInstance();
    }

    // 5. getConversationByJobId
    public int getConversationByJobId(int jobId) throws SQLException {
        String sql = "SELECT conversation_id FROM Conversation WHERE job_id = ?";
        try (PreparedStatement stmt = dbConnection.openConnection().prepareStatement(sql)) {
            stmt.setInt(1, jobId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("conversation_id");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return -1; // Not found
    }

    // 6. addConversation
    public int addConversation(int jobId) throws SQLException {
        String sql = "INSERT INTO Conversation (job_id, start_date) VALUES (?, GETDATE())";
        try (PreparedStatement stmt = dbConnection.openConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, jobId);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // return generated conversation_id
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return -1;
    }

    // 7. getConversationById
    public boolean conversationExists(int conversationId) throws SQLException {
        String sql = "SELECT 1 FROM Conversation WHERE conversation_id = ?";
        try (PreparedStatement stmt = dbConnection.openConnection().prepareStatement(sql)) {
            stmt.setInt(1, conversationId);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

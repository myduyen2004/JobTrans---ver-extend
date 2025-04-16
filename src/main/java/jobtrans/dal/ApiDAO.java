package jobtrans.dal;

import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ApiDAO {
    private final DBConnection dbConnection;

    public ApiDAO(DBConnection dbConnection) {
        this.dbConnection = dbConnection;
    }
    public ApiDAO() {
        dbConnection = DBConnection.getInstance();
    }
    public void saveApiKey(int accountId, String openRouterApiKey) throws SQLException {
        String sql = "INSERT INTO user_api_keys (account_id, openrouter_api_key, created_at) "
                + "VALUES (?, ?, GETDATE())";
        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql))
        {
            ps.setInt(1, accountId); // Gán account_id vào câu lệnh SQL
            ps.setString(2, openRouterApiKey); // Gán openrouter_api_key vào câu lệnh SQL
            ps.executeUpdate(); // Thực thi câu lệnh
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public String getApiKeyByAccountId(int accountId) throws SQLException {
        String sql = "SELECT openrouter_api_key FROM user_api_keys WHERE account_id = ?";
        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(sql)){
            ps.setInt(1, accountId); // Gán account_id vào câu lệnh SQL
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("openrouter_api_key"); // Trả về openrouter_api_key nếu tìm thấy
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null; // Trả về null nếu không tìm thấy
    }

}

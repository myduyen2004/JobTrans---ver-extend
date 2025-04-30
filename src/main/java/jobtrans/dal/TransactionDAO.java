package jobtrans.dal;

import jobtrans.model.Transaction;
import jobtrans.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
    private final DBConnection dbConnection;

    public TransactionDAO() {
        dbConnection = DBConnection.getInstance();
    }

    private Transaction mapToTransaction(ResultSet rs) throws SQLException {
        Transaction t = new Transaction();
        t.setTransactionId(rs.getInt("transaction_id"));
        t.setSenderId(rs.getInt("sender_id"));
        t.setReceiverId(rs.getInt("receiver_id"));

        int jobId = rs.getInt("job_id");
        t.setJobId(rs.wasNull() ? null : jobId);

        t.setAmount(rs.getBigDecimal("amount"));
        t.setCreatedDate(rs.getTimestamp("created_date"));
        t.setDescription(rs.getString("description"));
        t.setTransactionType(rs.getString("transaction_type"));
        t.setStatus(rs.getBoolean("status"));
        return t;
    }
    // Lấy danh sách giao dịch theo senderId và receiverId
    public List<Transaction> getTransactionsBySenderAndReceiver(int senderId, int receiverId) {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM [Transaction] WHERE sender_id = ? AND receiver_id = ?";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, senderId);
            ps.setInt(2, receiverId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToTransaction(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Transaction> getTransactionBySenderIdOrReceiverId(int accountId) {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM [Transaction] WHERE sender_id = ? OR receiver_id = ?";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.setInt(2, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToTransaction(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm giao dịch mới
    public boolean addTransaction(Transaction t) {
        String sql = "INSERT INTO [Transaction] (sender_id, receiver_id, job_id, amount, created_date, description, transaction_type, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, t.getSenderId());
            ps.setInt(2, t.getReceiverId());

            if (t.getJobId() != null) {
                ps.setInt(3, t.getJobId());
            } else {
                ps.setNull(3, Types.INTEGER);
            }

            ps.setBigDecimal(4, t.getAmount());

            if (t.getCreatedDate() != null) {
                ps.setTimestamp(5, new Timestamp(t.getCreatedDate().getTime()));
            } else {
                ps.setTimestamp(5, new Timestamp(System.currentTimeMillis())); // hoặc để null tùy DB
            }

            ps.setString(6, t.getDescription());
            ps.setString(7, t.getTransactionType());
            ps.setBoolean(8, t.isStatus());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }



}

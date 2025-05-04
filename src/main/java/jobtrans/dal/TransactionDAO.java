package jobtrans.dal;

import jobtrans.model.Transaction;
import jobtrans.utils.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
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

    public List<Transaction> getAllTransaction() {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM [Transaction]";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapToTransaction(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public void updateTransaction(Transaction transaction) {
        String sql = "UPDATE [dbo].[Transaction] " +
                "SET  " +
                "[amount] = ?, " +
                "[created_date] = ?, " +
                "[description] = ?, " +
                "[transaction_type] = ?, " +
                "[status] = ? " +
                "WHERE transaction_id = ?"; // Changed to transaction_id

        try (PreparedStatement preparedStatement = dbConnection.openConnection().prepareStatement(sql)) {

            preparedStatement.setBigDecimal(1, transaction.getAmount()); // Use setBigDecimal
            preparedStatement.setTimestamp(2, new java.sql.Timestamp(transaction.getCreatedDate().getTime()));
            preparedStatement.setString(3, transaction.getDescription());
            preparedStatement.setString(4, transaction.getTransactionType());
            preparedStatement.setBoolean(5, transaction.isStatus());
            preparedStatement.setInt(6, transaction.getTransactionId()); // Use transaction_id

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            // Xử lý ngoại lệ (ví dụ: ghi log, thông báo lỗi)
            e.printStackTrace();
        }
    }
    public void insertTransaction(Transaction transaction) {
        String sql = "INSERT INTO [dbo].[Transaction] " +
                "([sender_id], [receiver_id], [job_id], [amount], [created_date], [description], [transaction_type], [status]) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = dbConnection.openConnection().prepareStatement(sql)) {

            preparedStatement.setInt(1, transaction.getSenderId());
            preparedStatement.setInt(2, transaction.getReceiverId());
            preparedStatement.setInt(3, transaction.getJobId());
            preparedStatement.setBigDecimal(4, transaction.getAmount());
            preparedStatement.setTimestamp(5, new java.sql.Timestamp(transaction.getCreatedDate().getTime()));
            preparedStatement.setString(6, transaction.getDescription());
            preparedStatement.setString(7, transaction.getTransactionType());
            preparedStatement.setBoolean(8, transaction.isStatus());

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            // Xử lý ngoại lệ (ví dụ: ghi log, thông báo lỗi)
            e.printStackTrace();
        }
    }
    public List<Transaction> getTransactionsByKeyword(String keyword) throws Exception {
        String sql = "SELECT * FROM [dbo].[Transaction] " +
                "WHERE LOWER(transaction_id) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)";

        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Transaction> transactionList = new ArrayList<>();

        try {
            ps = dbConnection.openConnection().prepareStatement(sql); // Sử dụng lại dbConnection
            String searchKeyword = "%" + keyword + "%";
            ps.setNString(1, searchKeyword);
            ps.setNString(2, searchKeyword);
            rs = ps.executeQuery();

            // Kiểm tra giá trị tìm kiếm
            System.out.println("Search Keyword (Java): " + searchKeyword);

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transaction_id"));
                transaction.setTransactionType(rs.getString("transaction_type"));
                transaction.setAmount(rs.getBigDecimal("amount"));
                transaction.setDescription(rs.getString("description"));
                transaction.setCreatedDate(rs.getTimestamp("created_date"));
                transaction.setStatus(rs.getBoolean("status"));
                // Các trường khác của Transaction
                transactionList.add(transaction);
                System.out.println("Đã tìm thấy kết quả.");
            }
            if (transactionList.isEmpty()) {
                System.out.println("Không tìm thấy kết quả nào.");
            }

        } finally {
            // Đóng tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            //Không đóng connection ở đây vì connection có thể được quản lý ở nơi khác
        }
        return transactionList;
    }

    public List<Transaction> getFilterTransaction(String startDate, String endDate, List<Boolean> statusList, List<String> transactionTypes) throws Exception {
        String sql = "SELECT * FROM [dbo].[Transaction] " +
                "WHERE [created_date] BETWEEN ? AND ? " +
                "AND [status] IN (";

        // Tạo các tham số IN cho status
        for (int i = 0; i < statusList.size(); i++) {
            sql += (i == 0 ? "?" : ", ?");
        }
        sql += ") AND [transaction_type] IN (";

        // Tạo các tham số IN cho transaction_type
        for (int i = 0; i < transactionTypes.size(); i++) {
            sql += (i == 0 ? "?" : ", ?");
        }
        sql += ")";

        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Transaction> transactionList = new ArrayList<>();

        try {
            ps = dbConnection.openConnection().prepareStatement(sql); // Sử dụng lại dbConnection

            // Set các tham số cho câu lệnh SQL
            int paramIndex = 1;

            // Set các tham số ngày
            ps.setString(paramIndex++, startDate);
            ps.setString(paramIndex++, endDate);

            // Set các tham số status
            for (Boolean status : statusList) {
                ps.setBoolean(paramIndex++, status);
            }

            // Set các tham số transaction_type
            for (String type : transactionTypes) {
                ps.setNString(paramIndex++, type);
            }

            // Debug các tham số tìm kiếm
            System.out.println("Filter Period: " + startDate + " to " + endDate);
            System.out.println("Status Filter: " + statusList);
            System.out.println("Transaction Types: " + transactionTypes);

            rs = ps.executeQuery();

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transaction_id"));
                transaction.setTransactionType(rs.getString("transaction_type"));
                transaction.setAmount(rs.getBigDecimal("amount"));
                transaction.setDescription(rs.getString("description"));
                transaction.setCreatedDate(rs.getTimestamp("created_date"));
                transaction.setStatus(rs.getBoolean("status"));
                // Các trường khác của Transaction
                transactionList.add(transaction);
            }

            System.out.println("Số lượng kết quả tìm thấy: " + transactionList.size());

        } finally {
            // Đóng tài nguyên
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            //Không đóng connection ở đây vì connection có thể được quản lý ở nơi khác
        }

        return transactionList;
    }
    // Ví dụ cách sử dụng:
    public List<Transaction> getTransactionsByDefaultFilter() throws Exception {
        String startDate = "2025-04-27 00:00:00.000";
        String endDate = "2025-04-30 00:00:00.000";

        List<Boolean> statusList = new ArrayList<>();
        statusList.add(false); // status = 0
        statusList.add(true);  // status = 1
        List<String> transactionTypes = new ArrayList<>();
        transactionTypes.add("Trừ tiền");
        transactionTypes.add("Thêm tiền");
        transactionTypes.add("Rút tiền");

        return getFilterTransaction(startDate, endDate, statusList, transactionTypes);
    }
    public static void main(String[] args) throws Exception {
        // 2. Tạo một đối tượng TransactionDAO
        TransactionDAO transactionDAO = new TransactionDAO();

        System.out.println( transactionDAO.getTransactionsByDefaultFilter());


    }
}

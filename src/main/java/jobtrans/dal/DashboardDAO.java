package jobtrans.dal;

import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class DashboardDAO {
    private final DBConnection dbConnection;

    public DashboardDAO() {
        dbConnection = DBConnection.getInstance();
    }


    public List<Map<String, Object>> getDailyRevenue(){
        List<Map<String, Object>> weeklyRevenueList = new ArrayList<>();

        String sql = "SELECT\n" +
                "    FORMAT(due_date_post, 'ddd') AS day, -- 'ddd' trả về tên viết tắt của ngày trong tuần (ví dụ: Mon, Tue)\n" +
                "    SUM(secure_wallet*0.03) AS revenue\n" +
                "FROM Job\n" +
                "WHERE due_date_post >= DATEADD(wk, DATEDIFF(wk, 7, GETDATE()), 0) -- Ngày đầu tiên của tuần hiện tại (Chủ Nhật theo mặc định)\n" +
                "  AND due_date_post < DATEADD(wk, DATEDIFF(wk, 7, GETDATE()), 7) -- Ngày sau ngày cuối cùng của tuần hiện tại (Thứ Bảy + 1 ngày)\n" +
                "GROUP BY FORMAT(due_date_post, 'ddd')\n" +
                "ORDER BY\n" +
                "    CASE FORMAT(due_date_post, 'ddd')\n" +
                "        WHEN 'Mon' THEN 1\n" +
                "        WHEN 'Tue' THEN 2\n" +
                "        WHEN 'Wed' THEN 3\n" +
                "        WHEN 'Thu' THEN 4\n" +
                "        WHEN 'Fri' THEN 5\n" +
                "        WHEN 'Sat' THEN 6\n" +
                "        WHEN 'Sun' THEN 7\n" +
                "    END;";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> revenueData = new HashMap<>();
                revenueData.put("day", rs.getString("day"));
                revenueData.put("revenue", rs.getDouble("revenue"));
                weeklyRevenueList.add(revenueData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
return weeklyRevenueList;
    }


    public List<Map<String, Object>> getMonthlyRevenue() {
        List<Map<String, Object>> monthlyRevenueList = new ArrayList<>();

        String sql = "SELECT\n" +
                "    'Tháng ' + FORMAT(DATEFROMPARTS(YEAR(due_date_post), MONTH(due_date_post), 1), 'MM yyyy') AS month,\n" +
                "    SUM(secure_wallet*0.03) AS monthly_revenue\n" +
                "FROM\n" +
                "    Job\n" +
                "GROUP BY\n" +
                "    YEAR(due_date_post), MONTH(due_date_post),\n" +
                "    'Tháng ' + FORMAT(DATEFROMPARTS(YEAR(due_date_post), MONTH(due_date_post), 1), 'MM yyyy')\n" +
                "ORDER BY\n" +
                "    YEAR(due_date_post), MONTH(due_date_post);";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> revenueData = new HashMap<>();
                revenueData.put("month", rs.getString("month")); // Thay đổi từ getDate sang getString
                revenueData.put("monthly_revenue", rs.getDouble("monthly_revenue"));
                monthlyRevenueList.add(revenueData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return monthlyRevenueList;
    }

    public List<Map<String, Object>> getJobStatisticsByYear() {
        List<Map<String, Object>> statisticsByYear  = new ArrayList<>();

        String sql = "SELECT\n" +
                "    YEAR(post_date) AS job_year,\n" +
                "    COUNT(*) AS total_jobs,\n" +
                "    SUM(CASE WHEN status_job_id = 6 THEN 1 ELSE 0 END) AS completed_jobs,\n" +
                "    SUM(CASE WHEN status_job_id != 6 THEN 1 ELSE 0 END) AS posted_jobs\n" +
                "FROM\n" +
                "    Job\n" +
                "GROUP BY\n" +
                "    YEAR(post_date)\n" +
                "ORDER BY\n" +
                "    job_year;";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> statisticsMap = new HashMap<>();
                statisticsMap.put("year", rs.getInt("job_year"));
                statisticsMap.put("totalJobs", rs.getInt("total_jobs"));
                statisticsMap.put("completedJobs", rs.getInt("completed_jobs"));
                statisticsMap.put("postedJobs", rs.getInt("posted_jobs"));
                statisticsByYear.add(statisticsMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return statisticsByYear;
    }

    public List<Map<String, Object>> getJobStatisticsByDay() {
        List<Map<String, Object>> statisticsByDay  = new ArrayList<>();

            String sql ="\n" +
                    "\t SELECT\n" +
                    "    CAST(post_date AS DATE) AS job_date,\n" +
                    "    COUNT(*) AS total_jobs,\n" +
                    "    SUM(CASE WHEN status_job_id = 6 THEN 1 ELSE 0 END) AS completed_jobs,\n" +
                    "    SUM(CASE WHEN status_job_id != 6 THEN 1 ELSE 0 END) AS posted_jobs\n" +
                    "FROM\n" +
                    "    Job\n" +
                    "WHERE\n" +
                    "    post_date >= DATEADD(DAY, -7, CAST(GETDATE() AS DATE))  -- Ngày 7 ngày trước\n" +
                    "    AND post_date <= CAST(GETDATE() AS DATE)  -- Ngày hiện tại\n" +
                    "GROUP BY\n" +
                    "    CAST(post_date AS DATE)\n" +
                    "ORDER BY\n" +
                    "    job_date;";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> statisticsMap = new HashMap<>();
                statisticsMap.put("job_date", rs.getDate("job_date"));
                statisticsMap.put("totalJobs", rs.getInt("total_jobs"));
                statisticsMap.put("completedJobs", rs.getInt("completed_jobs"));
                statisticsMap.put("postedJobs", rs.getInt("posted_jobs"));
                statisticsByDay.add(statisticsMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return statisticsByDay;
    }
    public List<Map<String, Object>> getJobStatisticsByMonth() {
        List<Map<String, Object>> statisticsByMonth = new ArrayList<>();

        String sql = "SELECT\n" +
                "    MONTH(post_date) AS job_month,\n" +
                "    COUNT(*) AS total_jobs,\n" +
                "    SUM(CASE WHEN status_job_id = 6 THEN 1 ELSE 0 END) AS completed_jobs,\n" +
                "    SUM(CASE WHEN status_job_id != 6 THEN 1 ELSE 0 END) AS posted_jobs\n" +
                "FROM\n" +
                "    Job\n" +
                "WHERE\n" +
                "    YEAR(post_date) = YEAR(GETDATE())\n" +
                "    AND MONTH(post_date) BETWEEN 1 AND MONTH(GETDATE())\n" +
                "GROUP BY\n" +
                "   MONTH(post_date)\n" +
                "ORDER BY\n" +
                "    MONTH(post_date);";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> statisticsMap = new HashMap<>();
                // Lấy tháng (1-12)
                int month = rs.getInt("job_month");
                statisticsMap.put("job_month", month);
                statisticsMap.put("totalJobs", rs.getInt("total_jobs"));
                statisticsMap.put("completedJobs", rs.getInt("completed_jobs"));
                statisticsMap.put("postedJobs", rs.getInt("posted_jobs"));
                statisticsByMonth.add(statisticsMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return statisticsByMonth; // Trả về danh sách đã được điền dữ liệu
    }

    public List<Map<String, Object>> getTransactionsByDays() {
        List<Map<String, Object>> transactionsByDays = new ArrayList<>();

        String sql = "\n" +
                "SELECT\n" +
                "    CONVERT(VARCHAR(10), [created_date], 120) AS TransactionDate,\n" +
                "    COUNT(*) AS NumberOfTransactions\n" +
                "FROM\n" +
                "    [dbo].[Transaction]\n" +
                "WHERE\n" +
                "    [created_date] >= DATEADD(day, -7, GETDATE())\n" +
                "GROUP BY\n" +
                "    CONVERT(VARCHAR(10), [created_date], 120)\n" +
                "ORDER BY\n" +
                "    CONVERT(VARCHAR(10), [created_date], 120);";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> statisticsMap = new HashMap<>();
                statisticsMap.put("TransactionDate", rs.getString("TransactionDate"));
                statisticsMap.put("NumberOfTransactions", rs.getInt("NumberOfTransactions"));
                transactionsByDays.add(statisticsMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transactionsByDays; // Trả về danh sách đã được điền dữ liệu
    }

    public List<Map<String, Object>> getTransactionsALl() {
        List<Map<String, Object>> transactionsByAll = new ArrayList<>();

        String sql = "SELECT\n" +
                "    a.account_name,\n" +
                "    t.created_date,\n" +
                "    t.amount,\n" +
                "    t.status\n" +
                "FROM\n" +
                "    [dbo].[Transaction] t\n" +
                "INNER JOIN\n" +
                "    Account a ON t.sender_id = a.account_id;";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> statisticsMap = new HashMap<>();
                statisticsMap.put("Account", rs.getString("account_name"));
                statisticsMap.put("CreatedDate", rs.getString("created_date"));
                statisticsMap.put("Amount", rs.getInt("amount"));
                statisticsMap.put("Status", rs.getString("status"));
                transactionsByAll.add(statisticsMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transactionsByAll; // Trả về danh sách đã được điền dữ liệu
    }

    public Map<String, Object> getTransactionsTodayWithTotal(int page, int pageSize) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> transactionsToday = new ArrayList<>();
        long totalRecords = 0;
        int offset = (page - 1) * pageSize;

        String sql = "WITH TransactionDetails AS (\n" +
                "    SELECT\n" +
                "        a.account_name AS SenderAccountName,\n" +
                "        FORMAT(t.created_date, 'yyyy-MM-dd HH:mm:ss') AS TransactionDate,\n" +
                "        t.amount AS TransactionAmount,\n" +
                "        t.status AS TransactionStatus,\n" +
                "        ROW_NUMBER() OVER (ORDER BY t.created_date DESC) AS RowNum\n" +
                "    FROM\n" +
                "        [dbo].[Transaction] t\n" +
                "    INNER JOIN\n" +
                "        Account a ON t.sender_id = a.account_id\n" +
                "    WHERE\n" +
                "        CAST(t.[created_date] AS DATE) = CAST(GETDATE() AS DATE)\n" +
                ")\n" +
                "SELECT\n" +
                "    (SELECT COUNT(*) FROM TransactionDetails) AS TotalRecords,\n" +
                "    SenderAccountName,\n" +
                "    TransactionDate,\n" +
                "    TransactionAmount,\n" +
                "    TransactionStatus\n" +
                "FROM\n" +
                "    TransactionDetails\n" +
                "WHERE\n" +
                "    RowNum > ? AND RowNum <= ?\n" +
                "ORDER BY\n" +
                "    RowNum;";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, offset);
            stmt.setInt(2, offset + pageSize);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    totalRecords = rs.getLong("TotalRecords");
                    do {
                        Map<String, Object> transaction = new HashMap<>();
                        transaction.put("Account", rs.getString("SenderAccountName"));
                        transaction.put("CreatedDate", rs.getString("TransactionDate"));
                        transaction.put("Amount", rs.getInt("TransactionAmount"));
                        transaction.put("Status", rs.getString("TransactionStatus"));
                        transactionsToday.add(transaction);
                    } while (rs.next());
                }
            }

            result.put("totalRecords", totalRecords);
            result.put("transactions", transactionsToday);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public Map<String, Object> getTransactionsYesterdayWithTotal(int page, int pageSize) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> transactionsYesterday = new ArrayList<>();
        long totalRecords = 0;
        int offset = (page - 1) * pageSize;

        String sql = "WITH TransactionDetails AS (\n" +
                "    SELECT\n" +
                "        a.account_name AS SenderAccountName,\n" +
                "        FORMAT(t.created_date, 'yyyy-MM-dd HH:mm:ss') AS TransactionDate,\n" +
                "        t.amount AS TransactionAmount,\n" +
                "        t.status AS TransactionStatus,\n" +
                "        ROW_NUMBER() OVER (ORDER BY t.created_date DESC) AS RowNum\n" +
                "    FROM\n" +
                "        [dbo].[Transaction] t\n" +
                "    INNER JOIN\n" +
                "        Account a ON t.sender_id = a.account_id\n" +
                "    WHERE\n" +
                "        CAST(t.[created_date] AS DATE) = CAST(DATEADD(day, -1, GETDATE()) AS DATE)\n" +
                ")\n" +
                "SELECT\n" +
                "    (SELECT COUNT(*) FROM TransactionDetails) AS TotalRecords,\n" +
                "    SenderAccountName,\n" +
                "    TransactionDate,\n" +
                "    TransactionAmount,\n" +
                "    TransactionStatus\n" +
                "FROM\n" +
                "    TransactionDetails\n" +
                "WHERE\n" +
                "    RowNum > ? AND RowNum <= ?\n" +
                "ORDER BY\n" +
                "    RowNum;";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, offset);
            stmt.setInt(2, offset + pageSize);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    totalRecords = rs.getLong("TotalRecords");
                    do {
                        Map<String, Object> transaction = new HashMap<>();
                        transaction.put("Account", rs.getString("SenderAccountName"));
                        transaction.put("CreatedDate", rs.getString("TransactionDate"));
                        transaction.put("Amount", rs.getInt("TransactionAmount"));
                        transaction.put("Status", rs.getString("TransactionStatus"));
                        transactionsYesterday.add(transaction);
                    } while (rs.next());
                }
            }

            result.put("totalRecords", totalRecords);
            result.put("transactions", transactionsYesterday);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public Map<String, Object> getTransactionsWeekWithTotal(int page, int pageSize) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> transactionsWeek = new ArrayList<>();
        long totalRecords = 0;
        int offset = (page - 1) * pageSize;

        String sql = "WITH TransactionDetails AS (\n" +
                "    SELECT\n" +
                "        a.account_name AS SenderAccountName,\n" +
                "        FORMAT(t.created_date, 'yyyy-MM-dd HH:mm:ss') AS TransactionDate,\n" +
                "        t.amount AS TransactionAmount,\n" +
                "        t.status AS TransactionStatus,\n" +
                "        ROW_NUMBER() OVER (ORDER BY t.created_date DESC) AS RowNum\n" +
                "    FROM\n" +
                "        [dbo].[Transaction] t\n" +
                "    INNER JOIN\n" +
                "        Account a ON t.sender_id = a.account_id\n" +
                "    WHERE\n" +
                "        t.[created_date] >= DATEADD(wk, DATEDIFF(wk, 7, GETDATE()), 0)\n" +
                "        AND t.[created_date] < DATEADD(wk, DATEDIFF(wk, 7, GETDATE()), 7)\n" +
                ")\n" +
                "SELECT\n" +
                "    (SELECT COUNT(*) FROM TransactionDetails) AS TotalRecords,\n" +
                "    SenderAccountName,\n" +
                "    TransactionDate,\n" +
                "    TransactionAmount,\n" +
                "    TransactionStatus\n" +
                "FROM\n" +
                "    TransactionDetails\n" +
                "WHERE\n" +
                "    RowNum > ? AND RowNum <= ?\n" +
                "ORDER BY\n" +
                "    RowNum;";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, offset);
            stmt.setInt(2, offset + pageSize);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    totalRecords = rs.getLong("TotalRecords");
                    do {
                        Map<String, Object> transaction = new HashMap<>();
                        transaction.put("Account", rs.getString("SenderAccountName"));
                        transaction.put("CreatedDate", rs.getString("TransactionDate"));
                        transaction.put("Amount", rs.getInt("TransactionAmount"));
                        transaction.put("Status", rs.getString("TransactionStatus"));
                        transactionsWeek.add(transaction);
                    } while (rs.next());
                }
            }

            result.put("totalRecords", totalRecords);
            result.put("transactions", transactionsWeek);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    public Map<String, Object> getTransactionsWithPagination(int pageNumber, int pageSize) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> allTransactions = getTransactionsALl(); // Lấy TẤT CẢ giao dịch

        if (allTransactions == null || allTransactions.isEmpty()) {
            result.put("transactions", List.of());
            result.put("totalRecords", 0);
            return result;
        }

        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, allTransactions.size());

        List<Map<String, Object>> pagedTransactions = List.of(); // Khởi tạo mặc định

        if (startIndex >= 0 && startIndex < allTransactions.size()) {
            pagedTransactions = allTransactions.subList(startIndex, endIndex);
        }

        result.put("transactions", pagedTransactions);
        result.put("totalRecords", (long) allTransactions.size()); // Trả về tổng số lượng giao dịch (không phân trang)
        return result;
    }
    // dùng useBean để đẩy qua jsp sau đó phân trang tại jsp
    public Map<String, Object> getJobsForCurrentMonthPaginated(int page, int pageSize) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> jobsThisMonth = new ArrayList<>();
        int totalJobs = 0;

        // First query to get total count for pagination
        String countSql = "SELECT COUNT(*) AS total FROM [dbo].[Transaction] t " +
                "INNER JOIN Job j ON j.job_id = t.job_id " +
                "WHERE YEAR(j.due_date_job) = YEAR(GETDATE()) " +
                "AND MONTH(j.due_date_job) = MONTH(GETDATE())";

        // Main query with pagination
        String sql = "SELECT j.job_title, j.secure_wallet, j.status_job_id, " +
                "FORMAT(j.due_date_job, 'dd/MM/yyyy') AS due_date_job, " +
                "s.status_job_name AS job_status_name, j.job_id AS job_id " +
                "FROM [dbo].[Transaction] t " +
                "INNER JOIN Job j ON j.job_id = t.job_id " +
                "INNER JOIN StatusJob s ON j.status_job_id = s.status_job_id " +
                "WHERE YEAR(j.due_date_job) = YEAR(GETDATE()) " +
                "AND MONTH(j.due_date_job) = MONTH(GETDATE()) " +
                "ORDER BY j.due_date_job " +
                "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = dbConnection.openConnection()) {
            // Get total count first
            try (PreparedStatement countStmt = conn.prepareStatement(countSql);
                 ResultSet countRs = countStmt.executeQuery()) {
                if (countRs.next()) {
                    totalJobs = countRs.getInt("total");
                }
            }

            // Now get paginated data
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                // Calculate offset
                int offset = (page - 1) * pageSize;
                stmt.setInt(1, offset);
                stmt.setInt(2, pageSize);

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Map<String, Object> jobInfo = new HashMap<>();
                        jobInfo.put("name", rs.getString("job_title"));
                        jobInfo.put("due_date_job", rs.getString("due_date_job"));
                        int statusId = rs.getInt("status_job_id");
                        String progressText = "";
                        int progressValue = 0;

                        switch (statusId) {
                            case 1:
                                progressValue = 10;
                                progressText = "10%";
                                break;
                            case 2:
                                progressValue = 20;
                                progressText = "20%";
                                break;
                            case 3:
                            case 4:
                                progressValue = 50;
                                progressText = "50%";
                                break;
                            case 5:
                                progressValue = 80;
                                progressText = "80%";
                                break;
                            case 6:
                                progressValue = 100;
                                progressText = "100%";
                                break;
                            case 7:
                                progressValue = -1;
                                progressText = rs.getString("job_status_name");
                                break;
                            default:
                                progressValue = 0;
                                progressText = "0%";
                                break;
                        }

                        jobInfo.put("secureWallet", rs.getString("secure_wallet"));
                        jobInfo.put("progress", progressValue);
                        jobInfo.put("progressText", progressText);
                        jobInfo.put("id", rs.getInt("job_id"));
                        jobsThisMonth.add(jobInfo);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Calculate total pages
        int totalPages = (int) Math.ceil((double) totalJobs / pageSize);

        // Put all info in the result map
        result.put("jobs", jobsThisMonth);
        result.put("currentPage", page);
        result.put("totalPages", totalPages);
        result.put("totalJobs", totalJobs);
        result.put("pageSize", pageSize);

        return result;
    }
    public Map<String, Object> getDashboardStats() {
        Map<String, Object> dashboardStats = new HashMap<>();



        String sql = "SELECT " +
                "    (SELECT COUNT(*) FROM account) AS total_users, " +
                "    (SELECT COUNT(*) FROM job) AS total_jobs, " +
                "    (SELECT COUNT(*) FROM [dbo].[Transaction]) AS total_transactions, " +
                "    (SELECT COALESCE(SUM(secure_wallet * 0.03), 0) FROM Job) AS total_commission";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                dashboardStats.put("totalUsers", rs.getLong("total_users"));
                dashboardStats.put("totalJobs", rs.getLong("total_jobs"));
                dashboardStats.put("totalTransactions", rs.getLong("total_transactions"));
                dashboardStats.put("totalCommission", rs.getBigDecimal("total_commission"));
            }

        } catch (Exception e) {
            // Ghi log lỗi chi tiết hơn
            System.err.println("Lỗi khi truy vấn thống kê dashboard: " + e.getMessage());
        }
        return dashboardStats;
    }

    public Map<String, Object> getAverageTransaction() {
        Map<String, Object> averageTransaction = new HashMap<>();



        String sql ="SELECT\n" +
                "    COUNT(transaction_id) AS TotalTransactions,\n" +
                "    AVG(amount) AS AverageTransactionAmount,\n" +
                "    SUM(CASE\n" +
                "        WHEN transaction_type IN (N'Rút tiền', N'Trừ tiền') THEN -amount\n" +
                "        WHEN transaction_type = N'Thêm tiền' THEN amount\n" +
                "        ELSE 0 -- Xử lý các loại giao dịch khác nếu có\n" +
                "    END) AS NetTransactionAmount,\n" +
                "    SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS SuccessPercentage,\n" +
                "    SUM(CASE WHEN status = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS FailurePercentage\n" +
                "FROM\n" +
                "    [dbo].[Transaction];";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                averageTransaction.put("TotalTransactions", rs.getInt("TotalTransactions"));
                averageTransaction.put("AverageTransactionAmount", rs.getBigDecimal("AverageTransactionAmount"));
                averageTransaction.put("totalTransactions", rs.getBigDecimal("NetTransactionAmount"));
                averageTransaction.put("SuccessPercentage", rs.getInt("SuccessPercentage"));
                averageTransaction.put("FailurePercentage", rs.getInt("FailurePercentage"));
            }

        } catch (Exception e) {
            // Ghi log lỗi chi tiết hơn
            System.err.println( e.getMessage());
        }
        return averageTransaction;
    }


    public static void main(String[] args) {
        DashboardDAO dao = new DashboardDAO();
        System.out.println(dao.getAverageTransaction());

    }

}

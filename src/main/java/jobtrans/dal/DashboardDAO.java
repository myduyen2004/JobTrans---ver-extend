package jobtrans.dal;

import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
                "    DATEFROMPARTS(YEAR(due_date_post), MONTH(due_date_post), 1) AS month,\n" +
                "    SUM(secure_wallet*0.03) AS monthly_revenue\n" +
                "FROM\n" +
                "    Job\n" +
                "GROUP BY\n" +
                "    YEAR(due_date_post), MONTH(due_date_post)\n" +
                "ORDER BY\n" +
                "    month;";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> revenueData = new HashMap<>();
                revenueData.put("month", rs.getDate("month"));
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

            String sql = "SELECT\n" +
                    "    CAST(post_date AS DATE) AS job_date,\n" +
                    "    COUNT(*) AS total_jobs,\n" +
                    "    SUM(CASE WHEN status_job_id = 6 THEN 1 ELSE 0 END) AS completed_jobs,\n" +
                    "    SUM(CASE WHEN status_job_id != 6 THEN 1 ELSE 0 END) AS posted_jobs\n" +
                    "FROM\n" +
                    "    Job\n" +
                    "WHERE\n" +
                    "    post_date >= DATEADD(wk, DATEDIFF(wk, 7, GETDATE()), 0) -- Lấy ngày thứ Hai của tuần hiện tại\n" +
                    "    AND post_date < DATEADD(wk, DATEDIFF(wk, 7, GETDATE()), 7) -- Lấy ngày thứ Hai của tuần tiếp theo\n" +
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


    public static void main(String[] args) {
        DashboardDAO dao = new DashboardDAO();

        System.out.println(dao.getJobStatisticsByMonth().get(1));
    }
}

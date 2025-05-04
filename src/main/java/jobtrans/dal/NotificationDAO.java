package jobtrans.dal;

import jobtrans.model.Notification;
import jobtrans.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;

public class NotificationDAO {
    private final DBConnection dbConnection;

    public NotificationDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public Notification mapResultSetToNotification(ResultSet rs) throws SQLException {
        Notification noti = new Notification();
        noti.setNotificationId(rs.getInt("notification_id"));
        noti.setAccountId(rs.getInt("account_id"));
        noti.setNotificationTitle(rs.getString("notification_title"));
        noti.setNotificationContent(rs.getString("notification_content"));
        noti.setNotificationType(rs.getString("notification_type"));
        noti.setNotificationTime(rs.getTimestamp("notification_time").toLocalDateTime());
        noti.setHaveRead(rs.getBoolean("have_read"));
        noti.setLinkDetail(rs.getString("link_detail"));
        return noti;
    }

    // Lấy tất cả thông báo theo accountId, sắp xếp mới nhất
    public List<Notification> getNotificationByAccountId(int accountId) {
        List<Notification> list = new ArrayList<>();
        String sql = "SELECT * FROM Notification WHERE account_id = ? ORDER BY notification_time DESC";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToNotification(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Lấy thông báo chưa đọc theo accountId, sắp xếp mới nhất
    public List<Notification> getNotificationByUnRead(int accountId) {
        List<Notification> list = new ArrayList<>();
        String sql = "SELECT * FROM Notification WHERE account_id = ? AND have_read = 0 ORDER BY notification_time DESC";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToNotification(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //Lấy top 5 unread
    public List<Notification> getTop5NotificationByUnRead(int accountId) {
        List<Notification> list = new ArrayList<>();
        String sql = "SELECT Top 5 * FROM Notification WHERE account_id = ? AND have_read = 0 ORDER BY notification_time DESC";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToNotification(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //Lấy số lượng thông báo chưa đọc
    public int countNotificationByUnRead(int accountId) {
        List<Notification> list = new ArrayList<>();
        int nums = 0;
        String sql = "SELECT Count(*) nums FROM Notification WHERE account_id = ? AND have_read = 0";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                nums = rs.getInt("nums");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return nums;
    }

    // Lấy thông báo theo loại (type) cho accountId
    public List<Notification> getNotificationByType(int accountId, String type) {
        List<Notification> list = new ArrayList<>();
        String sql = "SELECT * FROM Notification WHERE account_id = ? AND notification_type = ? ORDER BY notification_time DESC";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.setString(2, type);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapResultSetToNotification(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public void updateListNotiUnreadByAccount(int accountId) {
        String sql = "UPDATE Notification SET have_read = 1 WHERE account_id = ? AND have_read = 0";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateNotiUnreadById(int notiId) {
        String sql = "UPDATE Notification SET have_read = 1 WHERE notification_id = ?";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, notiId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void addNotification(Notification noti) {
        String sql = "INSERT INTO Notification (account_id, notification_title, notification_content, notification_type, notification_time, have_read, link_detail) " +
                "VALUES (?, ?, ?, ?, GETDATE(), ?, ?)";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, noti.getAccountId());
            ps.setString(2, noti.getNotificationTitle());
            ps.setString(3, noti.getNotificationContent());
            ps.setString(4, noti.getNotificationType());
            ps.setBoolean(5, noti.isHaveRead());
            ps.setString(6, noti.getLinkDetail());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Notification getNotiById(int id) {
        String sql = "SELECT * FROM Notification WHERE notification_id = ?";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToNotification(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy hoặc có lỗi
    }


}

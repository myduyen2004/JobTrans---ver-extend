package jobtrans.dal;

import jobtrans.model.GroupMember;
import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GroupMemberDAO {
    private final DBConnection dbConnection;

    public GroupMemberDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public GroupMember getMemberByAccountIdAndMemberId(int accountId, int memberId) {
        String query = "SELECT * FROM Group_Member WHERE account_id = ? AND member_id = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = dbConnection.openConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accountId);
            ps.setInt(2, memberId);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new GroupMember(
                        rs.getInt("member_id"),
                        rs.getString("member_name"),
                        rs.getInt("account_id"),
                        rs.getString("bio"),
                        rs.getDate("date_of_birth"),
                        rs.getString("specialist"),
                        rs.getString("gender"),
                        rs.getInt("experience_years"),
                        rs.getString("status"),
                        rs.getString("education")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public GroupMember getMemberByMemberId(int memberId) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        GroupMember member = null;

        try {
            conn = DBConnection.getInstance().openConnection(); // Sử dụng lớp của bạn
            String sql = "SELECT * FROM Group_Member WHERE member_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, memberId);
            rs = ps.executeQuery();

            if (rs.next()) {
                member = new GroupMember();
                member.setMemberId(rs.getInt("member_id"));
                member.setMemberName(rs.getString("member_name"));
                member.setAccountId(rs.getInt("account_id"));
                member.setBio(rs.getString("bio"));
                member.setDateOfBirth(rs.getDate("date_of_birth"));
                member.setSpecialist(rs.getString("specialist"));
                member.setGender(rs.getString("gender"));
                member.setExperienceYears(rs.getInt("experience_years"));
                member.setEducation(rs.getString("education"));
                member.setStatus(rs.getString("status"));
            }

        } finally {
            // Đóng các resource
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return member;
    }

    // Phương thức cập nhật thông tin thành viên
    public boolean updateMember(GroupMember member) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        int result = 0;

        try {
            conn = DBConnection.getInstance().openConnection();
            String sql = "UPDATE Group_Member SET member_name = ?, bio = ?, date_of_birth = ?, "
                    + "specialist = ?, gender = ?, experience_years = ?, education = ? "
                    + "WHERE member_id = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, member.getMemberName());
            ps.setString(2, member.getBio());
            ps.setDate(3, member.getDateOfBirth());
            ps.setString(4, member.getSpecialist());
            ps.setNString(5, member.getGender());
            ps.setInt(6, member.getExperienceYears());
            ps.setString(7, member.getEducation());
            ps.setInt(8, member.getMemberId());

            result = ps.executeUpdate();

        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return result > 0;
    }

    // Phương thức lấy danh sách thành viên theo account_id
    public List<GroupMember> getMembersByAccountId(int accountId) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<GroupMember> memberList = new ArrayList<>();

        try {
            conn = DBConnection.getInstance().openConnection();
            String sql = "SELECT * FROM Group_Member WHERE account_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            rs = ps.executeQuery();

            while (rs.next()) {
                GroupMember member = new GroupMember();
                member.setMemberId(rs.getInt("member_id"));
                member.setMemberName(rs.getString("member_name"));
                member.setAccountId(rs.getInt("account_id"));
                member.setBio(rs.getString("bio"));
                member.setDateOfBirth(rs.getDate("date_of_birth"));
                member.setSpecialist(rs.getString("specialist"));
                member.setGender(rs.getString("gender"));
                member.setExperienceYears(rs.getInt("experience_years"));
                member.setEducation(rs.getString("education"));
                member.setStatus(rs.getString("status"));

                memberList.add(member);
            }

        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return memberList;
    }

//    public int getLowestMemberIdByAccountId(int accountId) {
//        int lowestMemberId = -1;
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        try {
//            conn = DBConnection.getInstance().openConnection();
//            String sql = "SELECT MIN(member_id) FROM Group_Member WHERE account_id = ?";
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, accountId);
//            rs = ps.executeQuery();
//
//            if (rs.next()) {
//                lowestMemberId = rs.getInt(1);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (rs != null) rs.close();
//                if (ps != null) ps.close();
//                if (conn != null) conn.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//        return lowestMemberId;
//    }

    public static void main(String[] args) {
        // Tạo đối tượng GroupMember để cập nhật thông tin
        GroupMember member = new GroupMember();

        member.setMemberId(1);
        member.setMemberName("Nguyen Van A");
        member.setBio("Giới thiệu bản thân");
        member.setDateOfBirth(new java.util.Date(1990, 4, 15)); // Ngày sinh 15 tháng 4, 1990 (lưu ý sử dụng (1990-1900) vì Date có lỗi về năm)
        member.setSpecialist("Lập trình viên");
        member.setGender("Nam");
        member.setExperienceYears(5);
        member.setEducation("Cử nhân Công nghệ Thông tin");

        // Gọi phương thức updateMember để cập nhật thông tin thành viên
        GroupMemberDAO memberDAO = new GroupMemberDAO();
        try {
            boolean isUpdated = memberDAO.updateMember(member);
            if (isUpdated) {
                System.out.println("Cập nhật thông tin thành viên thành công.");
            } else {
                System.out.println("Cập nhật thông tin thành viên không thành công.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Có lỗi trong quá trình cập nhật.");
        }
    }
}


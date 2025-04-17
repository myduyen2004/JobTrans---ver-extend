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

    public List<GroupMember> getAllMembers() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<GroupMember> members = new ArrayList<>();

        try {
            conn = DBConnection.getInstance().openConnection();
            String sql = "SELECT * FROM GroupMember";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                GroupMember member = new GroupMember();
                member.setMemberId(rs.getInt("memberId"));
                member.setMemberName(rs.getString("memberName"));
                member.setAccountId(rs.getInt("accountId"));
                member.setBio(rs.getString("bio"));
                member.setDateOfBirth(rs.getDate("dateOfBirth"));
                member.setSpeciality(rs.getString("speciality"));
                member.setGender(rs.getString("gender"));
                member.setExperienceYears(rs.getInt("experienceYears"));
                member.setStatus(rs.getString("status"));
                member.setEducation(rs.getString("education"));
                member.setAvatarMember(rs.getString("avatarMember"));
                member.setPosition(rs.getString("position"));
                members.add(member);
            }
            return members;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
//        finally {
//            closeResources(conn, ps, rs);
//        }
    }

    public GroupMember getMemberById(int memberId) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        GroupMember member = null;

        try {
            conn = DBConnection.getInstance().openConnection();
            String sql = "SELECT * FROM GroupMember WHERE member_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, memberId);
            rs = ps.executeQuery();

            if (rs.next()) {
                member = new GroupMember();
                member.setMemberId(rs.getInt("memberId"));
                member.setMemberName(rs.getString("memberName"));
                member.setAccountId(rs.getInt("accountId"));
                member.setBio(rs.getString("bio"));
                member.setDateOfBirth(rs.getDate("dateOfBirth"));
                member.setSpeciality(rs.getString("speciality"));
                member.setGender(rs.getString("gender"));
                member.setExperienceYears(rs.getInt("experienceYears"));
                member.setStatus(rs.getString("status"));
                member.setEducation(rs.getString("education"));
                member.setAvatarMember(rs.getString("avatarMember"));
                member.setPosition(rs.getString("position"));
                member.setSkills(rs.getString("skills"));
            }
            return member;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
//        finally {
//            closeResources(conn, ps, rs);
//        }
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
                member.setSpeciality(rs.getString("speciality"));
                member.setGender(rs.getString("gender"));
                member.setExperienceYears(rs.getInt("experience_years"));
                member.setEducation(rs.getString("education"));
                member.setStatus(rs.getString("status"));
                member.setAvatarMember(rs.getString("avatarMember"));
                member.setPosition(rs.getString("position"));
                member.setSkills(rs.getString("skills"));
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
    public boolean updateMember(GroupMember member) {
        Connection conn = null;
        PreparedStatement ps = null;
        int result = 0;

        try {
            conn = DBConnection.getInstance().openConnection();
            String sql = "UPDATE Group_Member SET member_name = ?, account_id = ?, bio = ?, date_of_birth = ?, "
                    + "speciality = ?, gender = ?, experience_years = ?, status = ?, education = ?, "
                    + "avatar_member = ?, position = ?, skills = ? WHERE member_id = ?";

            ps = conn.prepareStatement(sql);
            ps.setString(1, member.getMemberName());
            ps.setInt(2, member.getAccountId());
            ps.setString(3, member.getBio());
            ps.setDate(4, new java.sql.Date(member.getDateOfBirth().getTime()));
            ps.setString(5, member.getSpeciality());
            ps.setString(6, member.getGender());
            ps.setInt(7, member.getExperienceYears());
            ps.setString(8, member.getStatus());
            ps.setString(9, member.getEducation());
            ps.setString(10, member.getAvatarMember());
            ps.setString(11, member.getPosition());
            ps.setString(12, member.getSkills());
            ps.setInt(13, member.getMemberId());

            result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
//        finally {
//            closeResources(conn, ps, null);
//        }
    }

    // Delete member
    public boolean deleteMember(int memberId) {
        Connection conn = null;
        PreparedStatement ps = null;
        int result = 0;

        try {
            conn = DBConnection.getInstance().openConnection();
            String sql = "DELETE FROM Group_Member WHERE member_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, memberId);
            result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
//        finally {
//            closeResources(conn, ps, null);
//        }
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
                member.setSpeciality(rs.getString("speciality"));
                member.setGender(rs.getString("gender"));
                member.setExperienceYears(rs.getInt("experience_years"));
                member.setEducation(rs.getString("education"));
                member.setStatus(rs.getString("status"));
                member.setAvatarMember(rs.getString("avatar_member"));
                member.setPosition(rs.getString("position"));

                memberList.add(member);
            }

        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return memberList;
    }

    public boolean createMember(GroupMember member) {
        Connection conn = null;
        PreparedStatement ps = null;
        int result = 0;

        try {
            conn = DBConnection.getInstance().openConnection();
            String sql = "INSERT INTO Group_Member (member_name, account_id, bio, date_of_birth, speciality, gender, "
                    + "experience_years, status, education, avatar_member, position, skills) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = conn.prepareStatement(sql);
            ps.setString(1, member.getMemberName());
            ps.setInt(2, member.getAccountId());
            ps.setString(3, member.getBio());
            ps.setDate(4, new java.sql.Date(member.getDateOfBirth().getTime()));
            ps.setString(5, member.getSpeciality());
            ps.setString(6, member.getGender());
            ps.setInt(7, member.getExperienceYears());
            ps.setString(8, member.getStatus());
            ps.setString(9, member.getEducation());
            ps.setString(10, member.getAvatarMember());
            ps.setString(11, member.getPosition());
            ps.setString(12, member.getSkills());

            result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
//        finally {
//            closeResources(conn, ps, null);
//        }
    }


    public static void main(String[] args) {
        // Tạo đối tượng GroupMember để cập nhật thông tin
        GroupMember member = new GroupMember();

        member.setMemberId(1);
        member.setMemberName("Nguyen Van A");
        member.setBio("Giới thiệu bản thân");
        member.setDateOfBirth(new java.util.Date(1990, 4, 15)); // Ngày sinh 15 tháng 4, 1990 (lưu ý sử dụng (1990-1900) vì Date có lỗi về năm)
        member.setSpeciality("Lập trình viên");
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



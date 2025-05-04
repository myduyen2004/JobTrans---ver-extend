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
                member.setAddress(rs.getString("address"));
                member.setPhone(rs.getString("phone"));
                member.setSkills(rs.getString("skills"));
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
                member.setAvatarMember(rs.getString("avatar_member"));
                member.setPosition(rs.getString("position"));
                member.setSkills(rs.getString("skills"));
                member.setAddress(rs.getString("address"));
                member.setPhone(rs.getString("phone"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            // Đóng các resource
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return member;
    }

    public boolean updateMember(GroupMember member) {
        String sql = "UPDATE Group_Member SET member_name = ?, account_id = ?, bio = ?, date_of_birth = ?, "
                + "speciality = ?, gender = ?, experience_years = ?, status = ?, education = ?, "
                + "avatar_member = ?, position = ?, skills = ? WHERE member_id = ?";

        try (Connection conn = DBConnection.getInstance().openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setNString(1, member.getMemberName());
            ps.setInt(2, member.getAccountId());
            ps.setNString(3, member.getBio());
            ps.setDate(4, new java.sql.Date(member.getDateOfBirth().getTime()));
            ps.setNString(5, member.getSpeciality());
            ps.setNString(6, member.getGender());
            ps.setInt(7, member.getExperienceYears());
            ps.setNString(8, member.getStatus());
            ps.setNString(9, member.getEducation());
            ps.setNString(10, member.getAvatarMember());
            ps.setNString(11, member.getPosition());
            ps.setNString(12, member.getSkills());
            ps.setInt(13, member.getMemberId());

            System.out.println("Tên thành viên (DAO): " + member.getMemberName());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi khi cập nhật thành viên: " + e.getMessage());
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            System.err.println("Lỗi không xác định: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
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
                member.setAddress(rs.getString("address"));
                member.setPhone(rs.getString("phone"));
                member.setSkills(rs.getString("skills"));
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
                    + "experience_years, status, education, avatar_member, position, skills, phone, address) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = conn.prepareStatement(sql);
            ps.setNString(1, member.getMemberName());
            ps.setInt(2, member.getAccountId());
            ps.setNString(3, member.getBio());
            ps.setDate(4, new java.sql.Date(member.getDateOfBirth().getTime()));
            ps.setNString(5, member.getSpeciality());
            ps.setNString(6, member.getGender());
            ps.setInt(7, member.getExperienceYears());
            ps.setNString(8, member.getStatus());
            ps.setNString(9, member.getEducation());
            ps.setNString(10, member.getAvatarMember());
            ps.setNString(11, member.getPosition());
            ps.setNString(12, member.getSkills());
            ps.setNString(13, member.getPhone());
            ps.setNString(14, member.getAddress());

            result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}


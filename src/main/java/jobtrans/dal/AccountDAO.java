package jobtrans.dal;

import jobtrans.model.Account;
import jobtrans.utils.DBConnection;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountDAO {

    private final DBConnection dbConnection;

    public AccountDAO() {
        dbConnection = DBConnection.getInstance();
    }


    public List<Account> getAllAccounts() {

        List<Account> users = new ArrayList<>();
        String query = "SELECT * FROM Account";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("account_id"));
                account.setAccountName(rs.getString("account_name"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setPhone(rs.getString("phone"));
                account.setAvatar(rs.getString("avatar"));
                account.setBio(rs.getString("bio"));
                account.setAddress(rs.getString("address"));
                account.setDateOfBirth(rs.getDate("date_of_birth"));
                account.setGender(rs.getString("gender"));
                account.setSpecialist(rs.getString("specialist"));
                account.setExperienceYears(rs.getInt("experience_years"));
                account.setEducation(rs.getString("education"));
                account.setPoint(rs.getInt("point"));
                account.setVerifiedAccount(rs.getBoolean("verified_account"));
                account.setVerifiedLink(rs.getBoolean("verified_link"));
                account.setTagComplete(rs.getInt("tag_complete"));
                account.setTagDebt(rs.getInt("tag_debt"));
                account.setCount(rs.getInt("count"));
                account.setRole(rs.getString("role"));
                account.setType(rs.getString("type"));
                account.setSignature(rs.getString("signature"));
                account.setStatus(rs.getString("status"));

                users.add(account);
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        return users;

    }

    public boolean addUserByRegister(Account account) {
        String query = "INSERT INTO Account (account_name, email, password, avatar, status)\n" +
                "VALUES (?, ?, ?, ?,?)";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ps.setNString(1, account.getAccountName());   // Tên tài khoản
            ps.setNString(2, account.getEmail());         // Email
            ps.setNString(3, account.getPassword());      // Mật khẩu
            ps.setString(4, account.getAvatar());         // Avatar
            ps.setString(5, account.getStatus());        // Trạng thái

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                return true;  // Đăng ký thành công
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;  // Nếu có lỗi hoặc không có dòng dữ liệu nào được thêm
    }


    public Account checkLogin(String email, String password) {
        Account account = new Account();

        String query = "SELECT * FROM Account WHERE email = ? AND password = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Kiểm tra status trước khi tạo đối tượng User
                String status = rs.getString("status");
                if (status.equalsIgnoreCase("unactive")) {
                    // Nếu status bằng false (0), đăng nhập thất bại
                    return null;
                }
                account = new Account();
                account.setAccountId(rs.getInt("account_id"));
                account.setAccountName(rs.getString("account_name"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setPhone(rs.getString("phone"));
                account.setAvatar(rs.getString("avatar"));
                account.setBio(rs.getString("bio"));
                account.setAddress(rs.getString("address"));
                account.setDateOfBirth(rs.getDate("date_of_birth"));
                account.setGender(rs.getString("gender"));
                account.setSpecialist(rs.getString("specialist"));
                account.setExperienceYears(rs.getInt("experience_years"));
                account.setEducation(rs.getString("education"));
                account.setPoint(rs.getInt("point"));
                account.setVerifiedAccount(rs.getBoolean("verified_account"));
                account.setVerifiedLink(rs.getBoolean("verified_link"));
                account.setTagComplete(rs.getInt("tag_complete"));
                account.setTagDebt(rs.getInt("tag_debt"));
                account.setCount(rs.getInt("count"));
                account.setRole(rs.getString("role"));
                account.setType(rs.getString("type"));
                account.setSignature(rs.getString("signature"));
                account.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return account;

    }



    public boolean checkExistEmail(String email) {
        String query = "SELECT * FROM account WHERE email = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return false;

    }

//    public static String getMd5(String input) {
//        try {
//            MessageDigest md = MessageDigest.getInstance("MD5");
//            byte[] messageDigest = md.digest(input.getBytes());
//            BigInteger no = new BigInteger(1, messageDigest);
//            String hashtext = no.toString(16);
//            while (hashtext.length() < 32) {
//                hashtext = "0" + hashtext;
//            }
//            return hashtext;
//        } catch (NoSuchAlgorithmException e) {
//            throw new RuntimeException(e);
//        }
//    }

    public boolean updateRole(String role, String email) {
        String query = "UPDATE Account SET role = ? WHERE email = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, role);
            ps.setString(2, email);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return false;
    }

    public Account getAccountByEmail(String email) {
        Account account = null;
        String query = "SELECT * FROM account WHERE email = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                account = new Account();
                account.setAccountId(rs.getInt("account_id"));
                account.setAccountName(rs.getString("account_name"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setPhone(rs.getString("phone"));
                account.setAvatar(rs.getString("avatar"));
                account.setBio(rs.getString("bio"));
                account.setAddress(rs.getString("address"));
                account.setDateOfBirth(rs.getDate("date_of_birth"));
                account.setGender(rs.getString("gender"));
                account.setSpecialist(rs.getString("specialist"));
                account.setExperienceYears(rs.getInt("experience_years"));
                account.setEducation(rs.getString("education"));
                account.setPoint(rs.getInt("point"));
                account.setVerifiedAccount(rs.getBoolean("verified_account"));
                account.setVerifiedLink(rs.getBoolean("verified_link"));
                account.setTagComplete(rs.getInt("tag_complete"));
                account.setTagDebt(rs.getInt("tag_debt"));
                account.setCount(rs.getInt("count"));
                account.setRole(rs.getString("role"));
                account.setType(rs.getString("type"));
                account.setSignature(rs.getString("signature"));
                account.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return account;

    }

    public boolean addUserByLoginGoogle(Account account) {
        String query = "INSERT INTO [dbo].[Account] " +
                "([account_name], [email], [avatar], [status], [oauth_provider], [oauth_id], [point]) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, account.getAccountName());
            ps.setString(2, account.getEmail());
            ps.setString(3, account.getAvatar());
            ps.setString(4, account.getStatus());
            ps.setString(5, account.getOauth_provider());
            ps.setString(6, account.getOauthId());
            ps.setInt(7, 0); // Thêm cột point với giá trị mặc định là 0

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return false;
    }

    public Account getAccountByName(String name) {
        return null;
    }
    public Account getUserByEmail(String email) {
        Account account = null;
        String sql = "SELECT * FROM Account WHERE email = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                account = new Account(
                        rs.getInt("account_id"),
                        rs.getString("account_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("avatar"),
                        rs.getString("bio"),
                        rs.getString("address"),
                        rs.getDate("date_of_birth"),
                        rs.getString("gender"),
                        rs.getString("specialist"),
                        rs.getInt("experience_years"),
                        rs.getString("education"),
                        rs.getInt("point"),
                        rs.getBoolean("verified_account"),
                        rs.getBoolean("verified_link"),
                        rs.getInt("tag_complete"),
                        rs.getInt("tag_debt"),
                        rs.getInt("count"),
                        rs.getString("role"),
                        rs.getString("type"),
                        rs.getString("signature"),
                        rs.getString("status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return account;
    }

    public Account getAccountById(int id) {
        String query = "SELECT * FROM Account where account_id = ?";

        Account acc = new Account();
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                acc.setAccountId(rs.getInt("account_id"));
                acc.setAccountName(rs.getString("account_name"));
                acc.setEmail(rs.getString("email"));
                acc.setPhone(rs.getString("phone"));
                acc.setAvatar(rs.getString("avatar"));
                acc.setBio(rs.getString("bio"));
                acc.setAddress(rs.getString("address"));
                acc.setDateOfBirth(rs.getDate("date_of_birth"));
                acc.setGender(rs.getString("gender"));
                acc.setSpecialist(rs.getString("specialist"));
                acc.setExperienceYears(rs.getInt("experience_years"));
                acc.setEducation(rs.getString("education"));
                acc.setPoint(rs.getInt("point"));
                acc.setVerifiedAccount(rs.getBoolean("verified_account"));
                acc.setVerifiedLink(rs.getBoolean("verified_link"));
                acc.setTagComplete(rs.getInt("tag_complete"));
                acc.setTagDebt(rs.getInt("tag_debt"));
                acc.setCount(rs.getInt("count"));
                acc.setRole(rs.getString("role"));
                acc.setType(rs.getString("type"));
                acc.setSignature(rs.getString("signature"));
                acc.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return acc;
    }

    public Account getAccountByIdandRole(int id, String role) {
        String query = "SELECT * FROM Account where account_id = ? and role = ?";

        Account acc = new Account();
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, role);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                acc.setAccountId(rs.getInt("account_id"));
                acc.setAccountName(rs.getString("account_name"));
                acc.setEmail(rs.getString("email"));
                acc.setPhone(rs.getString("phone"));
                acc.setAvatar(rs.getString("avatar"));
                acc.setBio(rs.getString("bio"));
                acc.setAddress(rs.getString("address"));
                acc.setDateOfBirth(rs.getDate("date_of_birth"));
                acc.setGender(rs.getString("gender"));
                acc.setSpecialist(rs.getString("specialist"));
                acc.setExperienceYears(rs.getInt("experience_years"));
                acc.setEducation(rs.getString("education"));
                acc.setPoint(rs.getInt("point"));
                acc.setVerifiedAccount(rs.getBoolean("verified_account"));
                acc.setVerifiedLink(rs.getBoolean("verified_link"));
                acc.setTagComplete(rs.getInt("tag_complete"));
                acc.setTagDebt(rs.getInt("tag_debt"));
                acc.setCount(rs.getInt("count"));
                acc.setRole(rs.getString("role"));
                acc.setType(rs.getString("type"));
                acc.setSignature(rs.getString("signature"));
                acc.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return acc;
    }

    public List<Account> getAccountUser() {
        List<Account> accs = new ArrayList<>();
        String query = "SELECT * FROM Account where role <> 'admin'";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account acc = new Account();
                acc.setAccountId(rs.getInt("account_id"));
                acc.setAccountName(rs.getString("account_name"));
                acc.setEmail(rs.getString("email"));
                acc.setPhone(rs.getString("phone"));
                acc.setAvatar(rs.getString("avatar"));
                acc.setBio(rs.getString("bio"));
                acc.setAddress(rs.getString("address"));
                acc.setDateOfBirth(rs.getDate("date_of_birth"));
                acc.setGender(rs.getString("gender"));
                acc.setSpecialist(rs.getString("specialist"));
                acc.setExperienceYears(rs.getInt("experience_years"));
                acc.setEducation(rs.getString("education"));
                acc.setPoint(rs.getInt("point"));
                acc.setVerifiedAccount(rs.getBoolean("verified_account"));
                acc.setVerifiedLink(rs.getBoolean("verified_link"));
                acc.setTagComplete(rs.getInt("tag_complete"));
                acc.setTagDebt(rs.getInt("tag_debt"));
                acc.setCount(rs.getInt("count"));
                acc.setRole(rs.getString("role"));
                acc.setType(rs.getString("type"));
                acc.setSignature(rs.getString("signature"));
                acc.setStatus(rs.getString("status"));
                accs.add(acc);
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return accs;
    }
    

//    public Account getAccountById(int id) {}
//    public Account getAccountByName(String name) {}

//    public int getNumberOfAccounts() {}


//    public boolean changePassword(String email, String newPassword){}

//    public boolean addUserByLoginGoogle(Account account){}
//    public boolean editProfile(Account account){}
//    public static String getMd5(String input){}
//    public boolean updateStatus(Account account){}
//    public List<Account> getAllBanUser(){}
//    public List<Account> getAllReportUserbyId(int reportedUser){}

    public static void main(String[] args) {
        // Tạo đối tượng Account để thử nghiệm
        Account acc = new Account(
                "Nguyen Van A",                // account_name
                "nguyenvana@gmail.com",        // email
                "https://avatar.com/a.jpg",    // avatar
                "Active",                      // status
                "Google",                      // oauth_provider
                "1234567890"                   // oauth_id
        );
        AccountDAO dao = new AccountDAO();

        System.out.println(dao.checkExistEmail("sugiathanchet2004@gmail.com"));
    }
}


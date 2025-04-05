package jobtrans.dal;

import jobtrans.model.Account;
import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class AccountDAO {

    private final DBConnection dbConnection;

    public AccountDAO() {
        dbConnection = DBConnection.getInstance();
    }

//    public List<Account> getAllAccounts() {}
    public Account getAccountById(int account_id) {
    Account ac = null;
    String query = "SELECT * FROM Account WHERE account_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, account_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ac = new Account();
                ac.setAccountId(rs.getInt("account_id"));
                ac.setAccountName(rs.getString("account_name"));
                ac.setEmail(rs.getString("email"));
                ac.setPassword(rs.getString("password"));
                ac.setPhone(rs.getString("phone"));
                ac.setAvatar(rs.getString("avatar"));
                ac.setBio(rs.getString("bio"));
                ac.setAddress(rs.getString("address"));
                ac.setDateOfBirth(rs.getDate("date_of_birth"));
                ac.setGender(rs.getString("gender"));
                ac.setSpecialist(rs.getString("specialist"));
                ac.setExperienceYears(rs.getInt("experience_years"));
                ac.setEducation(rs.getString("education"));
                ac.setPoint(Integer.parseInt(rs.getString("point")));
                ac.setVerifiedAccount(rs.getBoolean("verified_account"));
                ac.setVerifiedLink(rs.getBoolean("verified_link"));
                ac.setTagComplete(rs.getInt("tag_complete"));
                ac.setTagDebt(rs.getInt("tag_debt"));
                ac.setCount(rs.getInt("count"));
                ac.setRole(rs.getString("role"));
                ac.setType(rs.getString("type"));
                ac.setSignature(rs.getString("signature"));
                ac.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return ac;
    }
//    public Account getAccountByEmail(String email) {}
    public Account getAccountByEmail(String email) {
        Account ac = null;
        String query = "SELECT * FROM Users WHERE email = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ac = new Account();
                ac.setAccountId(rs.getInt("account_id"));
                ac.setAccountName(rs.getString("account_name"));
                ac.setEmail(rs.getString("email"));
                ac.setPassword(rs.getString("password"));
                ac.setPhone(rs.getString("phone"));
                ac.setAvatar(rs.getString("avatar"));
                ac.setBio(rs.getString("bio"));
                ac.setAddress(rs.getString("address"));
                ac.setDateOfBirth(rs.getDate("dateOfBirth"));
                ac.setGender(rs.getString("gender"));
                ac.setSpecialist(rs.getString("specialist"));
                ac.setExperienceYears(rs.getInt("experience_years"));
                ac.setEducation(rs.getString("education"));
                ac.setPoint(rs.getInt("point"));
                ac.setVerifiedAccount(rs.getBoolean("verified_account"));
                ac.setVerifiedLink(rs.getBoolean("verified_link"));
                ac.setTagComplete(rs.getInt("tag_complete"));
                ac.setTagDebt(rs.getInt("tag_debt"));
                ac.setCount(rs.getInt("count"));
                ac.setRole(rs.getString("role"));
                ac.setType(rs.getString("type"));
                ac.setSignature(rs.getString("signature"));
                ac.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return ac;
    }
//    public int getNumberOfAccounts() {}
//    public Account checkLogin(String email, String password) {}
//    public boolean checkExistEmail(String email){}
    public boolean changePassword(String email, String newPassword){
        String query = "UPDATE Account SET password = ? WHERE email = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setNString(2, email);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public void updateAccount(Account account) {
        String query = "UPDATE Account SET account_name = ?, date_of_birth = ?, type = ?, gender = ?, " +
                "specialist = ?, email = ?, phone = ?, bio = ? WHERE account_id = ?";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, account.getAccountName());
            ps.setDate(2, new java.sql.Date(account.getDateOfBirth().getTime()));
            ps.setString(3, account.getType());
            ps.setString(4, account.getGender());
            ps.setString(5, account.getSpecialist());
            ps.setString(6, account.getEmail());
            ps.setString(7, account.getPhone());
            ps.setString(8, account.getBio());
            ps.setInt(9, account.getAccountId());

            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    // Đếm số Job đã hoàn thành
    public int countCompletedJobs(int account_id) {
        String query = "SELECT COUNT(*) FROM Job WHERE status = N'Đã hoàn thành' and account_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Đếm số Job đang thực hiện
    public int countInProgressJobs(int account_id) {
        String query = "SELECT COUNT(*) FROM Job WHERE status = N'Đang thực hiện' and account_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Đếm tổng số greetings
    public int countTotalGreetings(int account_id) {
        String query = "SELECT COUNT(*) FROM JobGreeting where account_id = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
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

//    public boolean addAccountByRegister(Account account){}
//    public boolean addUserByLoginGoogle(Account account){}
//    public boolean editProfile(Account account){}
//    public boolean updateStatus(Account account){}
//    public List<Account> getAllBanUser(){}
//    public List<Account> getAllReportUserbyId(int reportedUser){}

}

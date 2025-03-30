package jobtrans.dal;

import jobtrans.model.Account;
import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountDAO {

    private final DBConnection dbConnection;

    public AccountDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<Account> getAllAccounts() {
        return null;
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
    public int getNumberOfAccounts() {
        return 0;
    }
    public Account checkLogin(String email, String password) {
        return null;
    }
    public boolean checkExistEmail(String email){
        return false;
    }
    public boolean changePassword(String email, String newPassword){
        return false;
    }
    public boolean addAccountByRegister(Account account){
        return false;
    }
    public boolean addUserByLoginGoogle(Account account){
        return false;
    }
    public boolean editProfile(Account account){
        return false;
    }
    public static String getMd5(String input){
        return null;
    }
    public boolean updateStatus(Account account){
        return false;
    }
    public List<Account> getAllBanUser(){
        return null;
    }
    public List<Account> getAllReportUserbyId(int reportedUser){
        return null;
    }

}

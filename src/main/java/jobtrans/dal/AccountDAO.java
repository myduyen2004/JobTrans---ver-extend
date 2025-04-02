package jobtrans.dal;

import jobtrans.model.Account;
import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    public Account getAccountByEmail(String email) {
        return null;
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

    /**
     *
     * @return Number of unprocess report
     */
    public int getNumberOfUnprocessedReports(){
        String query = "select count(*) as unProccessReport from AccountReport where status = N'Chưa xử lý'";

        int num = 0;

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                num = rs.getInt("unProccessReport");
            }
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }

        return num;
    }
}

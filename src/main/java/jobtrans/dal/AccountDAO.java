package jobtrans.dal;

import jobtrans.model.Account;
import jobtrans.model.Transaction;
import jobtrans.utils.DBConnection;
import jobtrans.utils.ImgHandler;
import jobtrans.utils.PasswordEncoder;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AccountDAO {

    private final DBConnection dbConnection;

    public AccountDAO() {
        dbConnection = DBConnection.getInstance();
    }


    private Account mapRowToAccount(ResultSet rs) throws SQLException {
        Account account = new Account();
        account.setAccountId(rs.getInt("account_id"));
        account.setAccountName(rs.getNString("account_name"));
        account.setEmail(rs.getString("email"));
        account.setPassword(rs.getString("password"));
        account.setAvatar(rs.getString("avatar"));
        account.setOauthId(rs.getString("oauth_id"));
        account.setOauthProvider(rs.getString("oauth_provider"));
        Date dob = rs.getDate("date_of_birth");
        if (dob != null) {
            account.setDateOfBirth(dob.toLocalDate());
        } else {
            account.setDateOfBirth(null);
        }
        account.setGender(rs.getNString("gender"));
        account.setPhone(rs.getString("phone"));
        account.setAddress(rs.getNString("address"));
        account.setEducation(rs.getNString("education"));
        account.setSpeciality(rs.getNString("speciality"));
        account.setExperienceYears(rs.getInt("experience_years"));
        account.setSkills(rs.getNString("skills"));
        account.setBio(rs.getNString("bio"));
        account.setPoint(rs.getInt("point"));
        account.setStarRate(rs.getBigDecimal("star_rate"));
        account.setAmountWallet(rs.getBigDecimal("amount_wallet"));
        account.setVerifiedLink(rs.getString("verified_link"));
        account.setVerifiedAccount(rs.getBoolean("verified_account"));
        account.setCompletePercent(rs.getBigDecimal("complete_percent"));
        account.setLabelTag(rs.getString("label_tag"));
        account.setCount(rs.getInt("count"));
        account.setRole(rs.getNString("role"));
        account.setTypeAccount(rs.getNString("type_account"));
        account.setLevelAccount(rs.getNString("level_account"));
        account.setSignature(rs.getString("signature"));
        account.setJoinDate(rs.getTimestamp("join_date").toLocalDateTime());
        account.setCountMember(rs.getInt("count_member"));
        account.setStatus(rs.getNString("status"));

        return account;
    }

    public List<Account> getAllAccounts() {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM Account";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Account account = mapRowToAccount(rs);
                accounts.add(account);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return accounts;
    }

    // Method to get an account by email
    public Account getAccountByEmail(String email){
        Account account = null;
        String sql = "SELECT * FROM Account WHERE email = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setNString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    account = mapRowToAccount(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return account;
    }

    // Hàm checkLogin
    public Account checkLogin(String email, String password) {
        Account account = getAccountByEmail(email); // Lấy thông tin account theo email
        if (account != null) {
            if(account.getPassword() == null) {
                return null;
            } else if (PasswordEncoder.matches(password, account.getPassword())) {
                return account;
            }
        }else {
            return null;
        }
        return account;
    }

    // Method to get an account by ID
    public Account getAccountById(int id){
        Account account = null;
        String sql = "SELECT * FROM Account WHERE account_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    account = mapRowToAccount(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return account;
    }

    public List<Account> getTop100ByPoints() {
        List<Account> accountList = new ArrayList<>();
        String query = "SELECT TOP 100 * FROM Account ORDER BY point DESC";

        try {
            Connection conn = dbConnection.openConnection(); // Giả sử có class DBContext để quản lý kết nối
            ResultSet rs = conn.prepareStatement(query).executeQuery();

            while (rs.next()) {
                Account account = mapRowToAccount(rs);
                accountList.add(account);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accountList;
    }

    //Method to add an account by basic register and return Id
    public int addAccountBasic(Account account) {
        String sql = "INSERT INTO Account (email, password, account_name, type_account) VALUES (?, ?, ?, ?)";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, account.getEmail());
            stmt.setString(2, account.getPassword());
            stmt.setNString(3, account.getAccountName());
            stmt.setNString(4, account.getTypeAccount());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Insert failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Insert failed, no ID obtained.");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    //Method to add an account by Gmail
    public int addAccountWithGoogle(Account account) {
        String sql = "INSERT INTO Account (email, account_name, avatar, oauth_id, oauth_provider) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, account.getEmail());
            stmt.setNString(2, account.getAccountName());
            stmt.setString(3, account.getAvatar());
            stmt.setNString(4, account.getOauthId());
            stmt.setNString(5, account.getOauthProvider());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Insert failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Insert failed, no ID obtained.");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    //Method to update an account
    public boolean updateAccountByEmail(Account account) {
        String sql = "UPDATE Account SET " +
                "account_name = ?, password = ?, avatar = ?, oauth_id = ?, oauth_provider = ?, " +
                "date_of_birth = ?, gender = ?, phone = ?, address = ?, education = ?, speciality = ?, " +
                "experience_years = ?, skills = ?, bio = ?, point = ?, star_rate = ?, amount_wallet = ?, " +
                "verified_link = ?, verified_account = ?, complete_percent = ?, label_tag = ?, count = ?, " +
                "role = ?, type_account = ?, level_account = ?, signature = ?, join_date = ?, count_member = ?, status = ? " +
                "WHERE email = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setNString(1, account.getAccountName());
            stmt.setNString(2, account.getPassword());
            stmt.setNString(3, account.getAvatar());
            stmt.setNString(4, account.getOauthId());
            stmt.setNString(5, account.getOauthProvider());

            if (account.getDateOfBirth() != null) {
                stmt.setDate(6, Date.valueOf(account.getDateOfBirth()));
            } else {
                stmt.setNull(6, Types.DATE);
            }

            stmt.setNString(7, account.getGender());
            stmt.setNString(8, account.getPhone());
            stmt.setNString(9, account.getAddress());
            stmt.setNString(10, account.getEducation());
            stmt.setNString(11, account.getSpeciality());

            if (account.getExperienceYears() != null) {
                stmt.setInt(12, account.getExperienceYears());
            } else {
                stmt.setNull(12, Types.INTEGER);
            }

            stmt.setNString(13, account.getSkills());
            stmt.setNString(14, account.getBio());

            if (account.getPoint() != null) {
                stmt.setInt(15, account.getPoint());
            } else {
                stmt.setNull(15, Types.INTEGER);
            }

            stmt.setBigDecimal(16, account.getStarRate());
            stmt.setBigDecimal(17, account.getAmountWallet());
            stmt.setNString(18, account.getVerifiedLink());
            stmt.setBoolean(19, account.isVerifiedAccount());
            stmt.setBigDecimal(20, account.getCompletePercent());
            stmt.setNString(21, account.getLabelTag());

            if (account.getCount() != null) {
                stmt.setInt(22, account.getCount());
            } else {
                stmt.setNull(22, Types.INTEGER);
            }

            stmt.setNString(23, account.getRole());
            stmt.setNString(24, account.getTypeAccount());
            stmt.setNString(25, account.getLevelAccount());
            stmt.setNString(26, account.getSignature());

            if (account.getJoinDate() != null) {
                stmt.setTimestamp(27, Timestamp.valueOf(account.getJoinDate()));
            } else {
                stmt.setNull(27, Types.TIMESTAMP);
            }

            if (account.getCountMember() != null) {
                stmt.setInt(28, account.getCountMember());
            } else {
                stmt.setNull(28, Types.INTEGER);
            }

            stmt.setNString(29, account.getStatus());
            stmt.setNString(30, account.getEmail()); // WHERE email = ?

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateAccountById(Account account) {
        String sql = "UPDATE Account SET " +
                "account_name = ?, password = ?, avatar = ?, oauth_id = ?, oauth_provider = ?, " +
                "date_of_birth = ?, gender = ?, phone = ?, address = ?, education = ?, speciality = ?, " +
                "experience_years = ?, skills = ?, bio = ?, point = ?, star_rate = ?, amount_wallet = ?, " +
                "verified_link = ?, verified_account = ?, complete_percent = ?, label_tag = ?, count = ?, " +
                "role = ?, type_account = ?, level_account = ?, signature = ?, join_date = ?, count_member = ?, status = ? " +
                "WHERE account_id = ?";

        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setNString(1, account.getAccountName());
            stmt.setNString(2, account.getPassword());
            stmt.setNString(3, account.getAvatar());
            stmt.setNString(4, account.getOauthId());
            stmt.setNString(5, account.getOauthProvider());

            if (account.getDateOfBirth() != null) {
                stmt.setDate(6, Date.valueOf(account.getDateOfBirth()));
            } else {
                stmt.setNull(6, Types.DATE);
            }

            stmt.setNString(7, account.getGender());
            stmt.setNString(8, account.getPhone());
            stmt.setNString(9, account.getAddress());
            stmt.setNString(10, account.getEducation());
            stmt.setNString(11, account.getSpeciality());

            if (account.getExperienceYears() != null) {
                stmt.setInt(12, account.getExperienceYears());
            } else {
                stmt.setNull(12, Types.INTEGER);
            }

            stmt.setNString(13, account.getSkills());
            stmt.setNString(14, account.getBio());

            if (account.getPoint() != null) {
                stmt.setInt(15, account.getPoint());
            } else {
                stmt.setNull(15, Types.INTEGER);
            }

            stmt.setBigDecimal(16, account.getStarRate());
            stmt.setBigDecimal(17, account.getAmountWallet());
            stmt.setNString(18, account.getVerifiedLink());
            stmt.setBoolean(19, account.isVerifiedAccount());
            stmt.setBigDecimal(20, account.getCompletePercent());
            stmt.setNString(21, account.getLabelTag());

            if (account.getCount() != null) {
                stmt.setInt(22, account.getCount());
            } else {
                stmt.setNull(22, Types.INTEGER);
            }

            stmt.setNString(23, account.getRole());
            stmt.setNString(24, account.getTypeAccount());
            stmt.setNString(25, account.getLevelAccount());
            stmt.setNString(26, account.getSignature());

            if (account.getJoinDate() != null) {
                stmt.setTimestamp(27, Timestamp.valueOf(account.getJoinDate()));
            } else {
                stmt.setNull(27, Types.TIMESTAMP);
            }

            if (account.getCountMember() != null) {
                stmt.setInt(28, account.getCountMember());
            } else {
                stmt.setNull(28, Types.INTEGER);
            }

            stmt.setNString(29, account.getStatus());
            stmt.setNString(30, account.getEmail()); // WHERE email = ?

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //Method to update password
    public boolean updatePassword(Account account) {
        String sql = "UPDATE Account SET password = ? WHERE email = ?";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setNString(1, account.getPassword());
            stmt.setNString(2, account.getEmail());
            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    //Method to update wallet
    public boolean updateWallet(Account account) {
        String sql = "UPDATE Account SET amount_wallet = ? WHERE email = ?";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setBigDecimal(1, account.getAmountWallet());
            stmt.setNString(2, account.getEmail());
            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    //Method to update typeAccount
    public boolean updateTypeAccount(Account account) {
        String sql = "UPDATE Account SET type_account = ?, level_account = ? WHERE email = ?";
        try (Connection conn = dbConnection.openConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setNString(1, account.getTypeAccount());
            stmt.setNString(2, account.getLevelAccount());
            stmt.setNString(3, account.getEmail());
            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}


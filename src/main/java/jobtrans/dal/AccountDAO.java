package jobtrans.dal;

import jobtrans.model.Account;
import jobtrans.utils.DBConnection;

import java.util.List;

public class AccountDAO {

    private final DBConnection dbConnection;

    public AccountDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<Account> getAllAccounts() {}
    public Account getAccountById(int id) {}
    public Account getAccountByName(String name) {}
    public Account getAccountByEmail(String email) {}
    public int getNumberOfAccounts() {}
    public Account checkLogin(String email, String password) {}
    public boolean checkExistEmail(String email){}
    public boolean changePassword(String email, String newPassword){}
    public boolean addAccountByRegister(Account account){}
    public boolean addUserByLoginGoogle(Account account){}
    public boolean editProfile(Account account){}
    public static String getMd5(String input){}
    public boolean updateStatus(Account account){}
    public List<Account> getAllBanUser(){}
    public List<Account> getAllReportUserbyId(int reportedUser){}

}

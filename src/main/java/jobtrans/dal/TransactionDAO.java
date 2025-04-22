package jobtrans.dal;

import jobtrans.utils.DBConnection;

public class TransactionDAO {
    private final DBConnection dbConnection;

    public TransactionDAO() {
        dbConnection = DBConnection.getInstance();
    }


}

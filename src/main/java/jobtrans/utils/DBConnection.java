package jobtrans.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import jobtrans.config.Configuration;

public class DBConnection implements Configuration{
    private static DBConnection instance;

    public DBConnection() {
    }

    public Connection openConnection() throws Exception{
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url, user, pass);
        return con;
    }
    public static DBConnection getInstance() {
        if(instance == null){
            instance = new DBConnection();
        }
        return instance;
    }
}
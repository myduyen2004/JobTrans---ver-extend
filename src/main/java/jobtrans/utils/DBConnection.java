package jobtrans.utils;

import jobtrans.config.Configuration;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection implements Configuration{
    private static DBConnection instance;

    public DBConnection() {
    }

    public static Connection openConnection() throws Exception{
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
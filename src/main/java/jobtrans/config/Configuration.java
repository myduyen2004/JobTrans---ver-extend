package jobtrans.config;

/**
 *
 * @author admin
 */
public interface Configuration {
    public static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    // Cấu hình URL - THAY ĐỔI CÁC GIÁ TRỊ SAU THEO MÔI TRƯỜNG CỦA BẠN
    public static String url = "jdbc:sqlserver://localhost:1433;"
            + "databaseName=JobTransnew;"
            + "encrypt=true;&characterEncoding=UTF-8;trustServerCertificate=true;"; // Bật trust cho môi trường dev

    // Thông tin đăng nhập - THAY ĐỔI THEO CẤU HÌNH THỰC TẾ
    public static String user = "SA";
    public static String pass = "YourStrong!Passw0rd";

    public static String templatePath = null;


}


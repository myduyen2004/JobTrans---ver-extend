package jobtrans.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class PasswordEncoder {

    // Phương thức mã hóa mật khẩu sử dụng SHA-256 với salt
    public static String encode(String password) {
        try {
            // Tạo salt ngẫu nhiên
            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[16];
            random.nextBytes(salt);

            // Tạo hash từ mật khẩu và salt
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt);
            byte[] hashedPassword = md.digest(password.getBytes());

            // Kết hợp salt và hash thành một chuỗi
            byte[] combined = new byte[salt.length + hashedPassword.length];
            System.arraycopy(salt, 0, combined, 0, salt.length);
            System.arraycopy(hashedPassword, 0, combined, salt.length, hashedPassword.length);

            // Mã hóa kết quả thành chuỗi Base64
            return Base64.getEncoder().encodeToString(combined);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Lỗi khi mã hóa mật khẩu", e);
        }
    }

    // Phương thức kiểm tra mật khẩu
    public static boolean matches(String rawPassword, String encodedPassword) {
        try {
            // Giải mã chuỗi Base64
            byte[] combined = Base64.getDecoder().decode(encodedPassword);

            // Tách salt và hash
            byte[] salt = new byte[16];
            byte[] hashedPassword = new byte[combined.length - 16];
            System.arraycopy(combined, 0, salt, 0, 16);
            System.arraycopy(combined, 16, hashedPassword, 0, hashedPassword.length);

            // Tạo hash từ mật khẩu đầu vào và salt đã lưu
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt);
            byte[] newHashedPassword = md.digest(rawPassword.getBytes());

            // So sánh hai hash
            return MessageDigest.isEqual(hashedPassword, newHashedPassword);
        } catch (NoSuchAlgorithmException | IllegalArgumentException e) {
            return false;
        }
    }

    public static void main(String[] args) {
        System.out.println(encode("admin12345678"));
        System.out.println(encode("12345678910"));
    }
}
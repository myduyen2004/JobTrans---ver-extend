package jobtrans.utils;

import jobtrans.config.Configuration;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class Gmail {
    private final String smtpHost = "smtp.gmail.com";
    private final String smtpPort = "587";
    private final String username = "sugiathanchet2004@gmail.com";
    private final String password = "hygg aksu yhpc ovxe";

    private final String fromEmail = username;
    private String toEmail;
    private String contentType;
    private String subject;
    private String content;

    private Map<String, String> macrosMap;

    public Gmail(String... toEmail) {
        this.toEmail = "";
        for (int i = toEmail.length - 1; i >= 0; i--) {
            this.toEmail += toEmail[i];
            if (i != 0) {
                this.toEmail += ", ";
            }
        }
    }

    public Gmail setContentType(String contentType) {
        this.contentType = contentType;
        return this;
    }

    public Gmail setSubject(String subject) {
        this.subject = subject;
        return this;
    }

    public Gmail initContent(String content) {
        this.content = content;
        return this;
    }

    public Gmail appendContent(String content) {
        this.content += content;
        return this;
    }

    public Gmail initMacro() {
        macrosMap = new HashMap<>();
        return this;
    }

    public Gmail appendMacro(String macro, String value) {
        macrosMap.put(macro, value);
        return this;
    }

    public void send() throws UnsupportedEncodingException {
        if (contentType == null) {
            contentType = "text/plain";
        }
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", smtpPort);

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
            message.setContent(content, contentType);

            Transport.send(message);
        } catch (MessagingException ex) {
            System.out.println(ex);
        }
    }

    private String standardize(String str) {
        for (String macro : macrosMap.keySet()) {
            str = str.replaceAll("\\[" + macro + "\\]", macrosMap.get(macro));
        }
        return str;
    }

    public void sendTemplate(String filePath) {
        if (content != null || macrosMap == null) {
            return;
        } else {
            filePath = Configuration.templatePath.concat(filePath);
            try {
                BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath)));
                String line;
                Gmail g = this.initContent("");
                while ((line = br.readLine()) != null) {
                    g = g.appendContent(standardize(line)).appendContent("\n");
                }
                g.send();
            } catch (IOException ex) {
                Logger.getLogger(Gmail.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public URL convertToLocalStorage(URL remoteURL) {
        if (remoteURL == null) {
            return null;
        }

        String localURL = "http://localhost" + remoteURL.getPath();
        if (remoteURL.getQuery() != null) {
            localURL += "?" + remoteURL.getQuery();
        }

        try {
            return new URL(localURL);
        } catch (MalformedURLException ex) {
            Logger.getLogger(Gmail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void sendTemplate(URL filePath) {
        if (content != null || macrosMap == null) {
            return;
        } else {
            try {
                BufferedReader br = new BufferedReader(new InputStreamReader(filePath.openStream(), StandardCharsets.UTF_8));
                String line;
                Gmail g = this.initContent("");
                while ((line = br.readLine()) != null) {
                    g = g.appendContent(standardize(line)).appendContent("\n");
                }
//                System.out.println(content);
                g.send();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
//    private static boolean sendVerificationMail(String userName, String subject, String email, String code) {
//        try {
//            new Gmail(email)
//                    .setContentType("text/html; charset=UTF-8")
//                    .setSubject(subject)
//                    .initMacro()
//                    .appendMacro("NAME", userName)
//                    .appendMacro("CODE", code)
//                    .sendTemplate(new URL("http://localhost:8080/JobTrans/mail-noti/verify-account.jsp"));
//
//            // Nếu không có lỗi, trả về true
//            return true;
//        } catch (MalformedURLException ex) {
//            Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
//            // Nếu gặp lỗi, trả về false
//            return false;
//        } catch (Exception ex) {
//            Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, "Lỗi khi gửi email: ", ex);
//            // Nếu gặp lỗi khác, trả về false
//            return false;
//        }
//    }
//
//    public static void main(String[] args) {
//        String otpvalue = RandomGenerator.randString(RandomGenerator.NUMERIC_CHARACTER, 6);
//
//        // Tạo một thread mới để gửi email
//        new Thread(() -> {
//            boolean emailSent = sendVerificationMail("Duyen", "Xác thực đăng kí", "vtmyduyen3103@gmail.com", otpvalue);
//
//            // Kiểm tra kết quả và log thông báo
//            if (emailSent) {
//                System.out.println("Email đã được gửi thành công.");
//            } else {
//                System.out.println("Gửi email thất bại.");
//            }
//        }).start();
//    }

}


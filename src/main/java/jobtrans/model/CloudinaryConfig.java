package jobtrans.model;


import com.cloudinary.Cloudinary;

import java.util.HashMap;
import java.util.Map;

public class CloudinaryConfig {
    private static Cloudinary cloudinary;

    static {
        Map<String, String> config = new HashMap<>();
        config.put("cloud_name", "dnicohhja");
        config.put("api_key", "JobTrans");
        config.put("api_secret", "467738894942688");

        cloudinary = new Cloudinary(config);
    }

    public static Cloudinary getInstance() {
        return cloudinary;
    }
}

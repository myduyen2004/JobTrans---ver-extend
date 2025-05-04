package jobtrans.controller.upload;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jobtrans.model.CloudinaryConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

@WebServlet("/uploadFile")
@MultipartConfig
public class UploadFileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("file"); // input name="file"
        InputStream fileStream = filePart.getInputStream();

        Cloudinary cloudinary = CloudinaryConfig.getInstance();

        Map uploadResult = cloudinary.uploader().upload(fileStream, ObjectUtils.asMap(
                "resource_type", "raw", // raw dùng cho file không phải ảnh/video
                "public_id", "uploaded_jsp_file_" + System.currentTimeMillis()
        ));

        String fileUrl = (String) uploadResult.get("secure_url");
        response.getWriter().println("Uploaded URL: " + fileUrl);
    }
}


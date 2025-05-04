package jobtrans.controller.cv;

import jobtrans.dal.AccountDAO;
import jobtrans.dal.CvDAO;
import jobtrans.model.*;
import jobtrans.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "CVServlet", urlPatterns = {"/cv"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class CVServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            try {
                String typeIdStr = request.getParameter("typeId");

                int typeId = 0; // Giá trị mặc định


                if (typeIdStr != null && !typeIdStr.trim().isEmpty()) {
                    try {
                        typeId = Integer.parseInt(typeIdStr.trim());
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Invalid typeId format");
                        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                        return;
                    }
                }

                // Lưu typeId vào request attribute để sử dụng trong createCV
                request.setAttribute("typeId", typeId);

                createCV(request, response);
            } catch (Exception ex) {
                Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if ("update".equals(action)) {
            try {
                String typeIdStr = request.getParameter("typeId");
                String cvIdStr = request.getParameter("cvId");

//                System.out.println("test cv vòng 0 "+request.getParameter("cvId"));
//
//                System.out.println("cvId test vòng 1 parameter: " + cvIdStr);
//                System.out.println("typeId parameter: " + typeIdStr);

                // Kiểm tra và xử lý cvId và typeId
                int typeId = 0; // Giá trị mặc định
                int cvId = 0;   // Giá trị mặc định

                // Kiểm tra và parse typeId
                if (typeIdStr != null && !typeIdStr.trim().isEmpty()) {
                    try {
                        typeId = Integer.parseInt(typeIdStr.trim());
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Invalid typeId format");
                        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                        return;
                    }
                }

                // Kiểm tra và parse cvId
                if (cvIdStr != null && !cvIdStr.trim().isEmpty()) {
                    try {
                        cvId = Integer.parseInt(cvIdStr.trim());
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Invalid cvId format");
                        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                        return;
                    }
                }

                // Lưu typeId và cvId vào request attribute để sử dụng trong updateCV
                request.setAttribute("typeId", typeId);
                request.setAttribute("cvid", cvId);

                updateCV(request, response);

            } catch (Exception ex) {
                Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if ("SaveCVload".equals(action)) {
            String cvId = request.getParameter("cvId");
            String reviewLink = request.getParameter("reviewLink");

            if (cvId == null || reviewLink == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu tham số cvId hoặc reviewLink");
                return;
            }

            System.out.println("Đang lưu link CV review: " + reviewLink);

            // Sửa lại câu SQL để update đúng tên bảng và tên cột
            String sql = "UPDATE CV SET link_cv_review = ? WHERE CV_id = ?";

            try (Connection conn = DBConnection.openConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, reviewLink);
                stmt.setInt(2, Integer.parseInt(cvId));

                int affectedRows = stmt.executeUpdate();

                if (affectedRows == 0) {
                    // Nếu không có bản ghi nào được cập nhật
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy CV với ID: " + cvId);
                    return;
                }

                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("Lưu link CV review thành công");

            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi database: " + e.getMessage());
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID CV không hợp lệ");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "list":
                viewList(request, response);
                break;
            case "type":
                viewByType(request, response);
                break;
            case "mauCV":
                viewMauCV(request, response);
                break;
            case "load-editing":
                loadEditing(request, response);
                break;
            case "view":
                viewCV(request, response);
                break;
            case "delete":
                deleteCv(request, response);
                break;
//        case "load-editing":
//            loadEditing(request, response);
//            break;
//        case "update":
//        {
//            try {
//                updateCV(request, response);
//            } catch (ParseException ex) {
//                Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        break;

            default:
                response.getWriter().print("Lỗi rồi má");
                break;
        }

    }

    private void updateCV(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        PrintWriter out = response.getWriter();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session = request.getSession();

        String email = (String) session.getAttribute("account");
        CvDAO cvDao = new CvDAO();
        AccountDAO accountDAO = new AccountDAO();

//        System.out.println("cvId test vòng 2 parameter: " + request.getParameter("cvId"));
//        System.out.println("typeId parameter: " + request.getParameter("typeId"));
//        Account account = accountDAO.getAccountByEmail(email);
        // Get the CV ID to update from request or session

        String cvId = request.getParameter("cvId");

        int CvId = Integer.parseInt(cvId);
        CV existingCV = cvDao.getCvById(CvId);
        if (existingCV == null) {
            request.setAttribute("error", "CV not found");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }


        // Update basic CV information
        String TypeCV = request.getParameter("typeId");
        int cvType = (TypeCV != null) ? Integer.parseInt(TypeCV) : existingCV.getCvType();

        String backGroundColor = request.getParameter("backGroundColor");
        if (backGroundColor == null || backGroundColor.isEmpty()) {
            backGroundColor = existingCV.getBackroundColor();
        }

        String name = request.getParameter("cvname");
        String position = request.getParameter("position");
        String more_infor = request.getParameter("more_infor");
        String experienceDescription = request.getParameter("experienceDescription");

        // Handle file upload (avatar)
        Part filePart = request.getPart("avatar_cv");
        String fileName = null;

        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            existingCV.setAvatarCv("uploads/" + fileName);
        }
        // If no new file uploaded, keep the existing avatar

        // Update personal information
        String sex = request.getParameter("sex");
        String date_of_birth = request.getParameter("date_of_birth");
        String sdt = request.getParameter("sdt");
        String email_cv = request.getParameter("email");
        String address = request.getParameter("address");

        existingCV.setBackroundColor(backGroundColor);
        existingCV.setCvName(name != null ? name : existingCV.getCvName());
        existingCV.setJobPosition(position != null ? position : existingCV.getJobPosition());
        existingCV.setMoreInfo(more_infor != null ? more_infor : existingCV.getMoreInfo());
        existingCV.setSummary(experienceDescription != null ? experienceDescription : existingCV.getSummary());
        existingCV.setSex(sex != null ? sex : existingCV.getSex());

        if (date_of_birth != null && !date_of_birth.isEmpty()) {
            existingCV.setDateOfBirth(dateFormat.parse(date_of_birth));
        }

        existingCV.setSdt(sdt != null ? sdt : existingCV.getSdt());
        existingCV.setEmail(email_cv != null ? email_cv : existingCV.getEmail());
        existingCV.setAddress(address != null ? address : existingCV.getAddress());
        existingCV.setCvType(cvType);

        // Update experiences
        String[] companyIds = request.getParameterValues("Company[]");
        String[] otherCompanyNames = request.getParameterValues("otherCompanyName[]");
        String[] experienceStartDates = request.getParameterValues("companyStartDate[]");
        String[] experienceEndDates = request.getParameterValues("companyEndDate[]");
        String[] positions = request.getParameterValues("position[]");
        String[] descriptions = request.getParameterValues("description[]");
        String[] workAchievements = request.getParameterValues("work_achievements[]");
        String[] addresss = request.getParameterValues("address[]");

        List<Experience> experiences = new ArrayList<>();
        if (companyIds != null && experienceStartDates != null
                && experienceEndDates != null && positions != null) {
            for (int i = 0; i < companyIds.length; i++) {
                try {
                    Experience experience = new Experience();
                    int experienceId = Integer.parseInt(companyIds[i]);
                    experience.setExperienceId(experienceId);

                    String customCompany = null;
                    if (experienceId == 32) { // Assuming 32 is "Other" option
                        customCompany = (otherCompanyNames != null && i < otherCompanyNames.length)
                                ? otherCompanyNames[i] : null;
                    }
                    experience.setCustomCompany(customCompany);

                    Date startDate = !experienceStartDates[i].isEmpty()
                            ? dateFormat.parse(experienceStartDates[i]) : null;
                    Date endDate = !experienceEndDates[i].isEmpty()
                            ? dateFormat.parse(experienceEndDates[i]) : null;
                    experience.setStartAt(startDate);
                    experience.setEndAt(endDate);

                    experience.setJobPosition(positions[i]);
                    experience.setDescription((descriptions != null && i < descriptions.length)
                            ? descriptions[i] : null);
                    experience.setAchievement((workAchievements != null && i < workAchievements.length)
                            ? workAchievements[i] : null);
                    experience.setAddress((addresss != null && i < addresss.length)
                            ? addresss[i] : null);
                    experiences.add(experience);
                } catch (NumberFormatException | ParseException e) {
                    e.printStackTrace();
                }
            }
        }
        existingCV.setExperienceList(experiences);

        // Update certifications
        String[] certificationIds = request.getParameterValues("certificationId[]");
        String[] otherCertificationNames = request.getParameterValues("otherCertificationName[]");
        String[] awardYears = request.getParameterValues("awardYear[]");
        String[] prizeDescriptions = request.getParameterValues("prizeDescription[]");

        List<Certification> certifications = new ArrayList<>();
        if (certificationIds != null && awardYears != null) {
            for (int i = 0; i < certificationIds.length; i++) {
                try {
                    Certification certification = new Certification();
                    int certificationId = Integer.parseInt(certificationIds[i]);
                    String otherCertificationName = null;

                    if (certificationId == 35) {
                        otherCertificationName = otherCertificationNames[i];
                    }

                    Date awardYear = dateFormat.parse(awardYears[i]);
                    String prizeDescription = prizeDescriptions[i];
                    certification.setCertificationId(certificationId);
                    certification.setAwardYear(awardYear);
                    certification.setDescription(prizeDescription);
                    certification.setCustomCertification(otherCertificationName);

                    certifications.add(certification);
                } catch (Exception e) {
                    response.getWriter().print(e);
                }
            }
        }
        existingCV.setCertificationList((ArrayList<Certification>) certifications);

        // Update education
        String[] schoolIds = request.getParameterValues("schoolId[]");
        String[] otherSchoolNames = request.getParameterValues("otherSchoolName[]");
        String[] educationStartDates = request.getParameterValues("educationStartDate[]");
        String[] educationEndDates = request.getParameterValues("educationEndDate[]");
        String[] degrees = request.getParameterValues("degree[]");
        String[] majors = request.getParameterValues("major[]");
        String[] schoolDescriptions = request.getParameterValues("school_Description[]");

        List<Education> educations = new ArrayList<>();
        if (schoolIds != null && educationStartDates != null && educationEndDates != null
                && majors != null && degrees != null && schoolDescriptions != null) {
            try {
                for (int i = 0; i < schoolIds.length; i++) {
                    Education education = new Education();
                    int educationId = Integer.parseInt(schoolIds[i]);
                    education.setEducationId(educationId);
                    education.setDegree(degrees[i]);
                    education.setFieldOfStudy(majors[i]);
                    education.setStartDate(dateFormat.parse(educationStartDates[i]));
                    education.setEndDate(dateFormat.parse(educationEndDates[i]));
                    education.setMoreInfor(schoolDescriptions[i]);

                    if (education.getEducationId() == 95 && otherSchoolNames != null && i < otherSchoolNames.length) {
                        education.setCustomSchool(otherSchoolNames[i]);
                    }

                    educations.add(education);
                }
            } catch (Exception e) {
                Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, "Error processing education data", e);
                request.setAttribute("error", "Lỗi khi xử lý thông tin học vấn");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                return;
            }
        }
        existingCV.setEducationList((ArrayList<Education>) educations);

        // Update skills
        String[] mainSkillIds = request.getParameterValues("mainSkillId[]");
        String[] skillIds = request.getParameterValues("skillId[]");
        String[] otherSkillNames = request.getParameterValues("otherSkillName[]");
        String[] levelSkills = request.getParameterValues("levelSkill[]");
        System.out.println("levelSkills: " + Arrays.toString(levelSkills));

        List<Skill> skills = new ArrayList<>();
        if (skillIds != null && mainSkillIds != null && levelSkills != null) {
            for (int i = 0; i < skillIds.length; i++) {
                try {
                    Skill skill = new Skill();
                    int skillId = Integer.parseInt(skillIds[i].trim());
                    int mainSkillId = Integer.parseInt(mainSkillIds[i].trim());
                    int levelSkill = Integer.parseInt(levelSkills[i].trim());

                    String skillCustom = (skillId == 31 && otherSkillNames != null && i < otherSkillNames.length)
                            ? otherSkillNames[i] : null;

                    skill.setSkillId(skillId);
                    skill.setMainSkillId(mainSkillId);
                    skill.setLevelSkill(levelSkill);
                    skill.setSkillCustom(skillCustom);

                    skills.add(skill);
                } catch (NumberFormatException e) {
                    System.err.println("Error parsing skill data at index " + i + ": " + e.getMessage());
                }
            }
        }
        existingCV.setSkillList(skills);

        // Update the CV in database
        try {
            cvDao.updateCV(existingCV);
            session.setAttribute("cvId", existingCV.getCvId());
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("error", "Failed to update CV");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            return;
        }

        if (existingCV.getCvType() == 1) {
            request.setAttribute("CV", existingCV);
            request.getRequestDispatcher("showCV1.jsp").forward(request, response);
        } else if (existingCV.getCvType() == 2) {
            request.setAttribute("CV", existingCV);
            request.getRequestDispatcher("showCV2.jsp").forward(request, response);
        }else if (existingCV.getCvType()==3){
            request.setAttribute("CV", existingCV);
            request.getRequestDispatcher("showCV3.jsp").forward(request, response);
        }
        else if (existingCV.getCvType()==4){
            request.setAttribute("CV", existingCV);
            request.getRequestDispatcher("showCV4.jsp").forward(request, response);
        }


    }

    private void createCV(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        PrintWriter out = response.getWriter();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("sessionAccount");

        CvDAO cvDao = new CvDAO();
        AccountDAO accountDAO = new AccountDAO();

//        Account u = accountDAO.getAccountByEmail(email);
        CV cv = new CV();
        int accountId = account.getAccountId();
        Account u = accountDAO.getAccountById(account.getAccountId());

        String TypeCV = request.getParameter("typeId");

        int cvType = 0;
        if (TypeCV != null) {
            cvType = Integer.parseInt(TypeCV);
        } else {
            request.setAttribute("fail", "Tạo CV thất bại");
        }

//        String backGroundColor = request.getParameter("backGroundColor");
        String backGroundColor = "#ffffff"; // Giá trị mặc đ��nh

        String name = request.getParameter("cvname");
        String position = request.getParameter("position");
        String more_infor = request.getParameter("more_infor");
        String experienceDescription = request.getParameter("experienceDescription");


        Part filePart = request.getPart("avatar_cv");
        String fileName = null;
        String filePath = null;

        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            cv.setAvatarCv("uploads/" + fileName);
        } else {
            cv.setAvatarCv("path/to/default/avatar.jpg"); // Giá trị mặc định
        }

        // Lưu đường dẫn file vào database


        String sex = request.getParameter("sex");
        String date_of_birth = request.getParameter("date_of_birth");
        String sdt = request.getParameter("sdt");
        String email_cv = request.getParameter("email");
        String address = request.getParameter("address");


        cv.setAccountId(accountId);
//        cv.setAccountId(u.getAccountId());
        cv.setBackroundColor(backGroundColor);

        cv.setCvName(name);
        cv.setJobPosition(position);
        cv.setMoreInfo(more_infor);
        cv.setSummary(experienceDescription);
        cv.setSex(sex);
        cv.setDateOfBirth(dateFormat.parse(date_of_birth));
        cv.setSdt(sdt);
        cv.setEmail(email_cv);
        cv.setAddress(address);
        cv.setCvType(cvType);
        cv.setAvatarCv("uploads/" + fileName);


        String[] companyIds = request.getParameterValues("Company[]");
        String[] otherCompanyNames = request.getParameterValues("otherCompanyName[]");
        String[] experienceStartDates = request.getParameterValues("companyStartDate[]");  // Changed to match HTML
        String[] experienceEndDates = request.getParameterValues("companyEndDate[]");      // Changed to match HTML
        String[] positions = request.getParameterValues("position[]");
        String[] descriptions = request.getParameterValues("description[]");
        String[] workAchievements = request.getParameterValues("work_achievements[]");
        String[] addresss = request.getParameterValues("address[]");
        List<Experience> experiences = new ArrayList<>();
        if (companyIds != null && experienceStartDates != null
                && experienceEndDates != null && positions != null) {

            SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd"); // Match HTML date input format

            for (int i = 0; i < companyIds.length; i++) {
                try {
                    Experience experience = new Experience();

                    // Handle company ID (which is actually experience_id in your DB)
                    int experienceId = Integer.parseInt(companyIds[i]);

                    experience.setExperienceId(experienceId);

                    // Handle custom company name (for "other" selection)
                    String customCompany = null;
                    if (experienceId == 1) { // Assuming 32 is "Other" option
                        customCompany = (otherCompanyNames != null && i < otherCompanyNames.length)
                                ? otherCompanyNames[i] : null;
                    }
                    experience.setCustomCompany(customCompany);

                    // Parse dates
                    Date startDate = !experienceStartDates[i].isEmpty()
                            ? dateFormat1.parse(experienceStartDates[i]) : null;
                    Date endDate = !experienceEndDates[i].isEmpty()
                            ? dateFormat1.parse(experienceEndDates[i]) : null;
                    experience.setStartAt(startDate);
                    experience.setEndAt(endDate);


                    // Set other fields
                    experience.setJobPosition(positions[i]);
                    experience.setDescription((descriptions != null && i < descriptions.length)
                            ? descriptions[i] : null);
                    experience.setAchievement((workAchievements != null && i < workAchievements.length)
                            ? workAchievements[i] : null);
                    experience.setAddress((addresss != null && i < addresss.length)
                            ? addresss[i] : null);
                    experiences.add(experience);

                } catch (NumberFormatException | ParseException e) {
                    // Handle error (log it and maybe continue with next experience)
                    e.printStackTrace();
                }
            }
        }

        cv.setExperienceList(experiences);


        String[] certificationIds = request.getParameterValues("certificationId[]");
        String[] otherCertificationNames = request.getParameterValues("otherCertificationName[]");
        String[] awardYears = request.getParameterValues("awardYear[]");
        String[] prizeDescriptions = request.getParameterValues("prizeDescription[]");

        List<Certification> certifications = new ArrayList<>();
        if (certificationIds != null && awardYears != null) {

            int length = certificationIds.length;
            response.getWriter().print(length);
            for (int i = 0; i < length; i++) {
                Certification certification = new Certification();
                try {
                    int certificationId = Integer.parseInt(certificationIds[i]);
                    String otherCertificationName = null;

                    if (certificationId == 1) {
                        otherCertificationName = otherCertificationNames[i];
                    } else {
                        otherCertificationName = null;
                    }
                    Date awardYear = dateFormat.parse(awardYears[i]);
                    String prizeDescription = prizeDescriptions[i];
                    certification.setCertificationId(certificationId);
                    certification.setAwardYear(awardYear);
                    certification.setDescription(prizeDescription);
                    certification.setCustomCertification(otherCertificationName);

                    certifications.add(certification);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                } catch (ArrayIndexOutOfBoundsException e) {
                    response.getWriter().print(e);
                    break; // Hoặc xử lý tùy ý
                }
            }
        }
        response.getWriter().print(cv);
        cv.setCertificationList((ArrayList<Certification>) certifications);


        // Thay thế phần code hiện tại bằng:
        String[] schoolIds = request.getParameterValues("schoolId[]");
        String[] otherSchoolNames = request.getParameterValues("otherSchoolName[]");
        String[] educationStartDates = request.getParameterValues("educationStartDate[]");
        String[] educationEndDates = request.getParameterValues("educationEndDate[]");
        String[] degrees = request.getParameterValues("degree[]");
        String[] majors = request.getParameterValues("major[]");
        String[] schoolDescriptions = request.getParameterValues("school_Description[]"); // Sửa tên parameter

        List<Education> educations = new ArrayList<>();
        if (schoolIds != null && educationStartDates != null && educationEndDates != null
                && majors != null && degrees != null && schoolDescriptions != null) {

            try {
                for (int i = 0; i < schoolIds.length; i++) {
                    Education education = new Education();


                    int educationId = Integer.parseInt(schoolIds[i]);

                    education.setEducationId(educationId);


                    education.setDegree(degrees[i]);
                    education.setFieldOfStudy(majors[i]);
                    education.setStartDate(dateFormat.parse(educationStartDates[i]));
                    education.setEndDate(dateFormat.parse(educationEndDates[i]));
                    education.setMoreInfor(schoolDescriptions[i]);

                    if (education.getEducationId() == 1 && otherSchoolNames != null && i < otherSchoolNames.length) {
                        education.setCustomSchool(otherSchoolNames[i]);
                    }

                    educations.add(education);
                }
            } catch (Exception e) {
                Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, "Error processing education data", e);
                request.setAttribute("error", "Lỗi khi xử lý thông tin học vấn");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                return;
            }
        }
        cv.setEducationList((ArrayList<Education>) educations);

        String[] mainSkillIds = request.getParameterValues("mainSkillId[]");
        String[] skillIds = request.getParameterValues("skillId[]");
        String[] otherSkillNames = request.getParameterValues("otherSkillName[]");
        String[] levelSkills = request.getParameterValues("levelSkill[]");

        List<Skill> skills = new ArrayList<>();
        if (skillIds != null && mainSkillIds != null && levelSkills != null) {
            for (int i = 0; i < skillIds.length; i++) {
                try {
                    Skill skill = new Skill();

                    // Parse IDs
                    int skillId = Integer.parseInt(skillIds[i]);
                    int mainSkillId = Integer.parseInt(mainSkillIds[i]);
                    int levelSkill = Integer.parseInt(levelSkills[i]);

                    // Handle custom skill name
                    String skillCustom = (skillId == 1 && otherSkillNames != null && i < otherSkillNames.length)
                            ? otherSkillNames[i] : null;

                    // Set skill properties
                    skill.setSkillId(skillId);
                    skill.setMainSkillId(mainSkillId);
                    skill.setLevelSkill(levelSkill);
                    skill.setSkillCustom(skillCustom);

                    skills.add(skill);

                } catch (NumberFormatException e) {
                    // Log error but continue processing other skills
                    System.err.println("Error parsing skill data at index " + i + ": " + e.getMessage());
                }
            }
        }

        cv.setSkillList(skills);


        try {
            int cvId = cvDao.addCV(cv);
            session.setAttribute("cvId", cvId);
            cv.setCvId(cvId);
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        System.out.println("test 2" + cvType);
        System.out.println("test 3" + cv.getCvType());


        if (cv.getCvType() == 1) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("showCV1.jsp").forward(request, response);
        } else if (cv.getCvType() == 2) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("showCV2.jsp").forward(request, response);
        }
        else if (cv.getCvType()==3){
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("showCV3.jsp").forward(request, response);
        }
        else if (cv.getCvType()==4){
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("showCV4.jsp").forward(request, response);
        }


    }

    private void deleteCv(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        String email = (String) session.getAttribute("account");
//
        int cvId = Integer.parseInt(request.getParameter("cvId"));
        CvDAO cvDao = new CvDAO();

        try {
            cvDao.deleteCvByCvId(cvId);
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("success", "Xóa CV thành công");
        request.getRequestDispatcher("cv?action=list").forward(request, response);

        //viewList(request, response);
        //    session.removeAttribute("cvId");
    }


    private void viewCV(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        String email = (String) session.getAttribute("account");
        int cvId = Integer.parseInt(request.getParameter("cvId"));


        CvDAO cvDao = new CvDAO();
        CV cv = new CV();
        try {
            cv = cvDao.getCvById(cvId);
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }


        if (cv.getCvType() == 1) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("showCV1.jsp").forward(request, response);
        } else if (cv.getCvType() == 2) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("showCV2.jsp").forward(request, response);
        } else if (cv.getCvType() == 3) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("showCV3.jsp").forward(request, response);
        } else if (cv.getCvType() == 4) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("showCV4.jsp").forward(request, response);
        }

    }


    /// /// view List CV
    private void viewList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
//        if (email == null) {
//            // Nếu không có email trong session, điều hướng người dùng đến trang đăng nhập
//            response.sendRedirect("404.html");
//            return;
//        }
//        response.getWriter().print(email);
        CvDAO Cvdao = new CvDAO();
        AccountDAO accountDAO = new AccountDAO();
//        Account u = accountDAO.getAccountByEmail(email);

        Account account = (Account) session.getAttribute("sessionAccount");
        int accountId = account.getAccountId();
        List<CV> listCV = Cvdao.getCVByUserId(accountId);
        request.setAttribute("listcv", listCV);
        request.getRequestDispatcher("my_cv.jsp").forward(request, response);
    }

    ///  view type
    private void viewByType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CvDAO Cvdao = new CvDAO();
        List<CVType> cvTypes = Cvdao.getAllCVTypes();
        request.setAttribute("cvTypes", cvTypes);
        request.getRequestDispatcher("select_cv.jsp").forward(request, response);
    }

    private void viewMauCV(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        if (typeId == 1) {
            request.getRequestDispatcher("mau_cv1.jsp").forward(request, response);
        }
        if (typeId == 2) {
            request.getRequestDispatcher("mau_cv2.jsp").forward(request, response);
        }
        if (typeId == 3) {
            request.getRequestDispatcher("mau_cv3.jsp").forward(request, response);
        }
        if (typeId == 4) {
            request.getRequestDispatcher("mau_cv4.jsp").forward(request, response);
        }

    }


    private void loadEditing(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        AccountDAO userDao = new AccountDAO();
        int cvId = Integer.parseInt(request.getParameter("cvId"));
        CvDAO cvDao = new CvDAO();
        CV cv = new CV();
        try {
            cv = cvDao.getCvById(cvId);
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (cv.getCvType() == 1) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("edit_cv1.jsp").forward(request, response);
        } else if (cv.getCvType() == 2) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("edit_cv2.jsp").forward(request, response);
        } else if (cv.getCvType() == 3) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("edit_cv3.jsp").forward(request, response);
        }else if (cv.getCvType() == 4) {
            request.setAttribute("CV", cv);
            request.getRequestDispatcher("edit_cv4.jsp").forward(request, response);
        }


    }
}
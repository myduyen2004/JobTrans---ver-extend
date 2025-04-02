<%-- 
    Document   : create_cv
    Created on : 3 thg 3, 2025, 23:17:16
    Author     : mac
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="container">
        <%@include file="./includes/sidebar.jsp" %>
        <div class=" cv_box" style="background-image: url('img/anh_background_CV/anh2.jpeg');
                 background-size: cover;">
                        
            <div class="cv_header" >
                                <div class="cv_picture_avatar">
                                    <img  src="img/anh_background_CV/anh2.jpeg" alt="Avatar" ">
                                </div>
                                <div class="cv_information">
                                    <h2>Thông tin cá nhân</h2>
                                    <input type="text" id="date_of_birth" name="title" placeholder="Ngày sinh: " style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; margin-bottom: 5px;">
                                    <input type="text" id="sex" name="title" placeholder="Giới tính" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-bottom: 5px;">
                                    <input type="text" id="sdt" name="title" placeholder="Số điện thoại: " style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-bottom: 5px;">
                                    <input type="text" id="email" name="title" placeholder="email" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-bottom: 5px;">
                                </div>
                                    
                                
                <div class="cv_destination">                           
    <h2 >
        Mục tiêu nghề nghiệp
    </h2>
    
        <textarea cols="30" rows="5" placeholder="Nhập mô tả" name="summary" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; margin-bottom: 5px;"></textarea>
    

                            </div>
                      </div>  

  
            
    <div class="cv_body" 
                 >
    
        
               <div class="cv_controller">
        
        <div class="first_body">
        <h2 style="    margin-right: 50%;
    padding-right: 10px;">Học Vấn</h2>
        <button type="button" id="add-education" >Thêm</button>
        <button type="button" class="remove-education" type="button">xóa</button>
        </div>
    <div class="resume-section-content">
        <div class="resume-timeline position-relative education">
            <article class="resume-timeline-item position-relative pb-5">
                <div class="resume-timeline-item-header mb-2">
                    <select style="width: 104%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="schoolId[]">
                        <option value="">Chọn trường học</option>
                        <c:forEach items="" var="o">
                            <option value="">${o}</option>
                        </c:forEach>
                    </select>
                    <input type="text" name="otherSchoolName[]" placeholder="Tên trường khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-school-input">
                    <div  style="display: flex; width: 104% ">
                    <input type="date" name="educationStartDate[]" style="width:50%; display: inline-block; margin-right: 0px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <input type="date" name="educationEndDate[]" style="width: 50%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-left: 20px;">
                    </div>
                    <input type="text" name="degree[]" placeholder="Bằng cấp" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <input type="text" name="major[]" placeholder="Chuyên ngành" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    
                </div>
            </article>
        </div>
    </div>  </div>
         <div class="cv_controller">

    <div class="first_body">
    <h2 style="margin-right: 30%;padding-right: 10px;">
        Kinh nghiệm làm việc
    </h2>
     <button type="button" class="remove-experience" type="button">xóa</button>
     <button type="button" id="add-experience">Thêm</button>

    </div>    
    <div class="resume-section-content">
        <div class="resume-timeline position-relative work-experience">
            <article class="resume-timeline-item position-relative pb-5">
                <div class="resume-timeline-item-header mb-2">
                    <select style="width: 104%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="companyId[]">
                        <option value="">Chọn công ty</option>
                        <c:forEach items="" var="o">
                            <option value="">${o}</option>
                        </c:forEach>
                    </select>
                    <input type="text" name="otherCompanyName[]" placeholder="Tên công ty khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-company-input">
                    <input type="date" name="experienceStartDate[]" style="width: 49%; display: inline-block; margin-right: -4px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <input type="date" name="experienceEndDate[]" style="width: 49%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <input type="text" name="position[]" placeholder="Vị trí" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <textarea name="experienceDescription[]" placeholder="Mô tả chi tiết" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
                   
                </div>
            </article>
        </div>
    </div>
          </div>

           <div class="cv_controller">                          <!--Phần Chứng chỉ--> 
        <div class="first_body">                               
    <h2 style="margin-right: 46%;padding-right: 10px;">
        Chứng Chỉ
    </h2>
    <button type="button" id="add-certification">Thêm</button>
    <button class="remove-certification" type="button" >xóa</button>
        </div>
    <input type="text" name="test" style="display:none;">
    <div class="resume-section-content">
        <div class="resume-timeline position-relative certifications">
            <article class="resume-timeline-item position-relative pb-5">
                <div class="resume-timeline-item-header mb-2">
                    <select style="width: 104%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="certificationId[]">
                        <option value="">Chọn chứng chỉ</option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>
                    <input type="text" name="otherCertificationName[]" placeholder="Tên chứng chỉ khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-certification-input">
                    <input type="date" name="awardYear[]" placeholder="Năm được giải" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    
                </div>
            </article>
        </div>
    </div>
    </div>



              <div class="cv_controller">                 

                               
      <div class="first_body">                              
    <h2 style="margin-right: 49%;padding-right: 10px;">
Kỹ Năng</h2>
     <button type="button" id="add-skill">Thêm</button>
     <button class="remove-skill" type="button" >xóa</button>
     </div>
    <div class="resume-section-content">
        <div class="resume-timeline position-relative skills">
            <article class="resume-timeline-item position-relative pb-5">
                <div class="resume-timeline-item-header mb-2">
                    <select style="width: 104%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="skillId[]">
                        <option value="">Chọn kỹ năng</option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>
                    <input type="text" name="otherSkillName[]" placeholder="Tên kỹ năng khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-skill-input">
                   
                </div>
            </article>
        </div>
         
    </div>



                                    
   


                                </div>
                          </div>  
                       
                    </div>
                </article>
            </form>
        </div>

            </div>
        </div>
        
    </body>
</html>

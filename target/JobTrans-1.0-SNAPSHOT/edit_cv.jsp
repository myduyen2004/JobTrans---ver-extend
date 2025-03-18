
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="profile" href="https://gmpg.org/xfn/11">
        <meta name='robots' content='max-image-preview:large'/>
        <link rel="icon" type="image/png" href="wp-content/uploads/2021/09/logo.png">
    </head>
    
    
    
    
    <body>
        



        <div class="header_cv">
               <button type="button"> Lưu và tải CV</button>
            </div>
        <div class="container_cv">
        <%@include file="./includes/sidebar_cv.jsp" %>
        <div class="cv_box"
                 style="background-size: cover">
                        
            <div class="cv_header" >
                                <div class="cv_picture_avatar">
                                    <img  src="img/anhcv/avatar.jpeg" alt="Avatar">
                                </div>
                <h2 style="color: white;
    margin-left: 11%; margin-top: 30px;">
        Liên hệ
    </h2>
                                <div class="cv_information">
                                  
                                    
                                    <input type="text" id="sex" name="title" placeholder="Giới tính" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-bottom: 5px;">
                                    <input type="text" id="date_of_birth" name="title" placeholder="Ngày sinh: " style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; margin-bottom: 5px;">
                                    <input type="text" id="sdt" name="title" placeholder="Số điện thoại: " style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-bottom: 5px;">
                                    <input type="text" id="email" name="title" placeholder="email" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-bottom: 5px;">
                                    <input type="text" id="address" name="title" placeholder="Địa chỉ: " style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; margin-bottom: 5px;">
                                </div>
    
                                
     
                                                 

                               
      
    <div class="skill">  
        <div class="first_body">  
    <h2 style="margin-top: 30px;margin-left: 11%; margin-right: 20%; color:white" id="toggle-skill">
             Kỹ Năng</h2>
          <button type="button" id="add-skill">Thêm</button>
     <button class="remove-skill" type="button" >xóa</button>
     </div>
     <select style=" margin-top: 5px;margin-left: 36px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="skillId[]">
                        <option value=""> Chọn tiêu đề kỹ năng </option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>            
    <select style="margin-top: 5px; margin-left: 36px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="skillId[]">
                        <option value="">Chọn kỹ năng</option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>
    <input type="text" name="otherSkillName[]" placeholder="Tên kỹ năng khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-skill-input">
    <select style=" margin-top: 5px;margin-left: 36px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="skillId[]">
                        <option value="">Chọn level</option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>
    </div>
        <div class="more_infor">
            <div>
               
                   <h2 id="toggle-infor">Thông tin bổ sung</h2>
                  
                   <textarea name="experienceDescription[]" placeholder="Mô tả chi tiết" style=" margin-left: 33px;margin-right: 50px;height: 100px; width: 82%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
            
            
            </div>  

            
            
            </div>
            
          </div>  
   
    <div class="cv_body">
        <div class="main-infor" style="margin-top: 20%">
        <input type="text" name="name[]" placeholder="name" style="margin-bottom: 20px; margin-left: 15%; height: 30px;width: 50%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
        <input type="text" name="position[]" placeholder="Vị trí" style=" margin-left: 15%;width: 50%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
            </div>
           
        <div class="career-goal">
        <h2>Mục tiêu nghề nghiệp</h2>
        <hr>
        <textarea name="experienceDescription[]" placeholder="Mô tả chi tiết" style="height: 200px;margin-right: 30px; width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
            
                   </div>
       
        
        <div class="education">
            <div  style="display: flex;justify-content: space-between; /* Đưa 2 phần về 2 đầu */
    align-items: center;">
                 <h2>Học vấn</h2>
                <div>
                    <button type="button" id="add-education" >Thêm</button>
        <button type="button" class="remove-education" type="button">xóa</button>
                </div>
       
            </div>
        
        <hr>
        <div>
        <select style="height:40px; width: 60%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="schoolId[]">
                        <option value="">Chọn trường học</option>
                        <c:forEach items="" var="o">
                            <option value="">${o}</option>
                        </c:forEach>
                    </select>

        <input type="text" name="otherSchoolName[]" placeholder="Tên trường khác" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-school-input">
                    <div  style="display: flex; width: 104%; margin-top: 5px;margin-bottom: 20px;">
                    <input type="date" name="educationStartDate[]" style="height: 30px;width:18%; display: inline-block; margin-right: 0px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <input type="date" name="educationEndDate[]" style="height: 30px;width: 18%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-left: 20px;">
                    </div>
        <div style="margin-top: 10px;
            margin-left: 100px;">
        <input type="text" name="major[]" placeholder="Chuyên ngành" style="margin-bottom: 5px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
        <input type="text" name="degree[]" placeholder="Bằng cấp" style="margin-bottom: 5px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">          
        <textarea name="school_Description[]" placeholder="thông tin thêm" style=" width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
            
        </div>          
            
        </div>
    </div>
        
        
        
        <div class="company">
               <div  style=" display: flex;justify-content: space-between; /* Đưa 2 phần về 2 đầu */
    align-items: center;"> 
        <h2>Kinh nghiệm làm việc</h2>
                     <div>
                         <button type="button" id="add-experience">Thêm</button>
                         <button type="button" class="remove-experience" type="button">xóa</button>
                         
                     </div>    
               </div>
        <hr>
         <select style="height:40px; width: 60%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="schoolCompany[]">
                        <option value="">Chọn công ty</option>
                        <c:forEach items="" var="o">
                            <option value="">${o}</option>
                        </c:forEach>
                    </select>

        <input type="text" name="otherCompanyName[]" placeholder="Tên công ty khác" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-company-input">
                    <div  style="display: flex; width: 104%; margin-top: 5px;margin-bottom: 20px;">
                    <input type="date" name="companyStartDate[]" style="height: 30px;width:18%; display: inline-block; margin-right: 0px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <input type="date" name="companyEndDate[]" style="height: 30px;width: 18%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-left: 20px;">
                    </div>
        <div style="margin-top: 10px;
            margin-left: 100px;">
        <input type="text" name="position[]" placeholder="Vị trí" style="margin-bottom: 5px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
        <input type="text" name="work_infor[]" placeholder="thông tin công việc" style="margin-bottom: 5px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">          
        <textarea name="work_Description[]" placeholder="Nội dung cuộc thi" style=" width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
            
        </div>          
            
        </div>
    
        
        
       <div class="chung_chi">
           <div  style="display: flex;justify-content: space-between; /* Đưa 2 phần về 2 đầu */
    align-items: center;">  
        <h2>Chứng chỉ & giải thưởng</h2>
             <div>
         <button type="button" id="add-certification">Thêm</button>
         <button class="remove-certification" type="button" >xóa</button>
             </div>
            </div>
        <hr>
        <div>
            <input type="text" name="prize[]" placeholder="giải thưởng & thành tựu" style="height:30px; width: 60%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="schoolCompany[]">

                    </input>
            <div  style="display: flex; width: 104%; margin-top: 5px;margin-bottom: 20px;">
                    <input type="date" name="prizetartDate[]" style="height: 30px;width:18%; display: inline-block; margin-right: 0px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    </div>   
            <div style="margin-top: 10px;
            margin-left: 100px;">
                <textarea name="prizeDescription[]" placeholder="Mô tả giải thưởng" style=" margin-bottom: 50px; width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
             
            
           </div>                  
        </div>
    </div> 
    </div>
                      
                          </div>  
         <div class="how_write">               
        <div id="guide-skill" style="display: none; padding: 15px; background: #f8f9fa; border-radius: 5px; margin-top: 10px;">
        <h3 style="color: #007bff;">VIẾT GÌ?</h3>
        <p><strong>📌 Kỹ năng</strong></p>
        <ul>
            <li>🔹 Nên liên quan và phù hợp với vị trí ứng tuyển.</li>
            <li>🔹 Mô tả chính xác và lượng hóa bằng văn bản.</li>
        </ul>
        </div>   
            
        </div>
                            
        
            
        </div></div>
</div>
          
         
    </body>
   <script> 
       document.getElementById("toggle-skill").addEventListener("click", function() {
    var guideSkill = document.getElementById("guide-skill");
    
    // Kiểm tra trạng thái hiển thị và thay đổi
    if (guideSkill.style.display === "none" || guideSkill.style.display === "") {
        guideSkill.style.display = "block"; // Hiển thị hướng dẫn
    } else {
      
        guideSkill.style.display = "none"; // Ẩn hướng dẫn
    }
});   

   
       
       
       
       
       
       
       
       
       
       
    document.addEventListener("DOMContentLoaded", function () {
    const addButton = document.getElementById("add-education");
    const educationContainer = document.querySelector(".education");

    addButton.addEventListener("click", function () {
        const newEducation = document.createElement("div");
        newEducation.classList.add("education-item");
        newEducation.innerHTML = `
            <hr>
                <div>
            <select style="height:40px; width: 60%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="schoolId[]">
                <option value="">Chọn trường học</option>
            </select>
                <button style="margin-left:32%" type="button" class="remove-education">Xóa</button>
                
                
                </div>
            <input type="text" name="otherSchoolName[]" placeholder="Tên trường khác" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-school-input">
            <div style="display: flex; width: 104%; margin-top: 5px;margin-bottom: 20px;">
                <input type="date" name="educationStartDate[]" style="height: 10px;width:18%; display: inline-block; margin-right: 0px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                <input type="date" name="educationEndDate[]" style="height: 10px;width: 18%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-left: 20px;">
            </div>
               
            <div style="margin-top: 10px; margin-left: 100px;">
                <input type="text" name="major[]" placeholder="Chuyên ngành" style="margin-bottom: 5px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                <input type="text" name="degree[]" placeholder="Bằng cấp" style="margin-bottom: 5px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                <textarea name="school_Description[]" placeholder="Thông tin thêm" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
            </div>
            
        `;
        
        educationContainer.appendChild(newEducation);
    });

    educationContainer.addEventListener("click", function (event) {
    if (event.target.classList.contains("remove-education")) {
        event.target.closest(".education-item").remove();
    }
});
});





 document.addEventListener("DOMContentLoaded", function () {
    const addButton = document.getElementById("add-experience");
    const educationContainer = document.querySelector(".company");

    addButton.addEventListener("click", function () {
        const newEducation = document.createElement("div");
        newEducation.classList.add("experience-item");
        newEducation.innerHTML = `
            <hr>
            
            <div>
            <select style="height:40px; width: 60%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="schoolCompany[]">
                        <option value="">Chọn công ty</option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>
                <button style="margin-left:32%" type="button" class="remove-experience">Xóa</button>
                
                
                </div>  
             
            </select>
            <input type="text" name="otherCompanyName[]" placeholder="Tên công ty khác" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-company-input">
            <div style="display: flex; width: 104%; margin-top: 5px; margin-bottom: 20px;">
                <input type="date" name="companyStartDate[]" style="height: 10px; width: 18%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                <input type="date" name="companyEndDate[]" style="height: 10px; width: 18%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; margin-left: 20px;">
            </div>
            <div style="margin-top: 10px; margin-left: 100px;">
                <input type="text" name="position[]" placeholder="Vị trí" style="margin-bottom: 5px; width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                <input type="text" name="work_infor[]" placeholder="Thông tin công việc" style="margin-bottom: 5px; width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                <textarea name="work_Description[]" placeholder="Mô tả công việc" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
            </div>
            
        `;
        
        educationContainer.appendChild(newEducation);
    });

    experienceContainer.addEventListener("click", function (event) {
        if (event.target.classList.contains("remove-experience")) {
            event.target.closest("experience-item").remove();
        }
    });
    
});





     document.addEventListener("DOMContentLoaded", function () {
    const addCertificationButton = document.getElementById("add-certification");
    const certificationContainer = document.querySelector(".chung_chi");

    addCertificationButton.addEventListener("click", function () {
        const newCertification = document.createElement("div");
        newCertification.classList.add("certification-item");
        newCertification.innerHTML = `
        <hr> 
            <div>
            <input type="text" name="prize[]" placeholder="Giải thưởng & Thành tựu" style="height:30px; width: 60%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
            <button style="margin-left:29.5%" type="button" class="remove-certification">Xóa</button>
            </div>
            <div style="display: flex; width: 104%; margin-top: 5px;margin-bottom: 20px;">
                <input type="date" name="prizeStartDate[]" style="height: 10px;width:18%; display: inline-block; margin-right: 0px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
            </div>
            <div style="margin-top: 10px; margin-left: 100px;">
                <textarea name="prizeDescription[]" placeholder="Mô tả giải thưởng" style="margin-bottom: 50px; width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
            </div>
            
        `;

        certificationContainer.appendChild(newCertification);
    });

    certificationContainer.addEventListener("click", function (event) {
        if (event.target.classList.contains("remove-certification")) {
            event.target.closest(".certification-item").remove();
        }
    });
});

    document.addEventListener("DOMContentLoaded", function () {
    const addCertificationButton = document.getElementById("add-skill");
    const certificationContainer = document.querySelector(".skill");

    addCertificationButton.addEventListener("click", function () {
        const newCertification = document.createElement("div");
        newCertification.classList.add("skill-item");
        newCertification.innerHTML = `
        <div style="display:flex">
        <h2 style="margin-left: 11%; margin-right: 20%; color:white">
             Kỹ Năng</h2>
          
          <button style="border: solid 1px #0000004d;
    background-color: while;
    border-radius: 20px;
    margin-left: 44px;
    
    margin-top: 24px;
    height:21px;
    margin-bottom: 14px;
    width: 54px;
    color: black;" class="remove-skill" type="button" >xóa</button>
     </div>
        
     <select style=" margin-left: 36px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="skillId[]">
                        <option value=""> Chọn tiêu đề kỹ năng </option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>            
    <select style=" margin-left: 36px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="skillId[]">
                        <option value="">Chọn kỹ năng</option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>
    <input type="text" name="otherSkillName[]" placeholder="Tên kỹ năng khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-skill-input">
    <select style=" margin-left: 36px;width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="skillId[]">
                        <option value="">Chọn level</option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>
        `;

        certificationContainer.appendChild(newCertification);
    });

    certificationContainer.addEventListener("click", function (event) {
        if (event.target.classList.contains("remove-skill")) {
            event.target.closest(".skill-item").remove();
        }
    });
});

   
    </script>
</html>
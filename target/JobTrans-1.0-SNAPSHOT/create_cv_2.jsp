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

            <style>

           .cv_picture_avatar_2 {
    margin-left:13.4%;           
    margin-top: 8%;           
    width: 15%;
    height: 225px;
    background-color: #d3d3d3;
    border-radius: 50%;
    border: 20px solid #4A4E68;
    position: absolute; /* Giúp ảnh nằm đè lên phần thông tin */
    
    transform: translateX(-50%); /* Căn giữa theo trục X */
    z-index: 10; /* Đảm bảo ảnh nằm trên */
}
              .container{
        display: flex;

    }         .cv_header{

        width: 45%;
        margin-left: 20px;
       
    }

         .cv_box{
        background-image: url('img/anh_background_CV/anh.webp');
        background-size: cover;
        display: flex;
        gap:25px;
        border: solid #4A4E68 1px;
        margin-top: 30px;
        margin-left: 50px;
        width: 90%;
        background-color:#E6E7EA; 
        border: solid black 1px;
        border-radius: 20px;

    }
    .cv_information{
        padding-top: 45%;
        border: solid black 1px;
        border-radius: 40px;
        margin-top: 60%;
        position: relative;
        border: solid #4A4E68 1px;;
        background-color:#4A4E68; 
        margin-left: 20px;
        padding-bottom: 20px;
    }
    .cv_information h2{
        color: white;
        margin-left: 11%;
    }
    .cv_information input{
        margin-left: 8%;
    }
    
    
    
    .cv_body{
    
  
    
    margin-top: 17%;
    
}
.first_body h1{
    
    
    border: solid 1px #0000004d;
    background-color:#4A4E68;
    color: white;
    border-radius: 20px;
    padding-left: 10px;
    margin-left: 20px;
    
}
.first_body button {
    
    border: solid 1px #0000004d;
    background-color: #4A4E68;
    border-radius: 20px;
    margin-left: 20px;
    padding-top: 0px;
    margin-top: 19px;
    
    margin-bottom: 19px;
    width: 50px;
    color: white;
}
.first_body{
    position: relative;
    display: flex;
}
.resume-section-content{
    width: 65%;
    margin-left: 30px;
}
.resume-section-content input{
    margin-bottom: 5px;
}
.resume-section-content select{
    margin-bottom: 5px;
}
.cv_controller{
    position:relative;
    margin-right: 10px;
    margin-top: 10px;
    margin-left: 10px;
    border: 1px #d3d3d3 solid;
    padding-bottom: 10px;
    border-radius: 20px;
    margin-bottom: 20px;
    }   
            </style>
        </head>
        <body>
            <div class="container" >
                     <div>    
            <%@include file="../includes/sidebar.jsp" %>
                     </div>
            </div>
            <div class="cv_box" >

                <div class="cv_header" >
                    <div >
                        <img class="cv_picture_avatar_2"  src="img/anh_background_CV/anh2.jpeg" alt="Avatar" ">
                        </div>
                        <div class="cv_information">
                            <input type="text" id="title" name="title" placeholder="Họ và tên : " style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; margin-bottom: 5px;"><!-- comment -->       
                            <input type="text" id="title" name="title" placeholder="Vị trí ứng tuyển : " style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; margin-bottom: 5px;">           
                            <h2>Thông tin cá nhân</h2>
                                        <input type="text" id="title" name="title" placeholder="Ngày sinh: " style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; margin-bottom: 5px;">
                                        <input type="text" id="title" name="title" placeholder="Giới tính" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-bottom: 5px;">
                                        <input type="text" id="title" name="title" placeholder="Số điện thoại: " style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-bottom: 5px;">
                                        <input type="text" id="title" name="title" placeholder="email" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;margin-bottom: 5px;">


                           <div class="cv_destination">                           
        <h2 >
            Mục tiêu nghề nghiệp
        </h2>

            <textarea  cols="30" rows="5" placeholder="Nhập mô tả" name="summary" style="width: 80%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; margin-bottom: 5px;  margin-left: 8%; "></textarea>


                                </div>
                                        
                                        
                           </div>             


                </div>   

        <div>    

                       
    
    <div class="cv_body">
    
        
               <div class="cv_controller">
        
        <div class="first_body">
        <h1 style="    margin-right: 50%;
    padding-right: 10px;">Học Vấn</h1>
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
    <h1 style="margin-right: 20%;padding-right: 10px;">
        Kinh nghiệm làm việc
    </h1>
        
     <button type="button" id="add-experience">Thêm</button>
     <button type="button" class="remove-experience" type="button">xóa</button>
        
     

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
                   
                    <input type="date" name="experienceStartDate[]" style="width: 48%; display: inline-block; margin-right: 20px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <input type="date" name="experienceEndDate[]" style="width: 47%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                   
                    <input type="text" name="position[]" placeholder="Vị trí" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <textarea name="experienceDescription[]" placeholder="Mô tả chi tiết" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;"></textarea>
                   
                </div>
            </article>
        </div>
    </div>
          </div>

           <div class="cv_controller">                          <!--Phần Chứng chỉ--> 
        <div class="first_body">                               
    <h1 style="margin-right: 40%;padding-right: 30px;">
        Chứng Chỉ
    </h1>
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



                        <div class="cv_controller" style="margin-bottom:20px">                 

                               
      <div class="first_body">                              
    <h1 style="margin-right: 49%;padding-right: 8px;">
Kỹ Năng</h1>
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
                <select style="width: 104%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="ky_nang[]">
                        <option value="">Chọn level</option>
                        <c:forEach items="" var="o">
                            <option value=""></option>
                        </c:forEach>
                    </select>
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

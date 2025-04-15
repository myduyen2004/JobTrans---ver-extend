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
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        
        <div class="container">
        <%@include file="../includes/sidebar.jsp" %>
        <div class=" cv_box";
                 background-size: cover;">
                        
            <div class="cv_header" >
                                <div class="cv_picture_avatar">
                                    <img  src="img/anhcv/avatar.jpeg" alt="Avatar" >
                                </div>
                <h2 style="color: white;
    margin-left: 11%;">
        Liên hệ
    </h2>
                                <div class="cv_information">
                                    
                                </div>
        <div class="info-card">
        <div class="info-item">
            <i class="fas fa-venus"></i>
            <span class="info-text">Nữ</span>
        </div>
        <div class="info-item">
            <i class="fas fa-calendar"></i>
            <span class="info-text">10/10/1992</span>
        </div>
        <div class="info-item">
            <i class="fas fa-envelope"></i>
            <span class="info-text">quynhmy@gmail.com</span>
        </div>
        <div class="info-item">
            <i class="fas fa-phone"></i>
            <span class="info-text">0912334455</span>
        </div>
        <div class="info-item">
            <i class="fas fa-map-marker-alt"></i>
            <span class="info-text">23 Trần Cao Vân, Quận 1</span>
        </div>
        </div>
                                     
                                
     
                      
            
            
            
            
            
           <div class="skills-container">
        <h2>Ngoại ngữ</h2>
        <div class="skill">
            <div class="skill-name">Tiếng Anh</div>
            <div class="progress-bar">
                <div class="progress" style="width: 80%;"></div>
            </div>
        </div>
        <div class="skill">
            <div class="skill-name">Tiếng Trung</div>
            <div class="progress-bar">
                <div class="progress" style="width: 50%;"></div>
            </div>
        </div>
        <div class="skill">
            <div class="skill-name">Tiếng Hàn</div>
            <div class="progress-bar">
                <div class="progress" style="width: 40%;"></div>
            </div>
        </div>

        <h2>Tin học</h2>
        <div class="skill">
            <div class="skill-name">Word</div>
            <div class="progress-bar">
                <div class="progress" style="width: 75%;"></div>
            </div>
        </div>
        <div class="skill">
            <div class="skill-name">Excel</div>
            <div class="progress-bar">
                <div class="progress" style="width: 60%;"></div>
            </div>
        </div>
    </div>
                
        <div class="more_infor">
            <div>
               
                   <h2>Thông tin bổ sung</h2>
                  
                   <p class="infor">tôi là một người sáng suôt, đẹp trai, học giỏi</p>
            
            
            </div>  

            
            
            </div>
            
          </div>  
            
            
            
            
            
            
            
            
            
    <div class="cv_body">
            <div class="main-infor">
        <h1>Nguyễn Văn Công</h1>
        <p class="title">Kỹ thuật phần mềm</p>
            </div>
           
        <div class="career-goal">
        <h2>Mục tiêu nghề nghiệp</h2>
        <hr>
        <p>Áp dụng những kinh nghiệm về kỹ năng bán hàng và sự hiểu biết về thị trường để trở thành một nhân viên bán hàng chuyên nghiệp, mang đến nhiều giá trị cho khách hàng. Từ đó giúp Công ty tăng số lượng khách hàng và mở rộng tập khách hàng.</p>
                   </div>
       
        
        <div class="education">
        <h2>Học vấn</h2>
        <hr>
        <div>
        <div class="school">ĐH Kinh Tế TPHCM</div>
        <div class="date">05/2019 - 05/2022</div>
        </div>
        <div class="timeline">
            
            <div>
                <div class="content">Chuyên ngành Quản trị kinh doanh</div>
                <ul>
                    <li>Loại tốt nghiệp: Giỏi</li>
                    <li>Bằng cấp: Cử nhân Đại Học. Điểm tổng kết: 8.1/10. Sinh viên ưu tú khoa quản trị kinh doanh 2013</li>
                </ul>
            </div>
        </div>
    </div>
        
        
        
        <div class="company">
        <h2>Kinh nghiệm làm việc</h2>
        <hr>
        <div>
        <div class="name_conpany">VRC Group TP HCM</div>
        <div class="date">05/2019 - 05/2022</div>
        </div>
        <div class="timeline">
            
            <div>
                <div class="content">Trưởng nhóm quản trị kinh doanh</div>
                <ul>
                    <li>thông tin chi tiết về công việc mà bạn đã chọn</li>
                     Thành tích đạt được <li>Nhân viên xuất sắc của năm 2020</li>
                </ul>
            </div>
        </div>
    </div>
        
        
       <div class="chung_chi">
        <h2>Chứng chỉ & giải thưởng</h2>
        <hr>
        <div>
        <div class="name_cc">Giải nhất cuộc thi vở sạch chữ đẹp cấp trường</div>
        <div class="date">05/2019 - 05/2022</div>
        </div>
        <div class="timeline">
            
            <div>
                
                <ul>
                    <li>cuộc thi nghệ thuật hàng đầu việt nam </li>
                     
                </ul>
            </div>
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

USE JobTransnew;
GO
-- Người dùng cá nhân, đang hoạt động

INSERT INTO Account (
    account_name, email, password, gender, phone, address, education, speciality,
    experience_years, skills, bio, verified_account, complete_percent, label_tag,
    role, type_account, level_account, signature, count_member, status
) VALUES (
    N'Nguyễn Văn A', 'a@example.com', '123456', N'Nam', '0912345678', N'Hà Nội',
    N'Đại học CNTT', N'Lập trình Web', 2, N'HTML,CSS,JS', N'Tôi là dev frontend.',
    1, 0.85, N'HTML,Front-end', N'Người dùng', N'Cá nhân', N'Tài khoản thường',
    N'Chữ ký A', 0, N'Đang hoạt động'
);

-- Người dùng nhóm, tài khoản VIP
INSERT INTO Account (
    account_name, email, password, gender, phone, address, education, speciality,
    experience_years, skills, bio, verified_account, complete_percent, label_tag,
    role, type_account, level_account, signature, count_member, status
) VALUES (
    N'Nhóm Dev B', 'groupb@example.com', 'grouppass', N'Nữ', '0987654321', N'HCM',
    N'Không rõ', N'Fullstack', 5, N'Java,SQL,Spring Boot', N'Thành viên nhóm chuyên backend.',
    1, 0.92, N'Fullstack,Java', N'Người dùng', N'Nhóm', N'Tài khoản VIP',
    N'Chữ ký nhóm', 5, N'Đang hoạt động'
);

-- Admin hệ thống
INSERT INTO Account (
    account_name, email, password, gender, role, type_account, level_account, status
) VALUES (
    N'Quản trị viên', 'admin@example.com', 'admin123', N'Nam',
    N'Admin', N'Cá nhân', N'Tài khoản VIP', N'Đang hoạt động'
);

-- Người dùng bị cấm
INSERT INTO Account (
    account_name, email, password, gender, phone, status
) VALUES (
    N'Lê Thị C', 'c@example.com', 'lethic456', N'Nữ', '0978123456', N'Bị cấm'
);

-- Người dùng chờ xử lý
INSERT INTO Account (
    account_name, email, password, gender, phone, status
) VALUES (
    N'Trần Văn D', 'd@example.com', 'trand789', N'Nam', '0909123456', N'Chờ xử lí'
);

-- Thành viên nhóm 1
INSERT INTO Group_Member (
    member_name, account_id, gender, date_of_birth, phone, address,
    position, speciality, experience_years, skills, bio, education
) VALUES (
    N'Phạm Minh Hoàng', 2, N'Nam', '1998-03-10', '0911000001', N'Đà Nẵng',
    N'Lập trình viên Backend', N'Java', 3, N'Java,Spring Boot,SQL',
    N'Tôi chuyên xử lý logic hệ thống backend.', N'Đại học Bách Khoa'
);

-- Thành viên nhóm 2
INSERT INTO Group_Member (
    member_name, account_id, gender, date_of_birth, phone, address,
    position, speciality, experience_years, skills, bio, education
) VALUES (
    N'Lê Ngọc Hân', 2, N'Nữ', '1999-07-25', '0911000002', N'Hà Nội',
    N'UX/UI Designer', N'Thiết kế giao diện', 2, N'Figma,Photoshop,UX/UI',
    N'Tôi yêu thiết kế và trải nghiệm người dùng.', N'Đại học Mỹ thuật Công nghiệp'
);

-- Thành viên nhóm 3
INSERT INTO Group_Member (
    member_name, account_id, gender, date_of_birth, phone, address,
    position, speciality, experience_years, skills, bio, education
) VALUES (
    N'Trịnh Văn Dũng', 2, N'Nam', '1995-12-01', '0911000003', N'TP.HCM',
    N'Tester', N'Kiểm thử phần mềm', 4, N'Test case, Selenium, JIRA',
    N'Tôi kiểm thử và đảm bảo chất lượng phần mềm.', N'Đại học CNTT'
);

INSERT INTO Criteria (content, criteria_point, type_criteria, label_tag) VALUES
(N'Người dùng xác thực tài khoản bằng liên kết của bên thứ 3 như LinkedIn', 50, N'Cộng điểm', N'Xác thực tài khoản'),
(N'Hoàn thành 2 công việc đầu tiên', 30, N'Cộng điểm', N'Hoàn thành công việc'),
(N'Seeker hoàn thành đúng hạn', 10, N'Cộng điểm', N'Hoàn thành đúng hạn'),
(N'Nhận đánh giá 5 sao từ khách hàng', 15, N'Cộng điểm', N'Đánh giá 5 sao'),
(N'Xây dựng hồ sơ đầy đủ, chi tiết', 5, N'Cộng điểm', N'Hồ sơ đầy đủ'),
(N'Seeker hoàn thành dự án trước deadline', 15, N'Cộng điểm', N'Hoàn thành sớm'),
(N'Được khách hàng thuê lại nhiều lần', 10, N'Cộng điểm', N'Khách hàng thuê lại'),
(N'Employer trả tiền đúng hạn', 10, N'Cộng điểm', N'Trả tiền đúng hạn'),
(N'Giới thiệu bạn bè (từ người thứ nhất)', 15, N'Cộng điểm', N'Giới thiệu bạn bè 1'),
(N'Giới thiệu bạn bè (từ người thứ 2 trở đi)', 5, N'Cộng điểm', N'Giới thiệu bạn bè 2'),
(N'Tạo tài khoản', 10, N'Cộng điểm', N'Tạo tài khoản'),
(N'Dùng từ thô thiển, vi phạm chuẩn mực', -20, N'Trừ điểm', N'Ngôn từ không phù hợp'),
(N'Spam liên tục', -30, N'Trừ điểm', N'Hành vi spam'),
(N'Giả mạo', -1000, N'Block', N'Tài khoản giả mạo'),
(N'Bán lại hoặc tiết lộ thông tin khách hàng trái phép', -1000, N'Block', N'Vi phạm bảo mật'),
(N'Bị khiếu nại: Thái độ làm việc', -20, N'Trừ điểm', N'Thái độ không chuyên nghiệp'),
(N'Bị khiếu nại: Quá hạn làm việc', -30, N'Trừ điểm', N'Trễ deadline'),
(N'Bị khiếu nại: Đạo văn', -30, N'Trừ điểm', N'Đạo văn'),
(N'Bị khiếu nại: Tiết lộ thông tin', -30, N'Trừ điểm', N'Vi phạm bảo mật'),
(N'Bị khiếu nại: Sản phẩm kém chất lượng', -30, N'Trừ điểm', N'Chất lượng kém'),
(N'Phản hồi trả tiền chậm khi đến hạn: Nhắc lần đầu', -5, N'Trừ điểm', N'Chậm thanh toán'),
(N'Phản hồi trả tiền chậm khi đến hạn: Nhắc lần 2 (dán nhãn)', -30, N'Nhãn cảnh báo', N'Chậm thanh toán'),
(N'Điểm âm lần 1 - Cảnh cáo', 0, N'Nhãn cảnh báo', N'Cảnh cáo lần 1'),
(N'Điểm âm lần 2 - Hạn chế apply công việc > 10 triệu trong 1 tháng', 0, N'Nhãn cảnh báo', N'Hạn chế cấp 1'),
(N'Điểm âm lần 3 - Hạn chế apply công việc > 5 triệu trong 3 tháng', 0, N'Nhãn cảnh báo', N'Hạn chế cấp 2'),
(N'Điểm âm lần 4 - Hạn chế apply công việc > 2 triệu trong 5 tháng', 0, N'Nhãn cảnh báo', N'Hạn chế cấp 3'),
(N'Điểm âm lần 5 - Block tài khoản', -1000, N'Block', N'Điểm âm nghiêm trọng');
--**Thiếu phần HistoryPoint

INSERT INTO CV_Type (type_name, description, price_cv, image_cv)
VALUES 
('Basic CV', N'CV cơ bản với thông tin cá nhân và kinh nghiệm làm việc.', 0, 'img/cv/basic_cv_image.jpg'),
('Professional CV', N'CV chuyên nghiệp với các kỹ năng, chứng chỉ, và dự án đã thực hiện.', 0 , 'img/cv/professional_cv.jpg')

INSERT INTO School (school_name) VALUES
(N'Đại học Bách Khoa Hà Nội'),
(N'Đại học Công nghệ - ĐHQGHN'),
(N'Đại học FPT'),
(N'Học viện Công nghệ Bưu chính Viễn thông'),
(N'Đại học Khoa học Tự nhiên - ĐHQG TP.HCM'),
(N'Đại học Cần Thơ'),
(N'Đại học Ngoại thương'),
(N'Học viện Kỹ thuật Mật mã'),
(N'Đại học Quốc tế - ĐHQG TP.HCM'),
(N'Khác');
INSERT INTO Certification (certification_name) VALUES
(N'Chứng chỉ TOEIC 800+'),
(N'Chứng chỉ IELTS 7.0'),
(N'Chứng chỉ Lập trình Java cơ bản'),
(N'Chứng chỉ Quản lý dự án PMP'),
(N'Chứng chỉ Google Data Analytics'),
(N'Chứng chỉ Microsoft Azure Fundamentals'),
(N'Chứng chỉ AWS Certified Cloud Practitioner'),
(N'Chứng chỉ UI/UX Design'),
(N'Chứng chỉ Scrum Master'),
(N'Khác');
INSERT INTO Company (company_name, description) VALUES
(N'Công ty TNHH ABC', N'Công ty chuyên về phát triển phần mềm web và mobile.'),
(N'Công ty CP XYZ', N'Tập trung vào giải pháp trí tuệ nhân tạo và dữ liệu lớn.'),
(N'VN Software', N'Cung cấp dịch vụ gia công phần mềm cho khách hàng quốc tế.'),
(N'TechGen', N'Công ty startup trong lĩnh vực fintech.'),
(N'TMA Solutions', N'Công ty công nghệ lớn tại Việt Nam với hơn 20 năm phát triển.'),
(N'CMC Corporation', N'Cung cấp giải pháp hạ tầng và dịch vụ IT cho doanh nghiệp.'),
(N'VNG Corporation', N'Chuyên phát triển các sản phẩm game, nền tảng điện toán đám mây.'),
(N'Shopee Việt Nam', N'Công ty thương mại điện tử hàng đầu Đông Nam Á.'),
(N'Haravan', N'Nền tảng hỗ trợ bán hàng đa kênh tại Việt Nam.'),
(N'Khác', N'Công ty không nằm trong danh sách trên.');
INSERT INTO Main_Skill (main_skill) VALUES
(N'Lập trình'),            -- ID = 1
(N'Ngôn ngữ'),             -- ID = 2
(N'Thiết kế'),             -- ID = 3
(N'Quản lý'),              -- ID = 4
(N'Phân tích dữ liệu'),    -- ID = 5
(N'Điện toán đám mây'),    -- ID = 6
(N'Trí tuệ nhân tạo'),     -- ID = 7
(N'Kiểm thử phần mềm'),    -- ID = 8
(N'Bảo mật thông tin'),    -- ID = 9
(N'Khác');                 -- ID = 10
-- 1. Lập trình
INSERT INTO Skill (mainSkill_id, skill) VALUES
(1, N'Java'), (1, N'Python'), (1, N'HTML'), (1, N'CSS');
-- 2. Ngôn ngữ
INSERT INTO Skill (mainSkill_id, skill) VALUES
(2, N'Tiếng Anh'), (2, N'Tiếng Hàn');
-- 3. Thiết kế
INSERT INTO Skill (mainSkill_id, skill) VALUES
(3, N'Photoshop'), (3, N'Figma');
-- 4. Quản lý
INSERT INTO Skill (mainSkill_id, skill) VALUES
(4, N'Scrum'), (4, N'Quản lý dự án Agile');
-- 5. Phân tích dữ liệu
INSERT INTO Skill (mainSkill_id, skill) VALUES
(5, N'Excel nâng cao'), (5, N'Power BI'), (5, N'Google Data Studio'), (5, N'R');
-- 6. Điện toán đám mây
INSERT INTO Skill (mainSkill_id, skill) VALUES
(6, N'AWS'), (6, N'Azure'), (6, N'Google Cloud Platform');
-- 7. Trí tuệ nhân tạo
INSERT INTO Skill (mainSkill_id, skill) VALUES
(7, N'Machine Learning'), (7, N'Deep Learning'), (7, N'TensorFlow'), (7, N'PyTorch');
-- 8. Kiểm thử phần mềm
INSERT INTO Skill (mainSkill_id, skill) VALUES
(8, N'Selenium'), (8, N'Postman'), (8, N'JUnit'), (8, N'Cypress');
-- 9. Bảo mật thông tin
INSERT INTO Skill (mainSkill_id, skill) VALUES
(9, N'Pentest'), (9, N'OWASP'), (9, N'Network Security'), (9, N'Kali Linux');
-- 10. Khác
INSERT INTO Skill (mainSkill_id, skill) VALUES
(10, N'Microsoft Office'),
(10, N'Teamwork'),
(10, N'Kỹ năng thuyết trình'),
(10, N'Tư duy phản biện'),
(10, N'Khác');

--Mẫu cho account id = 1
INSERT INTO CV (
    account_id, job_position, summary, more_infor, sex, dateOfBirth, phone, email, address, CV_upload, avatar_cv, name, type_id
)
VALUES (
    1, N'Lập trình viên Java', N'Nhiệt huyết, chăm chỉ và sáng tạo.', N'Tôi yêu thích phát triển phần mềm.', 
    N'Nam', '1998-05-12', '0987654321', 'example@email.com', N'Hà Nội', NULL, NULL, N'Nguyễn Văn A', 1
);
INSERT INTO CV_education (CV_id, education_id, start_date, end_date, field_of_study, degree, edu_more_infor, school_custom)
VALUES 
(2, 1, '2016-09-01', '2020-06-01', N'Công nghệ thông tin', N'Cử nhân', N'Xếp loại giỏi', NULL);
INSERT INTO CV_Certification (CV_id, certification_id, year, certification_custom, description)
VALUES 
(2, 2, '2021-06-01', NULL, N'Chứng chỉ lập trình Java cơ bản');
INSERT INTO CV_Experience (
    CV_id, experience_id, start_at, end_at, company_custom, job_position, description, achievement, address
)
VALUES 
(2, 1, '2021-07-01', '2023-07-01', NULL, N'Lập trình viên Java', N'Thực hiện các dự án Web với Spring Boot', N'Hoàn thành 3 dự án lớn', N'Hà Nội');
INSERT INTO CV_Skill (CV_id, skill_id, skill_custom, level_skill)
VALUES 
(2, 1, NULL, 4); -- Level 1 đến 5 chẳng hạn

--Mẫu cho account id = 3
INSERT INTO CV (
    account_id, job_position, summary, more_infor, sex, dateOfBirth, phone, email, address, CV_upload, avatar_cv, name, type_id
)
VALUES (
    3, N'Lập trình viên Java Web', N'Tôi là người cầu tiến, yêu nghề và ham học hỏi.', 
    N'Luôn hoàn thành đúng deadline và phối hợp tốt với team.', 
    N'Nữ', '1997-10-15', '0912123456', 'b.tran@example.com', N'Hồ Chí Minh', NULL, NULL, N'Trần Thị B', 1
);
INSERT INTO CV_education (CV_id, education_id, start_date, end_date, field_of_study, degree, edu_more_infor, school_custom)
VALUES 
(3, 1, '2015-09-01', '2019-06-01', N'Khoa học máy tính', N'Cử nhân', N'GPA 3.6/4', NULL);

INSERT INTO CV_Certification (CV_id, certification_id, year, certification_custom, description)
VALUES 
(3, 2, '2020-08-01', NULL, N'Chứng chỉ Java Web nâng cao');

INSERT INTO CV_Experience (
    CV_id, experience_id, start_at, end_at, company_custom, job_position, description, achievement, address
)
VALUES 
(3, 1, '2020-09-01', '2023-09-01', NULL, N'Java Web Developer', 
N'Làm các dự án Spring Boot và JSP cho khách hàng Nhật Bản.', 
N'Trưởng nhóm kỹ thuật dự án ABC', N'HCM');

INSERT INTO CV_Skill (CV_id, skill_id, skill_custom, level_skill)
VALUES 
(3, 1, NULL, 5); -- Java Core

--Mẫu cho account id = 4
INSERT INTO CV (
    account_id, job_position, summary, more_infor, sex, dateOfBirth, phone, email, address, CV_upload, avatar_cv, name, type_id
)
VALUES (
    4, N'UI/UX Designer', N'Có gu thẩm mỹ tốt và kinh nghiệm thiết kế trên Figma.', 
    N'Muốn phát triển kỹ năng làm việc với lập trình viên.', 
    N'Nam', '1995-07-22', '0909876543', 'c.le@example.com', N'Đà Nẵng', NULL, NULL, N'Lê Văn C', 1
);
INSERT INTO CV_education (CV_id, education_id, start_date, end_date, field_of_study, degree, edu_more_infor, school_custom)
VALUES 
(4, 1, '2013-09-01', '2017-06-01', N'Thiết kế đồ họa', N'Cử nhân', N'Tốt nghiệp xuất sắc', NULL);

INSERT INTO CV_Certification (CV_id, certification_id, year, certification_custom, description)
VALUES 
(4, 3, '2021-05-01', NULL, N'Figma Advanced Certificate');

INSERT INTO CV_Experience (
    CV_id, experience_id, start_at, end_at, company_custom, job_position, description, achievement, address
)
VALUES 
(4, 2, '2018-01-01', '2023-01-01', NULL, N'UI/UX Designer', 
N'Thiết kế giao diện Web/App cho công ty Fintech.', 
N'Thiết kế giúp tăng 40% tương tác người dùng', N'Đà Nẵng');

INSERT INTO CV_Skill (CV_id, skill_id, skill_custom, level_skill)
VALUES 
(4, 2, NULL, 4); -- UI/UX hoặc thiết kế


INSERT INTO StatusJob (status_job_name, status_job_description)
VALUES 
(N'Đang tuyển', N'Công việc đang trong giai đoạn tuyển chọn ứng viên.'),
(N'Chờ kí hợp đồng', N'Đã chọn ứng viên, đang chờ kí hợp đồng giữa hai bên.'),
(N'Đang làm việc', N'Công việc đang được thực hiện bởi ứng viên đã được chọn.'),
(N'Có khiếu nại', N'Một trong hai bên có khiếu nại về công việc.'),
(N'Chờ thanh toán', N'Công việc đã hoàn thành, đang chờ thanh toán.'),
(N'Hoàn thành', N'Công việc đã được hoàn tất và thanh toán xong.'),
(N'Đã hủy', N'Công việc đã bị hủy bỏ do một lý do nào đó.');
INSERT INTO JobCategory (category_name, description) VALUES
(N'Marketing', N'Ngành tiếp thị và truyền thông'),
(N'Công nghệ & IT', N'Lĩnh vực công nghệ thông tin và phần mềm'),
(N'Design', N'Thiết kế đồ họa, UI/UX, sáng tạo hình ảnh'),
(N'Dịch thuật', N'Biên phiên dịch ngôn ngữ'),
(N'Tư vấn, Coaching', N'Hướng dẫn, tư vấn chuyên môn'),
(N'Khác', N'Ngành nghề khác không liệt kê ở trên');

-- Insert tag
INSERT INTO Tag (tag_name, description) VALUES
(N'Java', N'Lập trình Java cơ bản đến nâng cao'),
(N'Python', N'Ngôn ngữ lập trình phổ biến cho AI'),
(N'JavaScript', N'Dùng để phát triển web frontend/backend'),
(N'HTML', N'Ngôn ngữ đánh dấu siêu văn bản'),
(N'CSS', N'Thiết kế giao diện website'),
(N'JSP', N'JavaServer Pages cho web Java'),
(N'Node.js', N'Môi trường chạy JavaScript phía server'),
(N'Angular', N'Framework front-end của Google'),
(N'React', N'Thư viện front-end phổ biến'),
(N'Vue.js', N'Framework JavaScript dễ học'),
(N'C#', N'Lập trình .NET của Microsoft'),
(N'ASP.NET', N'Phát triển web bằng .NET'),
(N'PHP', N'Ngôn ngữ lập trình web phổ biến'),
(N'MySQL', N'Hệ quản trị cơ sở dữ liệu mã nguồn mở'),
(N'SQL Server', N'Hệ quản trị cơ sở dữ liệu của Microsoft'),
(N'PostgreSQL', N'Cơ sở dữ liệu quan hệ mạnh mẽ'),
(N'MongoDB', N'Cơ sở dữ liệu NoSQL'),
(N'Docker', N'Container hóa ứng dụng'),
(N'Kubernetes', N'Quản lý container'),
(N'Linux', N'Hệ điều hành mã nguồn mở'),
(N'Git', N'Hệ thống quản lý phiên bản'),
(N'GitHub', N'Nền tảng lưu trữ mã nguồn'),
(N'AWS', N'Nền tảng điện toán đám mây'),
(N'Azure', N'Dịch vụ đám mây của Microsoft'),
(N'Firebase', N'Nền tảng backend cho ứng dụng web/mobile'),
(N'Flutter', N'Phát triển ứng dụng di động đa nền tảng'),
(N'Android', N'Phát triển ứng dụng di động Android'),
(N'iOS', N'Phát triển ứng dụng cho hệ điều hành Apple'),
(N'Unity', N'Phát triển game'),
(N'AI', N'Trí tuệ nhân tạo và học máy');
-- Bổ sung các tag đa ngành nghề bằng tiếng Việt
INSERT INTO Tag (tag_name, description) VALUES
(N'Tư duy phản biện', N'Khả năng suy nghĩ logic và phân tích vấn đề hiệu quả'),
(N'Kỹ năng lãnh đạo', N'Dẫn dắt, quản lý đội nhóm và tạo ảnh hưởng tích cực'),
(N'Tư duy khởi nghiệp', N'Tư duy sáng tạo và định hướng phát triển doanh nghiệp'),
(N'Dịch vụ khách hàng', N'Chăm sóc, hỗ trợ và giữ chân khách hàng'),
(N'Bán hàng', N'Kỹ năng tư vấn, thuyết phục và chốt đơn hàng'),
(N'Kế toán', N'Xử lý sổ sách, tài chính, thuế và các nghiệp vụ kế toán'),
(N'Tài chính', N'Phân tích và quản lý dòng tiền, ngân sách'),
(N'Thương mại điện tử', N'Bán hàng trực tuyến qua các nền tảng số'),
(N'Quản trị nhân sự', N'Tuyển dụng, đào tạo và quản lý nhân sự hiệu quả'),
(N'Đào tạo & Phát triển', N'Phát triển năng lực cho cá nhân và tổ chức'),
(N'Giảng dạy', N'Kỹ năng truyền đạt kiến thức hiệu quả cho người học'),
(N'Công nghệ giáo dục', N'Ứng dụng công nghệ trong dạy và học'),
(N'Tâm lý học', N'Hiểu và ứng dụng hành vi, cảm xúc con người'),
(N'Mạng xã hội', N'Tạo nội dung và quản lý các nền tảng xã hội'),
(N'Viết quảng cáo', N'Tạo nội dung hấp dẫn để thu hút khách hàng'),
(N'Dựng video', N'Chỉnh sửa và biên tập video chuyên nghiệp'),
(N'Nhiếp ảnh', N'Chụp ảnh và xử lý hình ảnh sáng tạo'),
(N'Thống kê', N'Phân tích dữ liệu bằng các phương pháp thống kê'),
(N'Phân tích dữ liệu', N'Sử dụng dữ liệu để đưa ra quyết định'),
(N'SPSS', N'Công cụ phân tích dữ liệu chuyên sâu'),
(N'SCRUM', N'Quản lý dự án linh hoạt theo mô hình SCRUM'),
(N'Agile', N'Phương pháp làm việc linh hoạt, phản hồi nhanh'),
(N'Thiết kế Canva', N'Tạo thiết kế đơn giản với Canva'),
(N'Quản lý Notion', N'Sắp xếp công việc, ghi chú và làm việc nhóm bằng Notion'),
(N'Tư duy hình ảnh với Miro', N'Brainstorm và sơ đồ hóa ý tưởng online bằng Miro');
-- Bổ sung thêm các tag đa ngành nghề bằng Tiếng Việt
INSERT INTO Tag (tag_name, description) VALUES
(N'Quản lý thời gian', N'Lập kế hoạch và phân bổ thời gian hiệu quả'),
(N'Giải quyết vấn đề', N'Xử lý tình huống và đưa ra giải pháp hợp lý'),
(N'Tư duy sáng tạo', N'Phát triển ý tưởng mới và độc đáo'),
(N'Kỹ năng thuyết trình', N'Trình bày và giao tiếp trước đám đông hiệu quả'),
(N'Làm việc nhóm', N'Hợp tác và tương tác tốt trong đội nhóm'),
(N'Làm việc độc lập', N'Tự chủ và có trách nhiệm với công việc cá nhân'),
(N'Pháp lý cơ bản', N'Hiểu biết luật pháp cơ bản phục vụ công việc'),
(N'Chăm sóc sức khỏe tinh thần', N'Quản lý cảm xúc và giữ tâm lý tích cực'),
(N'Tổ chức sự kiện', N'Lên kế hoạch và điều phối các hoạt động sự kiện'),
(N'Marketing nội dung', N'Tạo nội dung thu hút khách hàng mục tiêu'),
(N'Phân tích đối thủ cạnh tranh', N'Đánh giá và so sánh để tạo lợi thế thị trường'),
(N'Kỹ năng viết email', N'Giao tiếp chuyên nghiệp qua email'),
(N'Tự học', N'Khả năng học tập chủ động và liên tục'),
(N'Phân tích SWOT', N'Đánh giá điểm mạnh, điểm yếu, cơ hội và thách thức'),
(N'Quản lý dự án', N'Lập kế hoạch, theo dõi và hoàn thành dự án đúng tiến độ'),
(N'Excel nâng cao', N'Sử dụng Excel để xử lý và phân tích dữ liệu hiệu quả'),
(N'PowerPoint', N'Thiết kế slide thuyết trình chuyên nghiệp'),
(N'Lập kế hoạch kinh doanh', N'Triển khai ý tưởng kinh doanh thành mô hình thực tế'),
(N'Giao tiếp liên văn hóa', N'Làm việc với người từ nhiều nền văn hóa khác nhau'),
(N'Thuyết phục và đàm phán', N'Thuyết phục khách hàng và thương lượng hiệu quả'),
(N'Triển khai OKR/KPI', N'Xây dựng và theo dõi mục tiêu trong doanh nghiệp'),
(N'TikTok Marketing', N'Quảng bá sản phẩm trên nền tảng TikTok'),
(N'AI trong công việc', N'Ứng dụng trí tuệ nhân tạo để tăng hiệu suất'),
(N'Thiết kế UX/UI', N'Thiết kế trải nghiệm và giao diện người dùng'),
(N'Blockchain cơ bản', N'Hiểu và ứng dụng công nghệ blockchain');

INSERT INTO Job (
    post_account_id, job_title, job_description, requirements, benefit,
    attachment, category_id, budget_min, budget_max, due_date_post,
    due_date_job, have_interviewed, have_tested, num_of_member, secure_wallet,
    status_post, status_job_id
)
VALUES
(1, N'Lập trình viên Java Web', N'Mô tả công việc...', N'Yêu cầu...', N'Phúc lợi...',
NULL, 1, 10000000, 20000000, '2025-05-30', '2025-06-30', 1, 1, 3, 5000000, N'Đang tuyển', 1),
(2, N'Thiết kế UI/UX', N'Mô tả công việc...', N'Yêu cầu...', N'Phúc lợi...',
NULL, 2, 8000000, 15000000, '2025-05-25', '2025-07-15', 0, 0, 2, 3000000, N'Đang tuyển', 1);
INSERT INTO JobTag (tag_id, job_id)
VALUES
(1, 1), -- Java -> Job 1
(4, 1), -- Tester -> Job 1
(3, 2); -- UI/UX -> Job 2
INSERT INTO Test (job_id, test_link, have_required)
VALUES
(1, 'https://example.com/java-test', 1),
(2, 'https://example.com/uiux-test', 0);

INSERT INTO Reject_reason (reject_reason)
VALUES 
(N'Không đáp ứng yêu cầu kỹ năng'),
(N'Thiếu kinh nghiệm'),
(N'Mức lương đề xuất không phù hợp'),
(N'Thời gian dự kiến không phù hợp'),
(N'Khác');
INSERT INTO JobGreeting (
    job_seeker_id, job_id, cv_id, price, expected_day, introduction,
    attachment, have_read, reject_reason_id, reject_reason_note,
    confirm_note, status
)
VALUES
-- C ứng tuyển Job 1
(3, 1, 4, 15000000, 20, N'Tôi có 3 năm kinh nghiệm Java Web.', NULL, 0, NULL, NULL, NULL, N'Chờ xét duyệt'),

-- B ứng tuyển Job 2 và bị từ chối
(4, 2, 5, 12000000, 15, N'Tôi từng làm UI/UX cho nhiều dự án lớn.', NULL, 1, 1, N'Thiếu kinh nghiệm cần thiết', N'Rất tiếc!', N'Bị từ chối'),

-- C được mời phỏng vấn Job 2
(3, 2, 4, 13000000, 18, N'Tôi có thêm kinh nghiệm thiết kế mobile app.', NULL, 1, NULL, NULL, N'Mời phỏng vấn lúc 10h sáng thứ 2', N'Chờ phỏng vấn');

-- Phỏng vấn cho Lê Văn C (greeting_id = 3)
INSERT INTO Interview (
    interview_date, interview_time, interview_form, interview_address, interview_note, job_id, greeting_id
)
VALUES (
    '2025-04-27', '10:00:00', N'Offline', N'Trung tâm Innovation Đà Nẵng', N'Phỏng vấn UI/UX Designer', 2, 3
);

-- Thông báo hệ thống cho account_id = 1
INSERT INTO Notification (
    account_id, notification_title, notification_content, notification_type, have_read, link_detail
)
VALUES (
    1, N'Tài khoản đã được xác minh', 
    N'Chúc mừng! Tài khoản của bạn đã được xác minh thành công.', 
    N'Hệ thống', 0, '/profile/1'
);

-- Thông báo tương tác cho account_id = 3
INSERT INTO Notification (
    account_id, notification_title, notification_content, notification_type, have_read, link_detail
)
VALUES (
    3, N'Bạn có lời mời phỏng vấn mới', 
    N'Nhà tuyển dụng ABC đã gửi lời mời phỏng vấn cho công việc: Java Backend.', 
    N'Tương tác', 0, '/interview/2'
);

-- Thông báo giao dịch cho account_id = 4
INSERT INTO Notification (
    account_id, notification_title, notification_content, notification_type, have_read, link_detail
)
VALUES (
    4, N'Thanh toán đã hoàn tất', 
    N'Bạn đã thanh toán thành công 1.000.000 VNĐ vào ví bảo mật.', 
    N'Giao dịch', 1, '/wallet/history'
);

-- Thông báo hệ thống chưa đọc cho account_id = 4
INSERT INTO Notification (
    account_id, notification_title, notification_content, notification_type, have_read, link_detail
)
VALUES (
    4, N'Cập nhật hệ thống', 
    N'Hệ thống sẽ bảo trì vào lúc 00:00 ngày 01/05/2025.', 
    N'Hệ thống', 0, '/news/system-update'
);


CREATE DATABASE JobTransnew
GO
USE JobTransnew;
GO
CREATE TABLE Account (
    account_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    account_name NVARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(MAX),
	avatar VARCHAR(MAX) DEFAULT 'img/default-avatar.jpg',
	oauth_id NVARCHAR(MAX), -- dành cho đăng nhập Google
	oauth_provider NVARCHAR(MAX), -- dành cho đăng nhập Google
	date_of_birth DATE,
    gender NVARCHAR(10) CHECK (gender IN (N'Nam', N'Nữ')),
    phone VARCHAR(50),
	address NVARCHAR(MAX),
	education NVARCHAR(255),
	speciality NVARCHAR(500), 
	experience_years INT,
	skills NVARCHAR(MAX), -- xử lí như tách tag
	bio NVARCHAR(MAX),
	point INT DEFAULT 0, 
	star_rate DECIMAL(2, 1) DEFAULT 0,
	amount_wallet DECIMAL(18, 2) DEFAULT 0, 
	verified_link NVARCHAR(MAX),
    verified_account BIT,
	complete_percent DECIMAL(5, 4),
    label_tag NVARCHAR(255),
    count INT, --so lan bi am diem
    role NVARCHAR(100) DEFAULT N'Người dùng' CHECK (role IN (N'Người dùng', N'Admin')),
	type_account NVARCHAR(100) CHECK (type_account IN (N'Cá nhân', N'Nhóm')),
	level_account NVARCHAR(100) DEFAULT N'Tài khoản thường' CHECK (level_account IN (N'Tài khoản thường', N'Tài khoản VIP')),
	signature NVARCHAR(MAX),
	join_date DATETIME DEFAULT GETDATE(),
	count_member INT,
    status NVARCHAR(50) DEFAULT N'Đang hoạt động' CHECK (status IN (N'Đang hoạt động', N'Bị cấm', N'Chờ xử lí'))
);

-- Tạo bảng Group_Member
CREATE TABLE Group_Member (
    member_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    member_name NVARCHAR(50),
    account_id INT NOT NULL,
	avatar_member NVARCHAR(MAX) DEFAULT 'default-avatar.jpg',
	gender NVARCHAR(10),
	date_of_birth DATE,
	phone VARCHAR(50),
	address NVARCHAR(MAX),
	position NVARCHAR(MAX),
	speciality NVARCHAR(50),
	experience_years INT,
	skills NVARCHAR(MAX),
    bio NVARCHAR(MAX),
    education NVARCHAR(255),
    status NVARCHAR(50) DEFAULT N'Đang hoạt động' CHECK (status IN (N'Đang hoạt động', N'Ngừng hoạt động')),
	-- Thiết lập khóa ngoại liên kết với bảng Account
    CONSTRAINT FK_GroupMember_Account FOREIGN KEY (account_id) 
    REFERENCES Account(account_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE  
);

-- Tạo api- key dùng cho ChatBot
CREATE TABLE user_api_keys (
    id INT IDENTITY(1,1) PRIMARY KEY,
    account_id INT NOT NULL,
    openrouter_api_key TEXT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),  -- Thay TIMESTAMP bằng DATETIME và GETDATE() để lấy thời gian hiện tại
    CONSTRAINT fk_account FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

-- Tạo bảng Notification
CREATE TABLE Notification (
    notification_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    account_id INT,  -- Khóa ngoại tham chiếu đến Account
	notification_title NVARCHAR(150),
    notification_content NVARCHAR(MAX),
    notification_time DATETIME DEFAULT GETDATE(),
    have_read BIT,
    -- Thiết lập khóa ngoại liên kết với bảng Account
    CONSTRAINT FK_Notification_Account FOREIGN KEY (account_id) 
    REFERENCES Account(account_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Tạo bảng Criteria vi phạm, cộng điểm
CREATE TABLE Criteria (
    criteria_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    content NVARCHAR(MAX),
    criteria_point INT,
	label_tag NVARCHAR(255) NULL,
	type_criteria NVARCHAR(255) DEFAULT N'Trừ điểm' CHECK (type_criteria IN (N'Trừ điểm', N'Cộng điểm', N'Block', N'Nhãn cảnh báo'))
);

-- CỘNG ĐIỂM
INSERT INTO Criteria (content, criteria_point, type_criteria) VALUES
(N'Người dùng xác thực tài khoản bằng liên kết của bên thứ 3 như LinkedIn', 50, N'Cộng điểm'),
(N'Hoàn thành 2 công việc đầu tiên', 30, N'Cộng điểm'),
(N'Seeker hoàn thành đúng hạn', 10, N'Cộng điểm'),
(N'Nhận đánh giá 5 sao từ khách hàng', 15, N'Cộng điểm'),
(N'Xây dựng hồ sơ đầy đủ, chi tiết', 5, N'Cộng điểm'),
(N'Seeker hoàn thành dự án trước deadline', 15, N'Cộng điểm'),
(N'Được khách hàng thuê lại nhiều lần', 10, N'Cộng điểm'),
(N'Employer trả tiền đúng hạn', 10, N'Cộng điểm'),
(N'Giới thiệu bạn bè (từ người thứ nhất)', 15, N'Cộng điểm'),
(N'Giới thiệu bạn bè (từ người thứ 2 trở đi)', 5, N'Cộng điểm'),
(N'Tạo tài khoản', 10, N'Cộng điểm');

-- VI PHẠM NGƯỜI DÙNG
INSERT INTO Criteria (content, criteria_point, type_criteria) VALUES
(N'Dùng từ thô thiển, vi phạm chuẩn mực', -20, N'Trừ điểm'),
(N'Spam liên tục', -30, N'Trừ điểm');

INSERT INTO Criteria (content, criteria_point, type_criteria) VALUES
(N'Giả mạo', -1000, N'Block'),
(N'Bán lại hoặc tiết lộ thông tin khách hàng trái phép', -1000, N'Block');

-- BỊ KHIẾU NẠI LÀM VIỆC (KHIẾU NẠI ĐÚNG)
INSERT INTO Criteria (content, criteria_point, type_criteria) VALUES
(N'Bị khiếu nại: Thái độ làm việc', -20, N'Trừ điểm'),
(N'Bị khiếu nại: Quá hạn làm việc', -30, N'Trừ điểm'),
(N'Bị khiếu nại: Đạo văn', -30, N'Trừ điểm'),
(N'Bị khiếu nại: Tiết lộ thông tin', -30, N'Trừ điểm'),
(N'Bị khiếu nại: Sản phẩm kém chất lượng', -30, N'Trừ điểm');

-- PHẢN HỒI TRẢ TIỀN CHẬM
INSERT INTO Criteria (content, criteria_point, type_criteria) VALUES
(N'Phản hồi trả tiền chậm khi đến hạn: Nhắc lần đầu', -5, N'Trừ điểm');

INSERT INTO Criteria (content, criteria_point, type_criteria, label_tag) VALUES
(N'Phản hồi trả tiền chậm khi đến hạn: Nhắc lần 2 (dán nhãn)', -30, N'Nhãn cảnh báo', N'Chậm thanh toán');

-- VẤN ĐỀ ĐIỂM ÂM
INSERT INTO Criteria (content, criteria_point, type_criteria, label_tag) VALUES
(N'Điểm âm lần 1 - Cảnh cáo', 0, N'Nhãn cảnh báo', N'Cảnh cáo lần 1'),
(N'Điểm âm lần 2 - Hạn chế apply công việc > 10 triệu trong 1 tháng', 0, N'Nhãn cảnh báo', N'Hạn chế cấp 1'),
(N'Điểm âm lần 3 - Hạn chế apply công việc > 5 triệu trong 3 tháng', 0, N'Nhãn cảnh báo', N'Hạn chế cấp 2'),
(N'Điểm âm lần 4 - Hạn chế apply công việc > 2 triệu trong 5 tháng', 0, N'Nhãn cảnh báo', N'Hạn chế cấp 3');

INSERT INTO Criteria (content, criteria_point, type_criteria) VALUES
(N'Điểm âm lần 5 - Block tài khoản', -1000, N'Block');

-- Tạo bảng PointHistory
CREATE TABLE PointHistory (
    history_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    account_id INT,
    criteria_id INT,
    time DATETIME DEFAULT GETDATE(), 
	point_note NVARCHAR(MAX)

    -- Thiết lập khóa ngoại
    CONSTRAINT FK_PointHistory_Account FOREIGN KEY (account_id) 
    REFERENCES Account(account_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,

    CONSTRAINT FK_PointHistory_Criteria FOREIGN KEY (criteria_id) 
    REFERENCES Criteria(criteria_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE AccountReport (
    account_report_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    reported_account INT,
    report_by INT,
	criteria_id INT,
    content_report NVARCHAR(MAX),
    attachment NVARCHAR(MAX),
    report_time DATETIME DEFAULT GETDATE(),
	status NVARCHAR(200) DEFAULT N'Chờ xử lí' CHECK (status IN (N'Chờ xử lí', N'Bị từ chối', N'Đã xử lí')) ,
    
	-- Thiết lập khóa ngoại với Account (N-1)
    CONSTRAINT FK_AccountReport_ReportedAccount FOREIGN KEY (reported_account) 
    REFERENCES Account(account_id), 

    CONSTRAINT FK_AccountReport_ReportBy FOREIGN KEY (report_by) 
    REFERENCES Account(account_id), 

    -- Thiết lập khóa ngoại với Criteria (1-1)
    CONSTRAINT FK_AccountReport_Criteria FOREIGN KEY (criteria_id) 
    REFERENCES Criteria(criteria_id) 
);

CREATE TRIGGER trg_Delete_AccountReport
ON Account
INSTEAD OF DELETE
AS
BEGIN
    -- Xóa các báo cáo liên quan trước khi xóa tài khoản
    DELETE FROM AccountReport WHERE reported_account IN (SELECT account_id FROM deleted);
    DELETE FROM AccountReport WHERE report_by IN (SELECT account_id FROM deleted);

    -- Xóa tài khoản sau khi xóa báo cáo
    DELETE FROM Account WHERE account_id IN (SELECT account_id FROM deleted);
END;



--Loại mẫu CV
CREATE TABLE CV_Type (
    type_id INT IDENTITY(1,1) PRIMARY KEY,
    type_name NVARCHAR(100) NOT NULL, 
    description NVARCHAR(MAX),
);
ALTER TABLE CV_Type
ADD price_cv INT;
ALTER TABLE CV_Type
ADD image_cv VARCHAR(MAX) ;

-- CV
CREATE TABLE CV (
    CV_id INT IDENTITY(1,1) PRIMARY KEY,
    account_id INT NOT NULL FOREIGN KEY REFERENCES Account(account_id) ON DELETE CASCADE,
    job_position NVARCHAR(200),
    summary NVARCHAR(MAX),
    more_infor NVARCHAR(MAX),
    created_at DATE DEFAULT GETDATE(),
    sex NVARCHAR(10),  -- Sửa lại độ dài phù hợp
    dateOfBirth DATE,  -- Đúng cú pháp
    phone VARCHAR(10),
    email VARCHAR(30),
    address NVARCHAR(100),
    CV_upload NVARCHAR(MAX),
    avatar_cv NVARCHAR(MAX),
    name NVARCHAR(100),
    type_id INT,
    CONSTRAINT FK_CV_CV_Type FOREIGN KEY (type_id)
	REFERENCES CV_Type(type_id) ON DELETE SET NULL
);
CREATE TABLE BackGround_CV (
    CV_id INT NOT NULL,
    backgroundCV NVARCHAR(255),
    PRIMARY KEY (CV_id, backgroundCV),
    FOREIGN KEY (CV_id) REFERENCES CV(CV_id) ON DELETE CASCADE,
);
--School
CREATE TABLE School (
    education_id INT IDENTITY(1,1) PRIMARY KEY,
    school_name NVARCHAR(100) NOT NULL
);
CREATE TABLE CV_education (
    CV_id INT NOT NULL,
    education_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    field_of_study NVARCHAR(100),
    degree NVARCHAR(50),
    edu_more_infor NVARCHAR(MAX),
    school_custom NVARCHAR(200),
    PRIMARY KEY (CV_id, education_id),
    FOREIGN KEY (CV_id) REFERENCES CV(CV_id) ON DELETE CASCADE,
    FOREIGN KEY (education_id) REFERENCES School(education_id) ON DELETE CASCADE
);

--Certification
CREATE TABLE Certification (
    certification_id INT IDENTITY(1,1) PRIMARY KEY,
    certification_name NVARCHAR(100) NOT NULL
);
CREATE TABLE CV_Certification (
    CV_id INT NOT NULL,
    certification_id INT NOT NULL,
    year DATE,
    certification_custom NVARCHAR(200),

    description NVARCHAR(MAX),
    PRIMARY KEY (CV_id, certification_id),
    FOREIGN KEY (CV_id) REFERENCES CV(CV_id) ON DELETE CASCADE,
    FOREIGN KEY (certification_id) REFERENCES Certification(certification_id) ON DELETE CASCADE
);

-- Company
CREATE TABLE Company (
    experience_id INT IDENTITY(1,1) PRIMARY KEY,
    company_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX)
);
CREATE TABLE CV_Experience (
    CV_id INT NOT NULL,
    experience_id INT NOT NULL,
    start_at DATE,
    end_at DATE,
    company_custom NVARCHAR(200),
    job_position NVARCHAR(100),
    description NVARCHAR(MAX),
    achievement NVARCHAR(MAX),
    PRIMARY KEY (CV_id, experience_id),
    FOREIGN KEY (CV_id) REFERENCES CV(CV_id) ON DELETE CASCADE,
    FOREIGN KEY (experience_id) REFERENCES Company(experience_id) ON DELETE CASCADE
);
ALTER TABLE CV_Experience
ADD  address NVARCHAR(100);

--Skill
CREATE TABLE Main_Skill (
    mainSkill_id INT IDENTITY(1,1) PRIMARY KEY,
    main_skill NVARCHAR(100) NOT NULL -- VD: Lập trình, Ngôn ngữ
);
CREATE TABLE Skill (
    skill_id INT IDENTITY(1,1) PRIMARY KEY,
    mainSkill_id INT NOT NULL, -- Liên kết đến nhóm kỹ năng
    skill NVARCHAR(100) NOT NULL, -- VD: CSS, HTML, Tiếng Anh
    FOREIGN KEY (mainSkill_id) REFERENCES Main_Skill(mainSkill_id) ON DELETE CASCADE
);
CREATE TABLE CV_Skill (
    CV_id INT NOT NULL,
    skill_id INT NOT NULL, -- Liên kết đến Skill thay vì Main_Skill
    skill_custom NVARCHAR(200) NULL, -- Nếu muốn nhập kỹ năng ngoài danh mục
    level_skill INT,

    PRIMARY KEY (CV_id, skill_id),
    FOREIGN KEY (CV_id) REFERENCES CV(CV_id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id) ON DELETE CASCADE
);

-- JOB
CREATE TABLE StatusJob(
	status_job_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	status_job_name NVARCHAR(100),
	status_job_description NVARCHAR(MAX)
)

INSERT INTO StatusJob (status_job_name, status_job_description)
VALUES 
(N'Đang tuyển', N'Công việc đang trong giai đoạn tuyển chọn ứng viên.'),
(N'Chờ kí hợp đồng', N'Đã chọn ứng viên, đang chờ kí hợp đồng giữa hai bên.'),
(N'Đang làm việc', N'Công việc đang được thực hiện bởi ứng viên đã được chọn.'),
(N'Có khiếu nại', N'Một trong hai bên có khiếu nại về công việc.'),
(N'Chờ thanh toán', N'Công việc đã hoàn thành, đang chờ thanh toán.'),
(N'Hoàn thành', N'Công việc đã được hoàn tất và thanh toán xong.'),
(N'Đã hủy', N'Công việc đã bị hủy bỏ do một lý do nào đó.');


CREATE TABLE JobCategory (
    category_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    category_name NVARCHAR(50) NOT NULL,
    description NVARCHAR(100),
);
CREATE TABLE Job (
    job_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	post_account_id INT NOT NULL, -- Thêm khóa ngoại tham chiếu Account
    job_title NVARCHAR(150) NOT NULL,
    post_date DATETIME DEFAULT GETDATE(),
    job_description NVARCHAR(MAX),
	requirements NVARCHAR(MAX),
	benefit NVARCHAR(MAX),
	attachment VARCHAR(MAX),
    category_id INT NOT NULL,
	budget_max DECIMAL(18,2),
    budget_min DECIMAL(18,2),
    due_date_post DATE, --Hạn kết thúc bài đăng
	due_date_job DATE, -- Hạn dự kiến kết thúc công việc
    have_interviewed BIT, 
	have_tested BIT, 
    num_of_member INT,
    secure_wallet INT,
	status_post NVARCHAR(100) DEFAULT N'Đang tuyển' CHECK (status_post IN (N'Đang tuyển', N'Hết hạn')),
	status_job_id INT NOT NULL DEFAULT 1,
	FOREIGN KEY (status_job_id) REFERENCES StatusJob(status_job_id),
	FOREIGN KEY (category_id) REFERENCES JobCategory(category_id),
    CONSTRAINT FK_Job_Account FOREIGN KEY (post_account_id) REFERENCES Account(account_id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Tag (
    tag_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tag_name NVARCHAR(50) NOT NULL,
    description NVARCHAR(100)
);
CREATE TABLE JobTag (
    job_tag_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tag_id INT NOT NULL,
    job_id INT NOT NULL,
    FOREIGN KEY (job_id) REFERENCES Job(job_id),
    FOREIGN KEY (tag_id) REFERENCES Tag(tag_id)
);
-- Xóa bằng tool FK liên quan đến job_id
-- Bước 2: Thêm lại ràng buộc khóa ngoại với ON DELETE CASCADE
ALTER TABLE JobTag
ADD CONSTRAINT FK_JobTag_Job FOREIGN KEY (job_id) REFERENCES Job(job_id) ON DELETE CASCADE;

CREATE TABLE Test (
    test_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	job_id INT NOT NULL, -- test dành cho job nào
    test_link VARCHAR(500) NOT NULL,
    have_required BIT NOT NULL DEFAULT 1, -- có bắt buộc hay không (default TRUE)
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (job_id) REFERENCES Job(job_id)
);

CREATE TABLE Interview (
    interview_id INT IDENTITY(1,1) PRIMARY KEY,
    start_date DATETIME DEFAULT GETDATE(),
    interview_link VARCHAR(MAX),
    interview_record VARCHAR(MAX),
    job_id INT NOT NULL,  -- Thêm cột job_id

    -- Thiết lập khóa ngoại tham chiếu đến bảng Job
    CONSTRAINT FK_Interview_Job FOREIGN KEY (job_id) REFERENCES Job(job_id) 
);

-- Xóa bằng tool FK liên quan đến job_id
-- Bước 2: Thêm lại ràng buộc khóa ngoại với ON DELETE CASCADE
ALTER TABLE Interview
ADD CONSTRAINT FK_Interview_Job FOREIGN KEY (job_id) REFERENCES Job(job_id) ON DELETE CASCADE;

CREATE TABLE JobGreeting (
    greeting_id INT IDENTITY(1,1) PRIMARY KEY,
    job_seeker_id INT NOT NULL, -- Thêm khóa ngoại tham chiếu Account
    job_id INT NOT NULL,
	cv_id INT NOT NULL,
	price INT,
	expected_day INT,
    introduction NVARCHAR(MAX),
    attachment NVARCHAR(MAX),
	have_read BIT,
    status NVARCHAR(100) DEFAULT N'Chờ xét duyệt' CHECK (status IN (N'Chờ xét duyệt', N'Chờ phỏng vấn', N'Bị từ chối', N'Được nhận')),
    CONSTRAINT FK_JobGreeting_Account FOREIGN KEY (job_seeker_id) REFERENCES Account(account_id), 
	CONSTRAINT FK_JobGreeting_CV FOREIGN KEY (cv_id) REFERENCES CV(cv_id), 
    CONSTRAINT FK_JobGreeting_Job FOREIGN KEY (job_id) REFERENCES Job(job_id)
);

CREATE TABLE Conversation (
    conversation_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    job_id INT NOT NULL,
    start_date DATE NOT NULL,
    FOREIGN KEY (job_id) REFERENCES Job(job_id) ON DELETE CASCADE
);
CREATE TABLE Message (
    message_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    job_id INT NOT NULL,
    sender_id INT NOT NULL,
    conversation_id INT NOT NULL,
    attachment VARCHAR(MAX),
    content NVARCHAR(MAX),
    sent_time DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (job_id) REFERENCES Job(job_id),
    FOREIGN KEY (sender_id) REFERENCES Account(account_id),
    FOREIGN KEY (conversation_id) REFERENCES Conversation(conversation_id)
);

CREATE TABLE Shipment (
    shipment_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    third_part_order_id NVARCHAR(100) NOT NULL,
    job_id INT NOT NULL,
    sender_id INT NOT NULL,
    pick_name NVARCHAR(200),
    pick_province NVARCHAR(200),
    pick_ward NVARCHAR(200),
    pick_address NVARCHAR(200),
    pick_tel VARCHAR(10),
    name NVARCHAR(200),
    province NVARCHAR(200),
    ward NVARCHAR(200),
    address NVARCHAR(200),
    tel VARCHAR(10),
    product_name NVARCHAR(200),
    product_quantity INT,
    product_weight FLOAT,
    status NVARCHAR(100),
    tracking_id VARCHAR(100),
    FOREIGN KEY (job_id) REFERENCES Job(job_id),
    FOREIGN KEY (sender_id) REFERENCES Account(account_id)
);

CREATE TABLE JobReport (
    job_report_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    job_id INT NOT NULL,
	reported_account INT NOT NULL,
    reported_by INT NOT NULL,
    criteria_id INT,
    content_report NVARCHAR(MAX),
    attachment NVARCHAR(MAX),
    status NVARCHAR(100) DEFAULT N'Chờ xử lí' CHECK (status IN (N'Chờ xử lí', N'Bị từ chối', N'Đã xử lí'))
    FOREIGN KEY (job_id) REFERENCES Job(job_id) ON DELETE CASCADE,
    FOREIGN KEY (reported_by) REFERENCES Account(account_id),
	FOREIGN KEY (reported_account) REFERENCES Account(account_id),
	FOREIGN KEY (criteria_id) REFERENCES Criteria(criteria_id)
);

CREATE TABLE Feedback (
    feedback_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    job_id INT NOT NULL,                      -- Mã công việc được phản hồi
    from_user_id INT NOT NULL,                -- Người gửi feedback (có thể là seeker hoặc employer)
    to_user_id INT NOT NULL,                  -- Người nhận feedback
    rating INT CHECK (rating BETWEEN 1 AND 5),-- Điểm đánh giá sao (từ 1 đến 5)
    content NVARCHAR(MAX),                    -- Nội dung phản hồi (mô tả chi tiết)
    created_at DATETIME DEFAULT GETDATE(),    -- Thời gian gửi feedback
    type NVARCHAR(20) CHECK (type IN (N'EmployerToSeeker', N'SeekerToEmployer')), -- Loại feedback
    CONSTRAINT FK_Feedback_Job FOREIGN KEY (job_id) REFERENCES Job(job_id),
    CONSTRAINT FK_Feedback_FromUser FOREIGN KEY (from_user_id) REFERENCES Account(account_id),
    CONSTRAINT FK_Feedback_ToUser FOREIGN KEY (to_user_id) REFERENCES Account(account_id)
);


CREATE TABLE CancelRequest (
    cancel_request_id INT IDENTITY(1,1) PRIMARY KEY,
    job_id INT NOT NULL,
    requester_id INT NOT NULL, -- ID người yêu cầu hủy
    reason NVARCHAR(MAX),      -- Lý do yêu cầu hủy
    created_at DATETIME DEFAULT GETDATE(), -- Thời gian gửi yêu cầu
    have_approved BIT DEFAULT 0, -- Trạng thái phê duyệt (0: chưa duyệt, 1: đã duyệt)

    -- Ràng buộc khóa ngoại
    FOREIGN KEY (job_id) REFERENCES Job(job_id),
    FOREIGN KEY (requester_id) REFERENCES Account(account_id)
);


CREATE TABLE Contract (
    contract_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    job_id INT NOT NULL,
    contract_link NVARCHAR(MAX), 
    status NVARCHAR(100),
	A_name NVARCHAR(100) NOT NULL,
    A_address NVARCHAR(500),
	A_representative NVARCHAR(500) NOT NULL, --đại diện
	A_email VARCHAR(200),
	A_signature BIT NOT NULL,
	B_identity VARCHAR(50) NOT NULL,
	B_identity_date DATE NOT NULL,
	B_birthday DATE,
	B_address NVARCHAR(500),
	B_phone_number VARCHAR(50),
	B_email VARCHAR(200),
	B_signature BIT NOT NULL,
	job_goal NVARCHAR(MAX) NOT NULL,
	job_requirement NVARCHAR(MAX) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	job_address NVARCHAR(MAX),
	job_fee FLOAT NOT NULL,
	job_deposit_A FLOAT NOT NULL,
	job_deposit_A_date DATE NOT NULL,
	job_deposit_A_text NVARCHAR(200),
	job_deposit_B FLOAT NOT NULL,
	job_deposit_B_date DATE NOT NULL,
	job_deposit_B_text NVARCHAR(200),
	FOREIGN KEY (job_id) REFERENCES Job(job_id) ON DELETE CASCADE
);

-- Tạo bảng Transaction
CREATE TABLE [Transaction] (
    transaction_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    job_id INT,
    amount INT NOT NULL,
    created_date DATETIME DEFAULT GETDATE(),
    description NVARCHAR(MAX),
	transaction_type NVARCHAR(50) DEFAULT N'Thêm tiền' CHECK (transaction_type IN (N'Thêm tiền', N'Trừ tiền', N'Rút tiền')) ,
    status BIT DEFAULT 1,

    -- Thiết lập khóa ngoại
    CONSTRAINT FK_Transaction_Sender FOREIGN KEY (sender_id) 
    REFERENCES Account(account_id),

    CONSTRAINT FK_Transaction_Receiver FOREIGN KEY (receiver_id) 
    REFERENCES Account(account_id) ,

    CONSTRAINT FK_Transaction_Job FOREIGN KEY (job_id) 
    REFERENCES Job(job_id) 
);

-- Insert type
INSERT INTO CV_Type (type_name, description, price_cv, image_cv)
VALUES 
('Basic CV', N'CV cơ bản với thông tin cá nhân và kinh nghiệm làm việc.', 100000, 'basic_cv_image_url.jpg'),
('Professional CV', N'CV chuyên nghiệp với các kỹ năng, chứng chỉ, và dự án đã thực hiện.', 200000, 'professional_cv_image_url.jpg'),
('Creative CV', N'CV sáng tạo, phù hợp cho các ngành thiết kế, nghệ thuật.', 250000, 'creative_cv_image_url.jpg'),
('Executive CV', N'CV cao cấp cho các ứng viên cấp cao, bao gồm các dự án quản lý và thành tựu nổi bật.', 500000, 'executive_cv_image_url.jpg');

INSERT INTO Account (account_name, email, password, role)
VALUES 
(N'Nguyễn Văn A', 'a.nguyen@example.com', 'password123', N'Người dùng'),
(N'Trần Thị B', 'b.tran@example.com', 'password123', N'Người dùng'),
(N'Lê Văn C', 'c.le@example.com', 'password123', N'Người dùng');


-- 1 tài khoản với role "Admin"
INSERT INTO Account (account_name, email, password, role)
VALUES 
(N'Admin D', 'admin.d@example.com', 'adminpassword', N'Admin');

-- Insert Job Category
INSERT INTO JobCategory (category_name, description)
VALUES 
(N'Công nghệ thông tin', N'Lập trình, phát triển phần mềm, quản trị hệ thống'),
(N'Thiết kế đồ họa', N'Thiết kế logo, banner, giao diện web, ấn phẩm truyền thông'),
(N'Digital Marketing', N'Tiếp thị số, SEO, quảng cáo Facebook, Google Ads'),
(N'Biên dịch & Phiên dịch', N'Dịch thuật tài liệu, phiên dịch đa ngôn ngữ'),
(N'Giáo dục & Đào tạo', N'Dạy học online, dạy kèm các môn học, kỹ năng mềm');

-- Insert Job
INSERT INTO Job (
    post_account_id, job_title, job_description, requirements, benefit, attachment, category_id,
    budget_max, budget_min, due_date_post, due_date_job,
    have_interviewed, have_tested, num_of_member, secure_wallet, status_post, status_job_id
)
VALUES
(1, N'Lập trình website bán hàng', N'Tìm freelancer làm web bán hàng bằng PHP', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 1, 1000.00, 700.00, '2025-05-01', '2025-06-01', 0, 0, 1, 0, N'Đang tuyển', 1),
(1, N'Thiết kế logo công ty', N'Cần designer chuyên nghiệp thiết kế logo', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 2, 500.00, 300.00, '2025-04-15', '2025-04-30', 0, 0, 1, 0, N'Hết hạn', 1),
(1, N'Dịch tài liệu tiếng Anh', N'Dịch báo cáo từ tiếng Anh sang tiếng Việt', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 3, 200.00, 150.00, '2025-04-21', '2025-04-25', 0, 0, 1, 0, N'Đang tuyển', 1),
(1, N'Tạo video quảng cáo', N'Video quảng cáo cho sản phẩm mới', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 4, 1200.00, 1000.00, '2025-04-20', '2025-05-05', 1, 0, 2, 0, N'Đang tuyển', 1),
(1, N'Lập trình ứng dụng mobile', N'Ứng dụng Android đơn giản', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 1, 1500.00, 1200.00, '2025-04-18', '2025-06-10', 0, 1, 2, 0, N'Đang tuyển', 1),
(1, N'Quản lý Fanpage Facebook', N'Cần người chăm sóc Fanpage hàng ngày', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 5, 300.00, 200.00, '2025-04-16', '2025-05-16', 0, 0, 1, 0, N'Hết hạn', 1),
(1, N'Dạy kèm tiếng Hàn', N'Dạy tiếng Hàn sơ cấp online', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 5, 250.00, 200.00, '2025-04-19', '2025-05-01', 0, 0, 1, 0, N'Đang tuyển', 1),
(1, N'Ve viết nội dung website', N'Nội dung blog lĩnh vực công nghệ', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 3, 400.00, 300.00, '2025-04-27', '2025-05-07', 1, 1, 2, 0, N'Đang tuyển', 1),
(1, N'Thiết kế brochure sản phẩm', N'Cần thiết kế brochure chuyên nghiệp', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 2, 600.00, 500.00, '2025-04-15', '2025-05-10', 0, 0, 1, 0, N'Hết hạn', 1),
(1, N'Test phần mềm', N'Test chức năng của ứng dụng web', N'Hoàn thành đúng thời hạn', N'Trả lương đúng hạn', NULL, 1, 300.00, 250.00, '2025-04-17', '2025-05-02', 1, 1, 2, 0, N'Hết hạn', 1);

-- Insert CV
INSERT INTO CV (account_id, job_position, summary, more_infor, sex, dateOfBirth, phone, email, address, CV_upload, avatar_cv, name, type_id)
VALUES (2, N'Lập trình viên Backend', N'Có 2 năm kinh nghiệm Java Spring Boot', N'Tham gia nhiều dự án outsource', N'Nam', '2000-05-15', '0912345678', 'abc@gmail.com', N'Hà Nội', NULL, NULL, N'Nguyễn Văn A', 1),
		(3, N'Lập trình viên Backend', N'Có 2 năm kinh nghiệm Java Spring Boot', N'Tham gia nhiều dự án outsource', N'Nam', '2000-05-15', '0912345678', 'abc@gmail.com', N'Hà Nội', NULL, NULL, N'Nguyễn Văn B', 1);


-- Insert JobGreeting
INSERT INTO JobGreeting (
    job_seeker_id,
    job_id,
    cv_id,
    price,
    expected_day,
    introduction,
    have_read
) VALUES 
(2, 1, 1, 5000000, 7, N'Xin chào, tôi rất quan tâm đến vị trí này và mong được hợp tác.', 0),
(3, 1, 2, 6000000, 10, N'Tôi có kinh nghiệm phù hợp và mong có cơ hội phỏng vấn.', 0),
(2, 2, 1, 5500000, 5, N'Tôi tin mình có thể đáp ứng yêu cầu công việc.', 1),
(3, 2, 2, 6500000, 8, N'Tôi đã làm công việc tương tự trước đây.', 1),
(2, 1, 1, 7000000, 6, N'Sẵn sàng bắt đầu ngay khi có thể.', 1);

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

CREATE DATABASE JobTransnew
GO
USE JobTransnew;
GO
CREATE TABLE Account (
    account_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    account_name NVARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50),
    phone VARCHAR(50),
    avatar VARCHAR(MAX),
    bio NVARCHAR(MAX),
    address NVARCHAR(MAX),
    date_of_birth DATE,
    gender NVARCHAR(10),
    specialist NVARCHAR(50),
    experience_years INT,
    education NVARCHAR(255),
    point INT,
    verified_account BIT,
    verified_link BIT,
	tag_complete INT,
    tag_debt INT,
    count INT, --so lan bi am diem
    role NVARCHAR(100),
	type NVARCHAR(100),
	signature NVARCHAR(MAX),
    status NVARCHAR(50)
);

-- Tạo bảng Group_Member
CREATE TABLE Group_Member (
    member_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    member_name NVARCHAR(50),
    account_id INT NOT NULL,
    bio NVARCHAR(MAX),
    date_of_birth DATE,
    specialist NVARCHAR(50),
    gender NVARCHAR(10),
    experience_years INT,
    status NVARCHAR(50),
    education NVARCHAR(255),
    
    -- Thiết lập khóa ngoại liên kết với bảng Account
    CONSTRAINT FK_GroupMember_Account FOREIGN KEY (account_id) 
    REFERENCES Account(account_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);
-- Tạo bảng Notification
CREATE TABLE Notification (
    notification_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    account_id INT,  -- Khóa ngoại tham chiếu đến Account
    noti_content NVARCHAR(MAX),
    noti_title NVARCHAR(150),
    noti_time DATETIME,
    note NVARCHAR(150),

    -- Thiết lập khóa ngoại liên kết với bảng Account
    CONSTRAINT FK_Notification_Account FOREIGN KEY (account_id) 
    REFERENCES Account(account_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);
-- Tạo bảng Criteria
CREATE TABLE Criteria (
    criteria_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    content NVARCHAR(MAX),
    criteria_point INT
);
-- Tạo bảng PointHistory
CREATE TABLE PointHistory (
    history_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    account_id INT,
    criteria_id INT,
    time DATETIME,

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
    content_report NVARCHAR(MAX),
    attachment NVARCHAR(MAX),
    status NVARCHAR(100),
    report_time DATE,
    criteria_id INT UNIQUE, -- Đảm bảo quan hệ 1-1 với Criteria
	--lưu ý bỏ UNIQUE

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

CREATE TABLE CV (
    CV_id INT IDENTITY(1,1) PRIMARY KEY,
    account_id INT NOT NULL FOREIGN KEY REFERENCES Account(account_id) ON DELETE CASCADE,
    job_position NVARCHAR(200),
    summary NVARCHAR(MAX),
    created_at DATE DEFAULT GETDATE(),
    CV_upload NVARCHAR(MAX)
);

CREATE TABLE Skill (
    Skill_id INT IDENTITY(1,1) PRIMARY KEY,
    skill_name NVARCHAR(100) NOT NULL
);

CREATE TABLE CV_Skill (
    CV_id INT NOT NULL,
    Skill_id INT NOT NULL,
    skill_custom NVARCHAR(200),
    Level_skill NVARCHAR(100),
    PRIMARY KEY (CV_id, Skill_id),
    FOREIGN KEY (CV_id) REFERENCES CV(CV_id) ON DELETE CASCADE,
    FOREIGN KEY (Skill_id) REFERENCES Skill(Skill_id) ON DELETE CASCADE
);

CREATE TABLE School (
    education_id INT IDENTITY(1,1) PRIMARY KEY,
    school_name NVARCHAR(100) NOT NULL
);

CREATE TABLE Certification (
    certification_id INT IDENTITY(1,1) PRIMARY KEY,
    certification_name NVARCHAR(100) NOT NULL
);

CREATE TABLE Company (
    Experience_id INT IDENTITY(1,1) PRIMARY KEY,
    company_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX)
);

CREATE TABLE CV_education (
    CV_id INT NOT NULL,
    education_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    field_of_study NVARCHAR(100),
    degree NVARCHAR(50),
    school_custom NVARCHAR(200),
    PRIMARY KEY (CV_id, education_id),
    FOREIGN KEY (CV_id) REFERENCES CV(CV_id) ON DELETE CASCADE,
    FOREIGN KEY (education_id) REFERENCES School(education_id) ON DELETE CASCADE
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

CREATE TABLE CV_Experience (
    CV_id INT NOT NULL,
    Experience_id INT NOT NULL,
    start_at DATE,
    end_at DATE,
    company_custom NVARCHAR(200),
    job_position NVARCHAR(100),
    address NVARCHAR(100),
    description NVARCHAR(MAX),
    PRIMARY KEY (CV_id, Experience_id),
    FOREIGN KEY (CV_id) REFERENCES CV(CV_id) ON DELETE CASCADE,
    FOREIGN KEY (Experience_id) REFERENCES Company(Experience_id) ON DELETE CASCADE
);

CREATE TABLE Job (
    job_id INT IDENTITY(1,1) PRIMARY KEY,
    job_title NVARCHAR(150) NOT NULL,
    post_date DATE,
    description NVARCHAR(150),
    category_id INT NOT NULL,
    job_tag_id INT NOT NULL,
    is_interviewed BIT,
    budget_max FLOAT,
    budget_min FLOAT,
    due_date DATE,
    status NVARCHAR(100) NOT NULL,
    num_of_mem INT,
    secure_wallet INT,
    is_tested BIT,
    post_account_id INT NOT NULL, -- Thêm khóa ngoại tham chiếu Account

    CONSTRAINT FK_Job_Account FOREIGN KEY (post_account_id) REFERENCES Account(account_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE JobGreeting (
    greeting_id INT IDENTITY(1,1) PRIMARY KEY,
    job_seeker_id INT NOT NULL, -- Thêm khóa ngoại tham chiếu Account
    job_id INT NOT NULL,
    introduction NVARCHAR(MAX),
    attachment NVARCHAR(MAX),
    price INT,
    status NVARCHAR(100),
    expectedDay INT,
    comments NVARCHAR(MAX),
    cv_id INT,

    CONSTRAINT FK_JobGreeting_Account FOREIGN KEY (job_seeker_id) REFERENCES Account(account_id), 

    CONSTRAINT FK_JobGreeting_Job FOREIGN KEY (job_id) REFERENCES Job(job_id)
);
CREATE TABLE Test (
    test_id INT IDENTITY(1,1) PRIMARY KEY,
    start_date DATE,
    due_date DATE,
    account_id INT NOT NULL,
    job_id INT NOT NULL,
    test_record NVARCHAR(MAX),
    link_test NVARCHAR(MAX),

    -- Khóa ngoại tham chiếu đến bảng Account
    CONSTRAINT FK_Test_Account FOREIGN KEY (account_id) REFERENCES Account(account_id) ,

    -- Khóa ngoại tham chiếu đến bảng Job
    CONSTRAINT FK_Test_Job FOREIGN KEY (job_id) REFERENCES Job(job_id) 
);
CREATE TABLE Interview (
    interview_id INT IDENTITY(1,1) PRIMARY KEY,
    start_date DATE,
    interview_link VARCHAR(MAX),
    interview_record VARCHAR(MAX),
    job_id INT NOT NULL,  -- Thêm cột job_id

    -- Thiết lập khóa ngoại tham chiếu đến bảng Job
    CONSTRAINT FK_Interview_Job FOREIGN KEY (job_id) REFERENCES Job(job_id) 
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
    sent_time DATE,
    FOREIGN KEY (job_id) REFERENCES Job(job_id),
    FOREIGN KEY (sender_id) REFERENCES Account(account_id),
    FOREIGN KEY (conversation_id) REFERENCES Conversation(conversation_id)
);
CREATE TABLE Tag (
    tag_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tag_name NVARCHAR(50) NOT NULL,
    description NVARCHAR(100) NOT NULL
);
CREATE TABLE JobTag (
    job_tag_id INT IDENTITY(1,1) NOT NULL ,
    tag_id INT NOT NULL,
    job_tag_name NVARCHAR(50) NOT NULL,
    description NVARCHAR(100) NOT NULL,
    PRIMARY KEY (job_tag_id, tag_id),
    FOREIGN KEY (job_tag_id) REFERENCES Job(job_id),
    FOREIGN KEY (tag_id) REFERENCES Tag(tag_id)
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
ALTER TABLE JobTag
ADD CONSTRAINT PK_JobTag PRIMARY KEY (job_tag_id);

CREATE TABLE JobCategory (
    category_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    category_name NVARCHAR(50) NOT NULL,
    description NVARCHAR(100) NOT NULL,
    job_id INT NOT NULL,
    FOREIGN KEY (job_id) REFERENCES Job(job_id),
);

CREATE TABLE JobReport (
    job_report_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    reported_job_id INT NOT NULL,
    reported_by INT NOT NULL,
    content_report NVARCHAR(MAX),
    attachment NVARCHAR(MAX),
    status NVARCHAR(100),
    criteria_id INT,
    FOREIGN KEY (reported_job_id) REFERENCES Job(job_id) ON DELETE CASCADE,
    FOREIGN KEY (reported_by) REFERENCES Account(account_id)
);



-- Tạo bảng Transaction (đặt tên trong dấu ngoặc vuông)
CREATE TABLE [Transaction] (
    transaction_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    job_id INT NOT NULL,
    amount INT NOT NULL,
    created_date DATETIME,
    transaction_type NVARCHAR(50),
    description NVARCHAR(MAX),
    status BIT,

    -- Thiết lập khóa ngoại
    CONSTRAINT FK_Transaction_Sender FOREIGN KEY (sender_id) 
    REFERENCES Account(account_id),

    CONSTRAINT FK_Transaction_Receiver FOREIGN KEY (receiver_id) 
    REFERENCES Account(account_id) ,

    CONSTRAINT FK_Transaction_Job FOREIGN KEY (job_id) 
    REFERENCES Job(job_id) 
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
ALTER TABLE Account
ADD oauth_provider NVARCHAR(MAX);

ALTER TABLE Account
ADD oauth_id NVARCHAR(MAX);

ALTER TABLE Account
ADD count_member int;

ALTER TABLE Group_Member
ADD avatar_member NVARCHAR(MAX);

ALTER TABLE Group_Member
ADD position NVARCHAR(MAX);


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
    avatar_cv NVARCHAR(MAX)
);
ALTER TABLE CV
ADD name NVARCHAR(100);

CREATE TABLE BackGround_CV (
    CV_id INT NOT NULL,
    backgroundCV NVARCHAR(255),
    PRIMARY KEY (CV_id, backgroundCV),
    FOREIGN KEY (CV_id) REFERENCES CV(CV_id) ON DELETE CASCADE,
);

///// School//////


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


///// Certification/////


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

/////  Company //////


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


//// Skill / /////


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
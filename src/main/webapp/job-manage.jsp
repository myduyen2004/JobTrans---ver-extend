<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lí Công việc &#8211; JobTrans </title>
    <link rel="icon" type="image/png" href="img/logo/logo.png">
    <!DOCTYPE html>
    <html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lí công việc</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@700&family=Roboto:wght@500&display=swap" rel="stylesheet">
        <!-- Font Awesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            /* Enhanced Task Management Styling */
            body {
                background-color: #f5f7fa;
                font-family: 'Roboto', sans-serif;
            }

            .task-container {
                max-width: 800px;
                padding: 30px 25px 40px;
                background-color: white;
                margin-top: 120px;
                border-radius: 16px;
                box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
                animation: fadeIn 0.6s ease;
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .task-title {
                font-family: 'Poppins', sans-serif;
                font-weight: 700;
                font-size: 26px;
                letter-spacing: 0.5px;
                margin-bottom: 30px;
                color: #1a2b5f;
                text-align: center;
                position: relative;
                padding-bottom: 15px;
            }

            .task-title:after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
                width: 60px;
                height: 3px;
                background: linear-gradient(90deg, #6787fe, #9dabff);
                border-radius: 3px;
            }

            .row.justify-content-center {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .task-card {
                background-color: #FFFFFF;
                border-radius: 14px;
                border: 2px solid rgba(103, 135, 254, 0.4);
                margin-bottom: 8px;
                display: flex;
                align-items: center;
                padding: 18px 20px;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                color: inherit;
                box-shadow: 0 3px 12px rgba(103, 135, 254, 0.06);
                position: relative;
                overflow: hidden;
            }

            .task-card::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                width: 5px;
                height: 100%;
                background: linear-gradient(180deg, rgba(103, 135, 254, 0.6), rgba(103, 135, 254, 0.2));
                border-radius: 3px 0 0 3px;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .task-card:hover, .task-card:focus {
                background-color: #f8f9ff;
                border-color: rgba(103, 135, 254, 0.8);
                color: inherit;
                transform: translateY(-3px);
                box-shadow: 0 8px 16px rgba(103, 135, 254, 0.12);
            }

            .task-card:hover::before, .task-card:focus::before {
                opacity: 1;
            }

            .task-card:active {
                transform: translateY(0);
                box-shadow: 0 4px 8px rgba(103, 135, 254, 0.1);
                background-color: #f0f4ff;
            }

            .icon-container {
                width: 48px;
                height: 48px;
                border-radius: 12px;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-right: 18px;
                transition: all 0.3s ease;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.06);
            }

            .task-card:hover .icon-container {
                transform: scale(1.1);
            }

            .contract-icon {
                background-color: rgba(76, 217, 100, 0.15);
                color: #4CD964;
            }

            .ship-icon {
                background-color: rgba(0, 122, 255, 0.15);
                color: #007AFF;
            }

            .chat-icon {
                background-color: rgba(255, 149, 0, 0.15);
                color: #FF9500;
            }

            .partner-icon {
                background-color: rgba(175, 82, 222, 0.15);
                color: #AF52DE;
            }

            .task-card-title {
                font-family: 'Roboto', sans-serif;
                font-weight: 500;
                font-size: 16px;
                color: #333;
                margin: 0;
                transition: all 0.3s ease;
            }

            .task-card:hover .task-card-title {
                transform: translateX(5px);
                color: #1a2b5f;
            }

            .confirm-button {
                background: linear-gradient(to right, #0B1741, #2a3b70);
                border-radius: 25px;
                border: none;
                color: white;
                font-family: 'Roboto', sans-serif;
                font-weight: 500;
                font-size: 16px;
                text-align: center;
                padding: 12px 30px;
                margin: 35px auto 5px;
                display: block;
                min-width: 200px;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 6px 15px rgba(11, 23, 65, 0.2);
                position: relative;
                overflow: hidden;
            }

            .confirm-button::after {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: rgba(255, 255, 255, 0.1);
                transform: rotate(45deg);
                transition: transform 0.6s ease;
                pointer-events: none;
            }

            .confirm-button:hover {
                background: linear-gradient(to right, #152a69, #364b8c);
                box-shadow: 0 8px 20px rgba(11, 23, 65, 0.3);
                transform: translateY(-2px);
            }

            .confirm-button:hover::after {
                transform: rotate(45deg) translate(50%, 50%);
            }

            .confirm-button:active {
                transform: translateY(1px);
                box-shadow: 0 4px 10px rgba(11, 23, 65, 0.25);
            }

            /* Responsive adjustments */
            @media (min-width: 768px) {
                .task-title {
                    font-size: 30px;
                    margin-bottom: 35px;
                }

                .task-card-title {
                    font-size: 18px;
                }

                .confirm-button {
                    font-size: 17px;
                    min-width: 220px;
                }
            }

            @media (max-width: 767px) {
                .task-container {
                    margin-top: 100px;
                    padding: 25px 15px 30px;
                }

                .row.justify-content-center {
                    grid-template-columns: 1fr;
                }

                .task-card {
                    margin-bottom: 15px;
                }
            }
        </style>
</head>
<%@include file="includes/header-02.jsp"%>
<body>
<div class="container task-container">
    <div class="row justify-content-center">
        <div class="col-12">
            <h1 class="task-title">QUẢN LÍ CÔNG VIỆC</h1>
        </div>
    </div>

    <div class="row justify-content-center">
        <!-- First row -->
            <a href="#" class="task-card">
                <div class="icon-container contract-icon">
                    <i class="fas fa-file-contract"></i>
                </div>
                <span class="task-card-title">Xem hợp đồng</span>
            </a>

            <a href="#" class="task-card">
                <div class="icon-container ship-icon">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <span class="task-card-title">Ship Offline</span>
            </a>
            <a href="#" class="task-card">
                <div class="icon-container chat-icon">
                    <i class="fas fa-comment-dots"></i>
                </div>
                <span class="task-card-title">Chat</span>
            </a>
            <a href="#" class="task-card">
                <div class="icon-container partner-icon">
                    <i class="fas fa-user-friends"></i>
                </div>
                <span class="task-card-title">Đối tác</span>
            </a>
    </div>

    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <button class="confirm-button">Xác nhận hoàn thành</button>
        </div>
    </div>
</div>
</body>
</html>

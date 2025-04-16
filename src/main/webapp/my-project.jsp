<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="max-image-preview:large">
    <title>Công việc của tôi – ProLancer</title>

    <style>
        /* Base styles */
        :root {
            --primary-color: #6787FE;
            --primary-dark: #0F1B63;
            --white: #ffffff;
            --black: #000000;
            --border-radius: 30px;
            --box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--black);
        }

        .section-padding {
            padding: 2rem;
        }

        /* Container styles */
        .job-container {
            max-width: 1374px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Card styles */
        .job-card {
            background: var(--white);
            border-radius: var(--border-radius);
            border: 5px solid rgba(103, 135, 254, 0.5);
            padding: 30px 10px;
            display: flex;
            align-items: center;
            position: relative;
            height: fit-content;
        }

        .job-card__image {
            width: 110px;
            height: 110px;
            margin: 0 20px;
            object-fit: cover;
        }

        .job-card__content {
            flex: 1;
        }

        .job-card__title {
            font-size: 36px;
            font-weight: 500;
            margin: 0;
            padding: 10px 0;
        }

        .job-card__button {
            background: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: 20px;
            padding: 12px 20px;
            font-size: 20px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-right: 10px;
        }

        .job-card__button:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: var(--box-shadow);
        }

        /* Responsive adjustments */
        @media (max-width: 1200px) {
            .job-card {
                flex-direction: column;
                text-align: center;
            }

            .job-card__image {
                margin-right: 0;
                margin-bottom: 20px;
            }

            .job-card__button {
                position: static;
                margin-top: 20px;
            }
        }

        @media (max-width: 768px) {
            .job-card__title {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>
<section class="section-padding">
    <div class="job-container">
        <!-- Posted Jobs Card -->
        <div class="job-card">
            <img class="job-card__image" src="https://placehold.co/114x151" alt="Posted jobs icon">
            <div class="job-card__content">
                <h2 class="job-card__title">DANH SÁCH CÔNG VIỆC ĐÃ ĐĂNG</h2>
            </div>
            <button class="job-card__button">Quản lí</button>
        </div>

        <!-- Applied Jobs Card -->
        <div class="job-card">
            <img class="job-card__image" src="https://placehold.co/114x151" alt="Applied jobs icon">
            <div class="job-card__content">
                <h2 class="job-card__title">DANH SÁCH CÔNG VIỆC ĐÃ ỨNG TUYỂN</h2>
            </div>
            <button class="job-card__button">Quản lí</button>
        </div>
    </div>
</section>

<!-- Back to Top Button -->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
</body>
</html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobTrans - Trang chủ</title>
    <link rel="stylesheet" href="css/index.css">
<%--    <style>--%>
<%--        /* Base font style */--%>
<%--        body {--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--        }--%>
<%--        * {--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            box-sizing: border-box;--%>
<%--        }--%>

<%--        body, html {--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            overflow-x: hidden;--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        /* Custom styles */--%>
<%--        .hero-section {--%>
<%--            min-height: 100vh;--%>
<%--            background:--%>
<%--                    url('img/home/background.png') center/cover no-repeat,--%>
<%--                    linear-gradient(310deg, rgba(103, 135, 254, 0.4) 0%, #2B3D9F 50%);--%>
<%--            position: relative;--%>
<%--            overflow: hidden;--%>
<%--        }--%>
<%--        .headline {--%>
<%--            font-weight: 800;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--            color: white;--%>
<%--            font-size: 3.5rem;--%>
<%--            line-height: 1.2;--%>
<%--            margin-left: 70px;--%>
<%--        }--%>

<%--        .subheadline {--%>
<%--            font-weight: 500;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--            color: white;--%>
<%--            font-size: 1.5rem;--%>
<%--            margin-left: 70px;--%>
<%--        }--%>



<%--        /* Search Container Styling */--%>
<%--        .search-container {--%>
<%--            max-width: 800px;--%>
<%--            margin: 5rem 3rem;--%>
<%--            border-radius: 50px;--%>
<%--            overflow: hidden;--%>
<%--            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);--%>
<%--            transition: all 0.3s ease;--%>
<%--            border: 1px solid #eaeaea;--%>
<%--            background: #fff;--%>
<%--        }--%>

<%--        .search-container:hover {--%>
<%--            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);--%>
<%--            transform: translateY(-2px);--%>
<%--        }--%>

<%--        .search-container .row {--%>
<%--            background: #ffffff;--%>
<%--        }--%>

<%--        /* Input Field Styling */--%>
<%--        .search-input {--%>
<%--            height: 60px;--%>
<%--            background: transparent;--%>
<%--            font-size: 16px;--%>
<%--            padding-left: 25px !important;--%>
<%--            color: #333;--%>
<%--            transition: all 0.3s;--%>
<%--            font-weight: 400;--%>
<%--        }--%>

<%--        .search-input:focus {--%>
<%--            outline: none;--%>
<%--            box-shadow: none;--%>
<%--        }--%>

<%--        .search-input::placeholder {--%>
<%--            color: #aab7c4;--%>
<%--            font-weight: 300;--%>
<%--        }--%>

<%--        /* Search Button Styling */--%>
<%--        .search-btn {--%>
<%--            height: 60px;--%>
<%--            border: none;--%>
<%--            background: #6584fa;--%>
<%--            color: white;--%>
<%--            font-weight: 500;--%>
<%--            font-size: 16px;--%>
<%--            cursor: pointer;--%>
<%--            padding: 0 30px;--%>
<%--            border-radius: 30px;--%>
<%--            transition: all 0.3s ease;--%>
<%--            width: 100%;--%>
<%--        }--%>

<%--        .search-btn:hover {--%>
<%--            background: linear-gradient(to right, #152070, #2740b3);--%>
<%--        }--%>

<%--        /* Focus state enhancements */--%>
<%--        .search-container:focus-within {--%>
<%--            border-color: #0f1b63;--%>
<%--        }--%>

<%--        /* Responsive adjustments */--%>
<%--        @media (max-width: 576px) {--%>
<%--            .search-input, .search-btn {--%>
<%--                height: 50px;--%>
<%--            }--%>

<%--            .search-btn {--%>
<%--                font-size: 14px;--%>
<%--                padding: 0 15px;--%>
<%--            }--%>

<%--            .search-container {--%>
<%--                border-radius: 25px;--%>
<%--            }--%>
<%--        }--%>

<%--        /* Media queries */--%>
<%--        @media (max-width: 992px) {--%>
<%--            .headline {--%>
<%--                font-size: 2.5rem;--%>
<%--            }--%>

<%--            .subheadline {--%>
<%--                font-size: 1.2rem;--%>
<%--            }--%>
<%--        }--%>

<%--        @media (max-width: 768px) {--%>
<%--            .featured-image {--%>
<%--                display: none;--%>
<%--            }--%>

<%--            .search-btn {--%>
<%--                padding: 10px 15px;--%>
<%--                font-size: 18px;--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--    <style>--%>
<%--        .feature-text {--%>
<%--            position: absolute;--%>
<%--            color: #1a1a1a;--%>
<%--            font-size: 20px;--%>
<%--            font-weight: 400;--%>
<%--            max-width: 360px;--%>
<%--            line-height: 1.6;--%>
<%--            background-color: rgba(255, 255, 255, 0.85);--%>
<%--            padding: 12px 16px;--%>
<%--            border-radius: 12px;--%>
<%--            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);--%>
<%--        }--%>
<%--        .feature-text {--%>
<%--            font-size: 18px;--%>
<%--            color: #1a1a1a;--%>
<%--            background-color: rgba(255, 255, 255, 0.9);--%>
<%--            padding: 15px;--%>
<%--            border-radius: 12px;--%>
<%--            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);--%>
<%--            font-weight: 400;--%>
<%--            line-height: 1.5;--%>
<%--        }--%>

<%--    </style>--%>
<%--    <style>--%>
<%--        /* Typography */--%>
<%--        .section-title {--%>
<%--            font-weight: 900;--%>
<%--            font-size: 48px;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 1rem;--%>
<%--            margin-top: 3rem;--%>
<%--        }--%>

<%--        .section-subtitle {--%>
<%--            font-weight: 300;--%>
<%--            font-size: 24px;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 3rem;--%>
<%--        }--%>

<%--        /* Job Link Styling */--%>
<%--        .job-link {--%>
<%--            text-decoration: none;--%>
<%--            color: inherit;--%>
<%--            display: block;--%>
<%--        }--%>

<%--        /* Job Card Styling */--%>
<%--        .job-card {--%>
<%--            border-radius: 12px;--%>
<%--            overflow: hidden;--%>
<%--            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);--%>
<%--            margin-bottom: 2rem;--%>
<%--            transition: transform 0.3s ease;--%>
<%--            background-color: #fff;--%>
<%--        }--%>

<%--        .job-link:hover .job-card {--%>
<%--            transform: translateY(-5px);--%>
<%--        }--%>

<%--        .job-card-image {--%>
<%--            height: 200px;--%>
<%--            object-fit: cover;--%>
<%--            width: 100%;--%>
<%--        }--%>

<%--        .job-card-content {--%>
<%--            padding: 1.5rem;--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .job-avatar-wrapper {--%>
<%--            width: 106px;--%>
<%--            height: 106px;--%>
<%--            border-radius: 50%;--%>
<%--            background: white;--%>
<%--            position: absolute;--%>
<%--            top: -53px;--%>
<%--            left: 30px;--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);--%>
<%--        }--%>

<%--        .job-avatar {--%>
<%--            width: 93px;--%>
<%--            height: 93px;--%>
<%--            border-radius: 50%;--%>
<%--            object-fit: cover;--%>
<%--        }--%>

<%--        .job-details {--%>
<%--            margin-top: 60px;--%>
<%--        }--%>

<%--        .job-recruiter {--%>
<%--            color: #767171;--%>
<%--            font-size: 13px;--%>
<%--            font-weight: 700; /* Changed from 500 to 700 for bolder text */--%>
<%--            margin-bottom: 0.25rem;--%>
<%--        }--%>

<%--        .job-deadline {--%>
<%--            color: #6F6D6D;--%>
<%--            font-size: 13px;--%>
<%--            font-weight: 500;--%>
<%--            margin-bottom: 1rem;--%>
<%--        }--%>

<%--        .job-title {--%>
<%--            color: black;--%>
<%--            font-size: 20px;--%>
<%--            font-weight: 700; /* Changed from 500 to 700 for bolder text */--%>
<%--            margin-bottom: 1.5rem;--%>
<%--        }--%>

<%--        .job-meta {--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--            align-items: center;--%>
<%--        }--%>

<%--        .job-category {--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            color: #525252;--%>
<%--            font-size: 14px;--%>
<%--            font-weight: 600; /* Changed from 500 to 600 for somewhat bolder text */--%>
<%--        }--%>

<%--        .category-icon {--%>
<%--            margin-right: 0.5rem;--%>
<%--            width: 24px;--%>
<%--            height: 24px;--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--        }--%>

<%--        .job-salary {--%>
<%--            background: rgba(103, 135, 254, 0.25);--%>
<%--            color: #6787FE;--%>
<%--            padding: 0.5rem 1rem;--%>
<%--            border-radius: 13px;--%>
<%--            font-size: 15px;--%>
<%--            font-weight: 700; /* Changed from 500 to 700 for bolder price */--%>
<%--        }--%>

<%--        /* See More Button */--%>
<%--        .see-more-btn {--%>
<%--            display: block;--%>
<%--            width: 200px;--%>
<%--            margin: 2rem auto 3rem;--%>
<%--            padding: 12px 24px;--%>
<%--            background-color: #6787fe40; /* Light blue background as requested */--%>
<%--            color: #6787FE;--%>
<%--            border: 1px solid #6787FE;--%>
<%--            border-radius: 8px;--%>
<%--            font-weight: 600;--%>
<%--            text-align: center;--%>
<%--            text-decoration: none;--%>
<%--            transition: all 8s ease;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        .see-more-btn:hover {--%>
<%--            background-color: #6787FE;--%>
<%--            color: white;--%>
<%--        }--%>
<%--    </style>--%>

<%--    <style>--%>
<%--        /* Typography */--%>
<%--        .section-heading {--%>
<%--            font-size: 48px;--%>
<%--            font-weight: 900;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 2.5rem;--%>
<%--        }--%>

<%--        /* Category Cards */--%>
<%--        .category-container {--%>
<%--            max-width: 1240px;--%>
<%--            margin: 0 auto;--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .category-card {--%>
<%--            position: relative;--%>
<%--            border-radius: 50px;--%>
<%--            overflow: hidden;--%>
<%--            height: 400px;--%>
<%--            transition: transform 0.3s ease;--%>
<%--            margin: 0 15px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        .category-card:hover {--%>
<%--            transform: translateY(-10px);--%>
<%--        }--%>

<%--        .category-link {--%>
<%--            display: block;--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            text-decoration: none;--%>
<%--        }--%>

<%--        .category-image {--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            object-fit: cover;--%>
<%--            border-radius: 50px;--%>
<%--        }--%>

<%--        .category-overlay {--%>
<%--            position: absolute;--%>
<%--            top: 0;--%>
<%--            left: 0;--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            background-color: rgba(96, 94, 94, 0.33);--%>
<%--            border-radius: 50px;--%>
<%--            display: flex;--%>
<%--            align-items: flex-start;--%>
<%--            justify-content: center;--%>
<%--            padding-top: 32px;--%>
<%--        }--%>

<%--        .category-title {--%>
<%--            color: white;--%>
<%--            font-size: 48px;--%>
<%--            font-weight: 900;--%>
<%--            text-align: center;--%>
<%--        }--%>

<%--        /* Carousel Controls */--%>
<%--        .carousel-control-prev,--%>
<%--        .carousel-control-next {--%>
<%--            width: 50px;--%>
<%--            height: 50px;--%>
<%--            background-color: rgba(0, 0, 0, 0.5);--%>
<%--            border-radius: 50%;--%>
<%--            top: 50%;--%>
<%--            transform: translateY(-50%);--%>
<%--        }--%>

<%--        .carousel-control-prev {--%>
<%--            left: -25px;--%>
<%--        }--%>

<%--        .carousel-control-next {--%>
<%--            right: -25px;--%>
<%--        }--%>

<%--        .carousel-item {--%>
<%--            transition: transform 15s ease-in-out !important;--%>
<%--        }--%>

<%--        /* Custom carousel indicators */--%>
<%--        .carousel-indicators {--%>
<%--            position: static;--%>
<%--            margin-top: 20px;--%>
<%--            margin-bottom: 0;--%>
<%--        }--%>

<%--        .carousel-indicators [data-bs-target] {--%>
<%--            width: 12px;--%>
<%--            height: 12px;--%>
<%--            border-radius: 50%;--%>
<%--            background-color: #ccc;--%>
<%--            opacity: 0.5;--%>
<%--        }--%>

<%--        .carousel-indicators .active {--%>
<%--            background-color: #6787FE;--%>
<%--            opacity: 1;--%>
<%--        }--%>

<%--        /* Media queries */--%>
<%--        @media (max-width: 991px) {--%>
<%--            .category-title {--%>
<%--                font-size: 36px;--%>
<%--            }--%>
<%--        }--%>

<%--        @media (max-width: 767px) {--%>
<%--            .category-card {--%>
<%--                height: 300px;--%>
<%--            }--%>

<%--            .category-title {--%>
<%--                font-size: 28px;--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--    <style>--%>
<%--        /* Custom Styles */--%>
<%--        .section-heading {--%>
<%--            font-weight: 900;--%>
<%--            font-size: 48px;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 20px;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--        }--%>

<%--        .section-subheading {--%>
<%--            font-weight: 700;--%>
<%--            font-size: 48px;--%>
<%--            text-align: center;--%>
<%--            color: white;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--            margin-bottom: 40px;--%>
<%--        }--%>

<%--        .top-members-section {--%>
<%--            background: linear-gradient(211deg, rgba(103, 135, 254, 0) 0%, #0F1B63 100%);--%>
<%--            padding: 40px 0 80px;--%>
<%--        }--%>

<%--        .members-scroll-container {--%>
<%--            display: flex;--%>
<%--            overflow-x: auto;--%>
<%--            padding: 20px 0;--%>
<%--            scroll-behavior: smooth;--%>
<%--            -webkit-overflow-scrolling: touch;--%>
<%--            scrollbar-width: thin;--%>
<%--            scrollbar-color: #0F1B63 rgba(255,255,255,0.2);--%>
<%--            gap: 20px;--%>
<%--        }--%>

<%--        /* Custom scrollbar styling */--%>
<%--        .members-scroll-container::-webkit-scrollbar {--%>
<%--            height: 8px;--%>
<%--        }--%>

<%--        .members-scroll-container::-webkit-scrollbar-track {--%>
<%--            background: rgba(255,255,255,0.2);--%>
<%--            border-radius: 10px;--%>
<%--        }--%>

<%--        .members-scroll-container::-webkit-scrollbar-thumb {--%>
<%--            background-color: #0F1B63;--%>
<%--            border-radius: 10px;--%>
<%--        }--%>

<%--        .member-card-container {--%>
<%--            flex: 0 0 auto;--%>
<%--            width: 340px;--%>
<%--            margin-bottom: 10px;--%>
<%--        }--%>

<%--        .member-card {--%>
<%--            background: white;--%>
<%--            border-radius: 30px;--%>
<%--            padding: 30px;--%>
<%--            height: 100%;--%>
<%--            transition: transform 0.3s;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        .member-card:hover {--%>
<%--            transform: translateY(-10px);--%>
<%--            box-shadow: 0 10px 20px rgba(0,0,0,0.1);--%>
<%--        }--%>

<%--        .member-image {--%>
<%--            width: 100%;--%>
<%--            max-width: 294px;--%>
<%--            height: auto;--%>
<%--            border-radius: 50%;--%>
<%--            margin: 0 auto 20px;--%>
<%--            display: block;--%>
<%--        }--%>


<%--        .member-name {--%>
<%--            font-size: 20px;--%>
<%--            font-weight: 500;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 10px;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--        }--%>

<%--        .member-income {--%>
<%--            font-size: 20px;--%>
<%--            font-weight: 300;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 10px;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--        }--%>

<%--        .member-reputation {--%>
<%--            font-size: 20px;--%>
<%--            font-weight: 500;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 15px;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--        }--%>

<%--        .member-details {--%>
<%--            display: flex;--%>
<%--            justify-content: space-between;--%>
<%--            margin-top: 20px;--%>
<%--        }--%>

<%--        .member-role, .member-location {--%>
<%--            font-size: 15px;--%>
<%--            color: #555050;--%>
<%--            font-weight: 300;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--        }--%>
<%--        .scroll-indicator {--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 20px;--%>
<%--            color: white;--%>
<%--            font-weight: 500;--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--            gap: 10px;--%>
<%--        }--%>

<%--        .scroll-arrow {--%>
<%--            font-size: 24px;--%>
<%--            animation: bounce 1.5s infinite;--%>
<%--        }--%>

<%--        @keyframes bounce {--%>
<%--            0%, 20%, 50%, 80%, 100% {--%>
<%--                transform: translateX(0);--%>
<%--            }--%>
<%--            40% {--%>
<%--                transform: translateX(10px);--%>
<%--            }--%>
<%--            60% {--%>
<%--                transform: translateX(5px);--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--    <style>--%>
<%--        /* Custom Styles */--%>
<%--        .section-heading {--%>
<%--            font-weight: 900;--%>
<%--            font-size: 48px;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 20px;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--        }--%>

<%--        .section-subheading {--%>
<%--            font-weight: 700;--%>
<%--            font-size: 48px;--%>
<%--            text-align: center;--%>
<%--            color: white;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--            margin-bottom: 40px;--%>
<%--        }--%>

<%--        .top-members-section {--%>
<%--            background: linear-gradient(211deg, rgba(103, 135, 254, 0) 0%, #0F1B63 100%);--%>
<%--            padding: 40px 0 80px;--%>
<%--        }--%>

<%--        /* Cải thiện hiệu ứng trượt mượt mà cho container */--%>
<%--        .members-scroll-container {--%>
<%--            display: flex;--%>
<%--            overflow-x: auto;--%>
<%--            padding: 20px 0;--%>
<%--            scroll-behavior: smooth;--%>
<%--            -webkit-overflow-scrolling: touch;--%>
<%--            gap: 20px;--%>
<%--            scroll-snap-type: x mandatory;--%>
<%--            scroll-padding: 20px;--%>
<%--            padding-left: 20px;--%>
<%--            padding-right: 20px;--%>
<%--            margin-left: -20px;--%>
<%--            margin-right: -20px;--%>

<%--            /* Hiệu ứng mask hai bên */--%>
<%--            -webkit-mask-image: -webkit-linear-gradient(left, transparent 0%, black 5%, black 95%, transparent 100%);--%>
<%--            -webkit-mask-repeat: no-repeat;--%>
<%--            -webkit-mask-size: 100% 100%;--%>

<%--            mask-image: linear-gradient(to right, transparent 0%, black 5%, black 95%, transparent 100%);--%>
<%--            mask-repeat: no-repeat;--%>
<%--            mask-size: 100% 100%;--%>

<%--            /* Ẩn scrollbar */--%>
<%--            scrollbar-width: none;              /* Firefox */--%>
<%--            -ms-overflow-style: none;           /* IE 10+ */--%>
<%--        }--%>

<%--        .members-scroll-container::-webkit-scrollbar {--%>
<%--            display: none;                      /* Chrome, Safari */--%>
<%--        }--%>


<%--        /* Cải thiện hiệu ứng snap cho từng card */--%>
<%--        .member-card-container {--%>
<%--            flex: 0 0 auto;--%>
<%--            width: 340px;--%>
<%--            margin-bottom: 10px;--%>
<%--            scroll-snap-align: center;--%>
<%--            padding: 10px 0;--%>
<%--        }--%>

<%--        /* Thêm hiệu ứng chuyển động mượt mà cho card */--%>
<%--        .member-card {--%>
<%--            background: white;--%>
<%--            border-radius: 30px;--%>
<%--            padding: 30px;--%>
<%--            height: 100%;--%>
<%--            transition: all 0.35s cubic-bezier(0.25, 0.46, 0.45, 0.94);--%>
<%--            cursor: pointer;--%>
<%--            will-change: transform;--%>
<%--        }--%>

<%--        /* Cải thiện hiệu ứng hover để mượt mà hơn */--%>
<%--        .member-card:hover {--%>
<%--            transform: translateY(-10px) scale(1.02);--%>
<%--            box-shadow: 0 15px 30px rgba(15, 27, 99, 0.15);--%>
<%--        }--%>

<%--        /* Cải thiện hiệu ứng thanh cuộn */--%>
<%--        .members-scroll-container::-webkit-scrollbar {--%>
<%--            height: 8px;--%>
<%--            background: rgba(255,255,255,0.2);--%>
<%--            border-radius: 10px;--%>
<%--        }--%>

<%--        .members-scroll-container::-webkit-scrollbar-thumb {--%>
<%--            background-color: #0F1B63;--%>
<%--            border-radius: 10px;--%>
<%--            border: 2px solid rgba(255,255,255,0.2);--%>
<%--        }--%>

<%--        /* Tăng khả năng tương tác với hiệu ứng hover trên thanh cuộn */--%>
<%--        .members-scroll-container::-webkit-scrollbar-thumb:hover {--%>
<%--            background-color: #192b8d;--%>
<%--        }--%>

<%--        /* Cải thiện hiệu ứng chỉ dẫn cuộn */--%>
<%--        .scroll-indicator {--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 25px;--%>
<%--            color: white;--%>
<%--            font-weight: 500;--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--            gap: 10px;--%>
<%--            opacity: 0.8;--%>
<%--            transition: opacity 0.3s ease;--%>
<%--        }--%>

<%--        .scroll-indicator:hover {--%>
<%--            opacity: 1;--%>
<%--        }--%>

<%--        /* Hiệu ứng mũi tên mượt mà hơn */--%>
<%--        .scroll-arrow {--%>
<%--            font-size: 24px;--%>
<%--            animation: bounce 2s infinite ease-in-out;--%>
<%--        }--%>
<%--        /* Kiểu cho badge xác minh */--%>
<%--        .verified-badge {--%>
<%--            display: inline-flex;--%>
<%--            margin-left: 8px;--%>
<%--            vertical-align: middle;--%>
<%--        }--%>

<%--        /* Kiểu cho icons */--%>
<%--        .role-icon, .location-icon {--%>
<%--            display: inline-flex;--%>
<%--            align-items: center;--%>
<%--            margin-right: 8px;--%>
<%--            opacity: 0.7;--%>
<%--        }--%>

<%--        /* Kiểu cho container sao đánh giá */--%>
<%--        .rating-stars {--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--            margin: 10px 0;--%>
<%--        }--%>


<%--        @keyframes bounce {--%>
<%--            0%, 20%, 50%, 80%, 100% {--%>
<%--                transform: translateX(0);--%>
<%--            }--%>
<%--            40% {--%>
<%--                transform: translateX(12px);--%>
<%--            }--%>
<%--            60% {--%>
<%--                transform: translateX(6px);--%>
<%--            }--%>
<%--        }--%>

<%--        /* Thêm tương tác khi click để cuộn tự động */--%>
<%--        @media (min-width: 768px) {--%>
<%--            .top-members-section {--%>
<%--                position: relative;--%>
<%--            }--%>

<%--            .scroll-left-btn, .scroll-right-btn {--%>
<%--                position: absolute;--%>
<%--                top: 50%;--%>
<%--                transform: translateY(-50%);--%>
<%--                background: rgba(15, 27, 99, 0.7);--%>
<%--                color: white;--%>
<%--                border: none;--%>
<%--                border-radius: 50%;--%>
<%--                width: 40px;--%>
<%--                height: 40px;--%>
<%--                display: flex;--%>
<%--                align-items: center;--%>
<%--                justify-content: center;--%>
<%--                cursor: pointer;--%>
<%--                z-index: 2;--%>
<%--                transition: all 0.3s ease;--%>
<%--            }--%>

<%--            .scroll-left-btn {--%>
<%--                left: 20px;--%>
<%--            }--%>

<%--            .scroll-right-btn {--%>
<%--                right: 20px;--%>
<%--            }--%>

<%--            .scroll-left-btn:hover, .scroll-right-btn:hover {--%>
<%--                background: rgba(15, 27, 99, 1);--%>
<%--                transform: translateY(-50%) scale(1.1);--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--    <style>--%>
<%--        /* Custom styles */--%>
<%--        .stats-section {--%>
<%--            position: relative;--%>
<%--            padding: 80px 0;--%>
<%--        }--%>

<%--        .stats-number {--%>
<%--            font-size: 36px;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--            font-weight: 900;--%>
<%--            color: #000;--%>
<%--            margin-bottom: 5px;--%>
<%--            line-height: 1.2;--%>
<%--        }--%>

<%--        .stats-label {--%>
<%--            font-size: 24px;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--            font-weight: 300;--%>
<%--            color: #000;--%>
<%--        }--%>

<%--        .circle {--%>
<%--            width: 110px;--%>
<%--            height: 110px;--%>
<%--            border-radius: 50%;--%>
<%--            display: flex;--%>
<%--            justify-content: center;--%>
<%--            align-items: center;--%>
<%--            font-size: 28px;--%>
<%--            background-color: #eee; /* default fallback */--%>
<%--            object-fit: contain;--%>
<%--            margin-bottom: 10px;--%>
<%--            margin-left: 150px;--%>
<%--        }--%>

<%--        .purple {--%>
<%--            background-color: rgba(164, 116, 244, 0.1); /* nền tím nhạt */--%>
<%--            color: #a474f4;--%>
<%--        }--%>

<%--        .green {--%>
<%--            background-color: rgba(30, 187, 115, 0.1); /* nền xanh lá nhạt */--%>
<%--            color: #1ebb73;--%>
<%--        }--%>

<%--        .orange {--%>
<%--            background-color: rgba(255, 167, 38, 0.1); /* nền cam nhạt */--%>
<%--            color: #ffa726;--%>
<%--        }--%>

<%--        /* Animation for counter */--%>
<%--        @keyframes countUp {--%>
<%--            from {--%>
<%--                opacity: 0;--%>
<%--                transform: translateY(20px);--%>
<%--            }--%>
<%--            to {--%>
<%--                opacity: 1;--%>
<%--                transform: translateY(0);--%>
<%--            }--%>
<%--        }--%>
<%--        @media (max-width: 768px) {--%>
<%--            .stats-number {--%>
<%--                font-size: 28px;--%>
<%--            }--%>

<%--            .stats-label {--%>
<%--                font-size: 18px;--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--    <style>--%>
<%--        .main-heading {--%>
<%--            font-size: 50px;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--            font-weight: 600;--%>
<%--            color: black;--%>
<%--        }--%>
<%--        .custom-btn {--%>
<%--            background-color: #6787FE;--%>
<%--            border: none;--%>
<%--            font-size: 28px;--%>
<%--            font-family: 'Inter', sans-serif;--%>
<%--            font-weight: 600;--%>
<%--            color: #fff;--%>
<%--            padding: 12px 28px;--%>
<%--            border-radius: 25px;--%>
<%--            transition: background-color 0.3s ease, transform 0.2s ease;--%>
<%--        }--%>

<%--        .custom-btn:hover {--%>
<%--            background-color: #506bd6;--%>
<%--            transform: scale(1.03);--%>
<%--            box-shadow: 0 6px 14px rgba(103, 135, 254, 0.6);--%>
<%--        }--%>

<%--    </style>--%>

</head>

<body>
<%@include file="includes/header.jsp"%>
    <div class="hero-section" style="margin-top: 15px">
        <div class="container-fluid">
            <!-- Content -->
            <div class="row align-items-center mt-5">
                <div class="col-lg-7 col-md-12 ps-md-5 pe-md-4 text-center text-md-start">
                    <h1 class="headline mb-4">Nhận việc mới dễ dàng<br> – Bắt đầu ngay hôm nay!</h1>
                    <p class="subheadline mb-5">Làm việc cùng nhân tài với chi phí tối ưu – Tiết kiệm thời gian, tối đa hiệu quả!</p>

                    <!-- Search Form -->
                    <div class="search-container mb-5">
                        <div class="row g-0 align-items-center">
                            <div class="col-8 col-md-9">
                                <input type="text" class="search-input form-control form-control-lg border-0 ps-4" placeholder="Tìm kiếm .....">
                            </div>
                            <div class="col-4 col-md-3 text-end">
                                <button class="search-btn">Tìm kiếm</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-5 d-none d-lg-block text-center">
                    <img src="img/home/01.png" alt="Featured image" class="img-fluid featured-image">
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container py-5">
            <div class="row text-center gy-5">

                <div class="col-md-4">
                    <img src="img/home/2.jpg" class="img-fluid rounded shadow mb-3" alt="Icon 1">
                    <p class="feature-text">
                        Giao dịch đáng tin cậy – Cam kết chất lượng, hiệu quả bền vững, bình đẳng
                    </p>
                </div>

                <div class="col-md-4">
                    <img src="img/home/3.jpg" class="img-fluid rounded shadow mb-3" alt="Icon 2">
                    <p class="feature-text">
                        Dữ liệu bảo mật – An toàn tuyệt đối, yên tâm sử dụng
                    </p>
                </div>

                <div class="col-md-4">
                    <img src="img/home/4.jpg" class="img-fluid rounded shadow mb-3" alt="Icon 3">
                    <p class="feature-text">
                        Đa dạng các mẫu CV để tạo nhanh linh hoạt
                    </p>
                </div>

            </div>
        </div>
        <div class="container my-5" style="padding-top: 10px">
            <!-- Section Header -->
            <header class="mb-5">
                <h1 style="font-family: Inter, sans-serif" class="section-title">CÔNG VIỆC PHỔ BIẾN</h1>
                <p class="section-subtitle">Các công việc phổ biến được ưa chuộng nhất với cơ hội nghề nghiệp phù hợp cho bạn</p>
            </header>

            <!-- Job Listings Grid -->
            <div class="row">
                <!-- Job Card 1 -->
                <div class="col-md-6 col-lg-4">
                    <a href="/job-detail/1" class="job-link">
                        <div class="job-card">
                            <img src="img/home/job-01.jpg" alt="Job image" class="job-card-image">
                            <div class="job-card-content">
                                <div class="job-avatar-wrapper">
                                    <img src="img/home/recruiter.jpg" alt="Recruiter" class="job-avatar">
                                </div>
                                <div class="job-details">
                                    <p class="job-recruiter">Bayley Robertson</p>
                                    <p class="job-deadline">Hạn tuyển: 20-02-2020</p>
                                    <h2 class="job-title">Cần Gấp Lập Trình Viên Freelancer (Java/PHP) – Hỗ trợ từ xa</h2>
                                    <div class="job-meta">
                                        <div class="job-category">
                                            <div class="category-icon">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="#B3B3B3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </div>
                                            <span>Công nghệ & IT</span>
                                        </div>
                                        <div class="job-salary">2tr5 - 5tr</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Job Card 2 -->
                <div class="col-md-6 col-lg-4">
                    <a href="/job-detail/2" class="job-link">
                        <div class="job-card">
                            <img src="img/home/job-02.jpg" alt="Job image" class="job-card-image">
                            <div class="job-card-content">
                                <div class="job-avatar-wrapper">
                                    <img src="img/home/recruiter.jpg" alt="Recruiter" class="job-avatar">
                                </div>
                                <div class="job-details">
                                    <p class="job-recruiter">Bayley Robertson</p>
                                    <p class="job-deadline">Hạn tuyển: 20-02-2020</p>
                                    <h2 class="job-title">Cần Gấp Lập Trình Viên Freelancer (Java/PHP) – Hỗ trợ từ xa</h2>
                                    <div class="job-meta">
                                        <div class="job-category">
                                            <div class="category-icon">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="#B3B3B3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </div>
                                            <span>Công nghệ & IT</span>
                                        </div>
                                        <div class="job-salary">2tr5 - 5tr</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Job Card 3 -->
                <div class="col-md-6 col-lg-4">
                    <a href="/job-detail/3" class="job-link">
                        <div class="job-card">
                            <img src="img/home/job-02.jpg" alt="Job image" class="job-card-image">
                            <div class="job-card-content">
                                <div class="job-avatar-wrapper">
                                    <img src="img/home/recruiter.jpg" alt="Recruiter" class="job-avatar">
                                </div>
                                <div class="job-details">
                                    <p class="job-recruiter">Bayley Robertson</p>
                                    <p class="job-deadline">Hạn tuyển: 20-02-2020</p>
                                    <h2 class="job-title">Cần Gấp Lập Trình Viên Freelancer (Java/PHP) – Hỗ trợ từ xa</h2>
                                    <div class="job-meta">
                                        <div class="job-category">
                                            <div class="category-icon">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="#B3B3B3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </div>
                                            <span>Công nghệ & IT</span>
                                        </div>
                                        <div class="job-salary">2tr5 - 5tr</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Job Card 4 -->
                <div class="col-md-6 col-lg-4">
                    <a href="/job-detail/4" class="job-link">
                        <div class="job-card">
                            <img src="img/home/job-04.jpg" alt="Job image" class="job-card-image">
                            <div class="job-card-content">
                                <div class="job-avatar-wrapper">
                                    <img src="img/home/recruiter.jpg" alt="Recruiter" class="job-avatar">
                                </div>
                                <div class="job-details">
                                    <p class="job-recruiter">Bayley Robertson</p>
                                    <p class="job-deadline">Hạn tuyển: 20-02-2020</p>
                                    <h2 class="job-title">Cần Gấp Lập Trình Viên Freelancer (Java/PHP) – Hỗ trợ từ xa</h2>
                                    <div class="job-meta">
                                        <div class="job-category">
                                            <div class="category-icon">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="#B3B3B3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </div>
                                            <span>Công nghệ & IT</span>
                                        </div>
                                        <div class="job-salary">2tr5 - 5tr</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Job Card 5 -->
                <div class="col-md-6 col-lg-4">
                    <a href="/job-detail/5" class="job-link">
                        <div class="job-card">
                            <img src="img/home/job-05.jpg" alt="Job image" class="job-card-image">
                            <div class="job-card-content">
                                <div class="job-avatar-wrapper">
                                    <img src="img/home/recruiter.jpg" alt="Recruiter" class="job-avatar">
                                </div>
                                <div class="job-details">
                                    <p class="job-recruiter">Bayley Robertson</p>
                                    <p class="job-deadline">Hạn tuyển: 20-02-2020</p>
                                    <h2 class="job-title">Cần Gấp Lập Trình Viên Freelancer (Java/PHP) – Hỗ trợ từ xa</h2>
                                    <div class="job-meta">
                                        <div class="job-category">
                                            <div class="category-icon">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="#B3B3B3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </div>
                                            <span>Công nghệ & IT</span>
                                        </div>
                                        <div class="job-salary">2tr5 - 5tr</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Job Card 6 -->
                <div class="col-md-6 col-lg-4">
                    <a href="/job-detail/6" class="job-link">
                        <div class="job-card">
                            <img src="img/home/job-06.jpg" alt="Job image" class="job-card-image">
                            <div class="job-card-content">
                                <div class="job-avatar-wrapper">
                                    <img src="img/home/recruiter.jpg" alt="Recruiter" class="job-avatar">
                                </div>
                                <div class="job-details">
                                    <p class="job-recruiter">Bayley Robertson</p>
                                    <p class="job-deadline">Hạn tuyển: 20-02-2020</p>
                                    <h2 class="job-title">Cần Gấp Lập Trình Viên Freelancer (Java/PHP) – Hỗ trợ từ xa</h2>
                                    <div class="job-meta">
                                        <div class="job-category">
                                            <div class="category-icon">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="#B3B3B3" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </div>
                                            <span>Công nghệ & IT</span>
                                        </div>
                                        <div class="job-salary">2tr5 - 5tr</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="text-center">
                <a href="/all-jobs" class="see-more-btn">Xem thêm</a>
            </div>
        </div>



        <div class="container my-5">
            <!-- Section Header -->
            <h2 class="section-heading">DANH MỤC</h2>

            <!-- Category Carousel -->
            <div class="category-container">
                <div id="categoryCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
                    <!-- Carousel Indicators -->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#categoryCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#categoryCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    </div>

                    <!-- Carousel Items -->
                    <div class="carousel-inner">
                        <!-- First Slide - 3 categories -->
                        <div class="carousel-item active">
                            <div class="row">
                                <!-- Marketing Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="/marketing" class="category-link">
                                            <img src="img/home/cat-01.jpg" alt="Marketing" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Marketing</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <!-- IT Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="/cong-nghe-it" class="category-link">
                                            <img src="img/home/cat-06.jpg" alt="Công nghệ & IT" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Công nghệ & IT</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <!-- Design Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="/design" class="category-link">
                                            <img src="img/home/cat-02.jpg" alt="Design" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Design</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Second Slide - 3 categories -->
                        <div class="carousel-item">
                            <div class="row">
                                <!-- Translation Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="/dich-thuat" class="category-link">
                                            <img src="img/home/cat-03.jpg" alt="Dịch thuật" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Dịch thuật</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <!-- Coaching Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="/tu-van-coaching" class="category-link">
                                            <img src="img/home/cat-04.jpg" alt="Tư vấn, Coaching" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Tư vấn, Coaching</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>

                                <!-- Other Category -->
                                <div class="col-md-4">
                                    <div class="category-card">
                                        <a href="/khac" class="category-link">
                                            <img src="img/home/cat-05.jpg" alt="Khác" class="category-image">
                                            <div class="category-overlay">
                                                <h3 class="category-title">Khác</h3>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Carousel Controls -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#categoryCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#categoryCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="container-fluid mt-5" style="padding-top: 10px">
            <h2 class="section-heading">THÀNH VIÊN UY TÍN</h2>
        </div>
        <section class="top-members-section" style="padding-top: 10px">
            <div class="container position-relative">
                <h3 class="section-subheading">TOP 5</h3>

                <div class="scroll-indicator">
                    <span>Kéo sang để xem thêm</span>
                    <span class="scroll-arrow">→</span>
                </div>
                <button class="scroll-left-btn">←</button>
                <button class="scroll-right-btn">→</button>

                <div class="members-scroll-container">
                    <!-- Member 1 -->
                    <div class="member-card-container">
                        <a href="member-detail.html" class="text-decoration-none">
                            <div class="member-card position-relative">
                                <img src="img/home/user-demo.jpg" alt="Harry Olson" class="member-image">
                                <div class="member-info">
                                    <h4 class="member-name">
                                        Harry Olson
                                        <span class="verified-badge">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                    <circle cx="12" cy="12" r="11" fill="#1DA1F2"/>
                    <path d="M9.6 16.2l-4.2-4.2 1.4-1.4 2.8 2.8 7.8-7.8 1.4 1.4-9.2 9.2z" fill="white"/>
                </svg>
            </span>
                                    </h4>
                                    <p class="member-income">Thu nhập: 4x.xxx.xxx VNĐ</p>
                                    <p class="member-reputation">Điểm uy tín: 380 điểm</p>

                                    <!-- Hiển thị sao dựa trên điểm uy tín -->
                                    <div class="rating-stars" data-rating="4.5"></div>

                                    <div class="member-details">
                                        <div class="member-role">
                <span class="role-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                    </svg>
                </span>
                                            Lập trình viên
                                        </div>
                                        <div class="member-location">
                <span class="location-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                </span>
                                            Hà Nội
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!-- Member 2 -->
                    <div class="member-card-container">
                        <a href="member-detail.html" class="text-decoration-none">
                            <div class="member-card position-relative">
                                <img src="img/home/user-demo.jpg" alt="Harry Olson" class="member-image">
                                <div class="member-info">
                                    <h4 class="member-name">
                                        Harry Olson
                                        <span class="verified-badge">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                    <circle cx="12" cy="12" r="11" fill="#1DA1F2"/>
                    <path d="M9.6 16.2l-4.2-4.2 1.4-1.4 2.8 2.8 7.8-7.8 1.4 1.4-9.2 9.2z" fill="white"/>
                </svg>
            </span>
                                    </h4>
                                    <p class="member-income">Thu nhập: 4x.xxx.xxx VNĐ</p>
                                    <p class="member-reputation">Điểm uy tín: 380 điểm</p>

                                    <!-- Hiển thị sao dựa trên điểm uy tín -->
                                    <div class="rating-stars" data-rating="4.5"></div>

                                    <div class="member-details">
                                        <div class="member-role">
                <span class="role-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                    </svg>
                </span>
                                            Lập trình viên
                                        </div>
                                        <div class="member-location">
                <span class="location-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                </span>
                                            Hà Nội
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!-- Member 3 -->
                    <div class="member-card-container">
                        <a href="member-detail.html" class="text-decoration-none">
                            <div class="member-card position-relative">
                                <img src="img/home/user-demo.jpg" alt="Harry Olson" class="member-image">
                                <div class="member-info">
                                    <h4 class="member-name">
                                        Harry Olson
                                        <span class="verified-badge">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                    <circle cx="12" cy="12" r="11" fill="#1DA1F2"/>
                    <path d="M9.6 16.2l-4.2-4.2 1.4-1.4 2.8 2.8 7.8-7.8 1.4 1.4-9.2 9.2z" fill="white"/>
                </svg>
            </span>
                                    </h4>
                                    <p class="member-income">Thu nhập: 4x.xxx.xxx VNĐ</p>
                                    <p class="member-reputation">Điểm uy tín: 380 điểm</p>

                                    <!-- Hiển thị sao dựa trên điểm uy tín -->
                                    <div class="rating-stars" data-rating="4.5"></div>

                                    <div class="member-details">
                                        <div class="member-role">
                <span class="role-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                    </svg>
                </span>
                                            Lập trình viên
                                        </div>
                                        <div class="member-location">
                <span class="location-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                </span>
                                            Hà Nội
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!-- Member 4 -->
                    <div class="member-card-container">
                        <a href="member-detail.html" class="text-decoration-none">
                            <div class="member-card position-relative">
                                <img src="img/home/user-demo.jpg" alt="Harry Olson" class="member-image">
                                <div class="member-info">
                                    <h4 class="member-name">
                                        Harry Olson
                                        <span class="verified-badge">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                    <circle cx="12" cy="12" r="11" fill="#1DA1F2"/>
                    <path d="M9.6 16.2l-4.2-4.2 1.4-1.4 2.8 2.8 7.8-7.8 1.4 1.4-9.2 9.2z" fill="white"/>
                </svg>
            </span>
                                    </h4>
                                    <p class="member-income">Thu nhập: 4x.xxx.xxx VNĐ</p>
                                    <p class="member-reputation">Điểm uy tín: 380 điểm</p>

                                    <!-- Hiển thị sao dựa trên điểm uy tín -->
                                    <div class="rating-stars" data-rating="4.5"></div>

                                    <div class="member-details">
                                        <div class="member-role">
                <span class="role-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                    </svg>
                </span>
                                            Lập trình viên
                                        </div>
                                        <div class="member-location">
                <span class="location-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                </span>
                                            Hà Nội
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!-- Member 5 -->
                    <div class="member-card-container">
                        <a href="member-detail.html" class="text-decoration-none">
                            <div class="member-card position-relative">
                                <img src="img/home/user-demo.jpg" alt="Harry Olson" class="member-image">
                                <div class="member-info">
                                    <h4 class="member-name">
                                        Harry Olson
                                        <span class="verified-badge">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18">
                    <circle cx="12" cy="12" r="11" fill="#1DA1F2"/>
                    <path d="M9.6 16.2l-4.2-4.2 1.4-1.4 2.8 2.8 7.8-7.8 1.4 1.4-9.2 9.2z" fill="white"/>
                </svg>
            </span>
                                    </h4>
                                    <p class="member-income">Thu nhập: 4x.xxx.xxx VNĐ</p>
                                    <p class="member-reputation">Điểm uy tín: 380 điểm</p>

                                    <!-- Hiển thị sao dựa trên điểm uy tín -->
                                    <div class="rating-stars" data-rating="4.5"></div>

                                    <div class="member-details">
                                        <div class="member-role">
                <span class="role-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                    </svg>
                </span>
                                            Lập trình viên
                                        </div>
                                        <div class="member-location">
                <span class="location-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="#6c757d">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                </span>
                                            Hà Nội
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="text-center">
                    <a href="home?action=top100" class="see-more-btn">Xem thêm</a>
                </div>
            </div>
        </section>
        <section class="stats-section">
            <div class="container">
                <div class="row justify-content-center">
                    <!-- Jobs Stats -->
                    <div class="col-md-4 col-sm-6 text-center mb-4" style="text-align: center">
                        <div >
                        <div class="circle purple"><i class="fas fa-user"></i></div>
                            <div>
                            <div class="stats-number">
                                <span class="counter" data-target="5000">0</span>
                            </div>
                            <div class="stats-label">Người dùng</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6 text-center mb-4">
                        <div class="circle green"><i class="fas fa-file-alt"></i></div>
                        <div class="stats-number">
                            <span class="counter" data-target="13000">0</span>
                        </div>
                        <div class="stats-label">Công việc</div>
                    </div>

                    <!-- CV Stats -->
                    <div class="col-md-4 col-sm-6 text-center mb-4">
                        <div class="circle orange"><i class="fas fa-star"></i></div>
                        <div class="stats-number">
                            <span class="counter" data-target="5000">0</span>
                        </div>
                        <div class="stats-label">CV</div>
                    </div>
                </div>
            </div>
        </section>

        <div class="container my-5">
            <div class="row align-items-center justify-content-between">
                <!-- Phần nội dung bên trái -->
                <div class="col-12 col-md-6 mb-4 mb-md-0">
                    <h2 class="main-heading mb-4">
                        Tìm kiếm cộng sự phù hợp để làm việc cùng bạn
                    </h2>
                    <div class="custom-button-wrapper">
                        <button class="btn custom-btn" style="background: #6787fe; color: whitesmoke">
                            Bắt đầu đăng công việc
                        </button>
                    </div>
                </div>

                <!-- Phần ảnh bên phải -->
                <div class="col-12 col-md-5 text-center">
                    <img src="img/home/01.png" alt="Cộng sự" class="img-fluid custom-img" />
                </div>
            </div>
        </div>

        <%@include file="includes/footer.jsp"%>

</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const scrollContainer = document.querySelector('.members-scroll-container');
        const scrollLeftBtn = document.querySelector('.scroll-left-btn');
        const scrollRightBtn = document.querySelector('.scroll-right-btn');

        if (scrollLeftBtn && scrollRightBtn && scrollContainer) {
            // Ẩn nút trái khi ở đầu
            scrollContainer.addEventListener('scroll', function() {
                if (scrollContainer.scrollLeft <= 10) {
                    scrollLeftBtn.style.opacity = '0.5';
                } else {
                    scrollLeftBtn.style.opacity = '1';
                }

                if (scrollContainer.scrollLeft + scrollContainer.clientWidth >= scrollContainer.scrollWidth - 10) {
                    scrollRightBtn.style.opacity = '0.5';
                } else {
                    scrollRightBtn.style.opacity = '1';
                }
            });

            // Xử lý sự kiện click nút
            scrollLeftBtn.addEventListener('click', function() {
                scrollContainer.scrollBy({
                    left: -340,
                    behavior: 'smooth'
                });
            });

            scrollRightBtn.addEventListener('click', function() {
                scrollContainer.scrollBy({
                    left: 340,
                    behavior: 'smooth'
                });
            });
        }
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Hàm tạo sao dựa trên điểm đánh giá
        function createStars(containerElement) {
            const rating = parseFloat(containerElement.getAttribute('data-rating')) || 0;
            const starCount = 5; // Tổng số sao

            containerElement.innerHTML = ''; // Xóa nội dung hiện tại

            for (let i = 1; i <= starCount; i++) {
                const star = document.createElement('span');
                star.classList.add('star');

                if (i <= rating) {
                    // Sao đầy đủ
                    star.classList.add('star-full');
                    star.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
        </svg>`;
                } else if (i - 0.5 <= rating) {
                    // Nửa sao
                    star.classList.add('star-half');
                    star.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
        </svg>`;
                } else {
                    // Sao trống
                    star.classList.add('star-empty');
                    star.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
        </svg>`;
                }

                containerElement.appendChild(star);
            }
        }

        // Chuyển đổi điểm uy tín thành thang điểm 5 sao
        function convertPointsToRating(points) {
            // Giả sử điểm tối đa là 500, bạn có thể điều chỉnh thang điểm này
            const maxPoints = 500;
            return Math.min(5, (points / maxPoints) * 5);
        }

        // Áp dụng cho tất cả thẻ thành viên
        document.querySelectorAll('.member-card').forEach(card => {
            const pointsElement = card.querySelector('.member-reputation');
            if (pointsElement) {
                // Trích xuất số điểm từ văn bản (ví dụ: "Điểm uy tín: 380 điểm")
                const pointsText = pointsElement.textContent;
                const pointsMatch = pointsText.match(/(\d+)/);

                if (pointsMatch && pointsMatch[1]) {
                    const points = parseInt(pointsMatch[1], 10);
                    const rating = convertPointsToRating(points);

                    // Tạo container đánh giá sao nếu chưa có
                    let ratingContainer = card.querySelector('.rating-stars');
                    if (!ratingContainer) {
                        ratingContainer = document.createElement('div');
                        ratingContainer.classList.add('rating-stars');
                        pointsElement.after(ratingContainer);
                    }

                    // Đặt điểm đánh giá và tạo các sao
                    ratingContainer.setAttribute('data-rating', rating.toFixed(1));
                    createStars(ratingContainer);
                }
            }
        });
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Counter animation function
        function animateCounter(element, target) {
            let current = 0;
            const increment = Math.ceil(target / 50); // Adjust speed by changing the divisor
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    element.textContent = new Intl.NumberFormat('vi-VN').format(target);
                    clearInterval(timer);

                    // Add animation class
                    element.classList.add('animated-number');

                    // Optional: Reset and restart animation after delay
                    setTimeout(() => {
                        element.classList.remove('animated-number');
                        restartCounter(element, target);
                    }, 5000); // Wait 5 seconds before restarting
                } else {
                    element.textContent = new Intl.NumberFormat('vi-VN').format(current);
                }
            }, 30);
        }
        // Initialize all counters when they come into view
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const counterElements = entry.target.querySelectorAll('.counter');
                    counterElements.forEach(counter => {
                        const target = parseInt(counter.getAttribute('data-target'));
                        animateCounter(counter, target);
                    });
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.1 });

        // Observe the stats section
        const statsSection = document.querySelector('.stats-section');
        if (statsSection) {
            observer.observe(statsSection);
        }
    });
</script>

</body>
</html>
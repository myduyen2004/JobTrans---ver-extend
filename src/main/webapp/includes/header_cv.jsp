<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa CV</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Be Vietnam Pro', Arial, sans-serif;
            background-color: #f5f5f5;

        }

        .cv-toolbar {

            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 24px;
            background: linear-gradient(to right, rgba(15, 27, 99, 0.95), rgba(25, 37, 109, 0.88));
            border-bottom: 1px solid #e0e0e0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            position: sticky;
            top: 100px;
            left:1px;
            z-index: 100;
            width: 1500px;
            position: fixed;
        }

        .left-section,
        .center-section,
        .right-section {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .center-section {
            flex-wrap: wrap;
            justify-content: center;
        }

        .cv-title {
            font-size: 18px;
            font-weight: 600;
            color: whitesmoke;
        }

        .edit-btn {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
            color: #666;
            transition: color 0.2s ease;
        }

        .edit-btn:hover {
            color: #00B14F;
        }

        .toolbar-item {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 4px 8px;
        }
        .toolbar-item nuoc{
            font-size: 14px;
            color: whitesmoke;
            font-weight: 500;
        }

        .toolbar-item label {
            font-size: 14px;
            color: whitesmoke;
            font-weight: 500;

        }
        .toolbar-item label {
            font-size: 14px;
            color: whitesmoke;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
        }

        .toolbar-item label::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -3px;
            width: 0%;
            height: 2px;
            background-color: #fff;
            transition: width 0.3s ease;
        }

        .toolbar-item:hover label {
            color: #ffd700; /* Vàng nhạt để tạo điểm nhấn */
            transform: scale(1.05);
        }

        .toolbar-item:hover label::after {
            width: 100%;
        }
        .color-circle {
            width: 18px;
            height: 18px;
            border-radius: 50%;
            border: 1px solid #ddd;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .color-circle:hover {
            transform: scale(1.1);
        }

        select {
            padding: 6px 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background-color: white;
            cursor: pointer;
            outline: none;
            transition: border-color 0.2s ease;
        }

        select:hover, select:focus {
            border-color: #00B14F;
        }

        .icon-btn3,
        .custom-layout,
        .undo,
        .redo,
        .preview-btn,
        .download-btn,
        .save-btn {
            padding: 8px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 6px;
            transition: all 0.2s ease;
        }

        .icon-btn3, .custom-layout {
            color: #444;
            width: 150px;
        }

        .icon-btn3:hover, .custom-layout:hover {
            background-color: #e0e0e0;
        }

        .undo, .redo {
            background-color: #f0f0f0;
            width: 36px;
            height: 36px;
            justify-content: center;
            font-size: 16px;
        }

        .undo:hover, .redo:hover {
            background-color: #e0e0e0;
        }

        .save-btn {
            background-color: #00B14F;
            color: white;
            padding: 8px 16px;
        }

        .save-btn:hover {
            background-color: #009a44;
            box-shadow: 0 2px 4px rgba(0,177,79,0.2);
        }

        .preview-btn,
        .download-btn {
            background-color: white;
            border: 1px solid #ddd;
            color: #444;
        }

        .preview-btn:hover,
        .download-btn:hover {
            background-color: #f9f9f9;
            border-color: #ccc;
        }

        .flag {
            font-size: 16px;
        }

        /* Dividers between toolbar sections */
        .divider {
            height: 24px;
            width: 1px;
            background-color: #e0e0e0;
            margin: 0 4px;
        }

        /* Responsive adjustments */
        @media (max-width: 1200px) {
            .center-section {
                gap: 10px;
            }
        }

        @media (max-width: 992px) {
            .cv-toolbar {

                flex-direction: column;
                gap: 12px;
                padding: 12px;
            }

            .left-section, .center-section, .right-section {
                width: 100%;
                justify-content: center;
            }

            .center-section {
                order: 3;
            }

            .right-section {
                order: 2;
            }
        }

        .toolbar-item select {

            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            cursor: pointer;
            outline: none;
            transition: all 0.2s ease;
            appearance: none;

            min-width: 10px;
        }

        .toolbar-item  select:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.5);
        }

        .toolbar-item select:focus {
            border-color: #ffd700;
            box-shadow: 0 0 0 2px rgba(255, 215, 0, 0.25);
        }

        .toolbar-item select option {
            background-color: #1b2a6b;
            color: white;
            padding: 10px 12px;
            font-size: 14px;
            cursor: pointer;
        }

        .toolbar-item select option:checked {
            background-color: #2a3982;
        }

    </style>
</head>
<body>
<div class="cv-toolbar">
    <div class="left-section">
        <span class="cv-title">CV chưa đặt tên</span>
        <button class="edit-btn">✎</button>
    </div>
    <div class="center-section">
        <div class="toolbar-item">
            <label>Ngôn ngữ:</label>

            <select>
                <option class="nuoc flag">🇻🇳Tiếng Việt</option>
                <option class="nuoc flag">🏴󠁧󠁢󠁥󠁮󠁧󠁿Tiếng Anh</option>
                <option class="nuoc flag">🇰🇷Tiếng Hàn</option>
            </select>

        </div>
        <div class="toolbar-item">
            <label>Màu chủ đề:</label>
            <div class="color-circle" style="background-color: #5A7D6C;"></div>
        </div>
        <div class="toolbar-item">
            <label>Font:</label>
            <select>
                <option>Be Vietnam Pro</option>
                <option>Roboto</option>
                <option>Arial</option>
            </select>
        </div>
        <div class="toolbar-item">
            <label>Khoảng cách:</label>
            <select>
                <option>1.0</option>
                <option selected>1.5</option>
                <option>2.0</option>
            </select>
        </div>
        <div class="divider"></div>
        <div class="toolbar-item">
            <label>🖼️ Hình nền</label>
            <select>
                <option>1.0</option>
                <option selected>1.5</option>
                <option>2.0</option>
            </select>
        </div>

<%--        <button class="custom-layout">📑 Tùy chỉnh bố cục</button>--%>
<%--        <div class="divider"></div>--%>
<%--        <button class="undo" title="Hoàn tác">⟲</button>--%>
<%--        <button class="redo" title="Làm lại">⟳</button>--%>
<%--    </div>--%>
    <div class="right-section">
        <button style="margin-left: 200px" class="preview-btn">👁 Xem trước</button>
    </div>
</div>

<%--<!-- Giả lập nội dung để hiển thị header -->--%>
<%--<div style="height: 800px; padding: 30px; background-color: #f5f5f5; display: flex; justify-content: center;">--%>
<%--    <div style="width: 800px; height: 100%; background-color: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">--%>
<%--        <div style="padding: 40px; text-align: center; color: #555;">--%>
<%--            Khu vực nội dung CV sẽ hiển thị ở đây--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>
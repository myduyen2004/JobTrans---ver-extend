<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/><!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Projects &#8211; ProLancer</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .status-pending { background-color: #FEF3C7; color: #92400E; }
        .status-shipping { background-color: #DBEAFE; color: #1E40AF; }
        .status-delivered { background-color: #D1FAE5; color: #065F46; }
        .status-cancelled { background-color: #FEE2E2; color: #B91C1C; }
        .status-returned { background-color: #E5E7EB; color: #1F2937; }
    </style>

    <style>
        .card {
            width: 1351px;
            height: 208px;
            background: white;
            border-radius: 20px;
            border: 5px solid #CED9FE;
            position: relative;
            margin: 20px 0px;
        }

        .avatar {
            width: 150px;
            height: 150px;
            position: absolute;
            top: 29px;
            left: 15px;
            border-radius: 100px;
            margin-left: 20px;
        }

        .title {
            position: absolute;
            left: 255px;
            top: 49px;
            font-size: 32px;
            font-weight: 500;
            color: black;
        }

        .date {
            position: absolute;
            left: 1170px;
            top: 52px;
            font-size: 20px;
            font-family: Roboto;
            font-weight: 700;
            color: #4C4B4B;
        }

        .info {
            position: absolute;
            font-size: 20px;
            font-family: Roboto;
            font-weight: 400;
            color: #616161;
        }

        .sender {
            left: 255px;
            top: 116px;
        }

        .sender-address {
            left: 255px;
            top: 156px;
        }

        .receiver {
            left: 803px;
            top: 116px;
        }

        .receiver-address {
            left: 803px;
            top: 156px;
        }

        .status-box-success {
            width: auto;
            height: 39px;
            position: absolute;
            left: 506px;
            top: 52px;
            background: #0F9143;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .status-box-waiting {
            width: auto;
            height: 39px;
            position: absolute;
            left: 506px;
            top: 52px;
            background: #CE4040;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .status-box-shipping {
            width: auto;
            height: 39px;
            position: absolute;
            left: 506px;
            top: 52px;
            background: #CEB240;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .status-text {
            color: white;
            font-size: 16px;
            font-family: Inter;
            font-weight: 400;
        }

        .detail-box {
            width: 138px;
            height: 48px;
            position: absolute;
            left: 1158px;
            top: 91px;
            background: #0B1741;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .detail-text {
            color: white;
            font-size: 20px;
            font-family: Inter;
            font-weight: 700;
            padding: 0;
        }

        .material-symbols--menu-rounded {
            display: inline-block;
            width: 36px;
            height: 36px;
            --svg: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23000' d='M4 18q-.425 0-.712-.288T3 17t.288-.712T4 16h16q.425 0 .713.288T21 17t-.288.713T20 18zm0-5q-.425 0-.712-.288T3 12t.288-.712T4 11h16q.425 0 .713.288T21 12t-.288.713T20 13zm0-5q-.425 0-.712-.288T3 7t.288-.712T4 6h16q.425 0 .713.288T21 7t-.288.713T20 8z'/%3E%3C/svg%3E");
            background-color: black;
            -webkit-mask-image: var(--svg);
            mask-image: var(--svg);
            -webkit-mask-repeat: no-repeat;
            mask-repeat: no-repeat;
            -webkit-mask-size: 100% 100%;
            mask-size: 100% 100%;
        }

        #filter-list {
            display: none;
            position: absolute;
            top: 45px;
            left: 0;
            width: 250px;
            background: white;
            border-radius: 5px;
            padding: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }
    </style>
</head>
<body class="bg-gray-50">

<div class="container mx-auto px-4 py-8">
    <div class="mb-6 flex flex-col md:flex-row justify-between items-start md:items-center">
        <h1 class="text-2xl font-bold text-gray-800 mb-4 md:mb-0">Danh sách đơn giao hàng</h1>

        <div class="flex flex-col sm:flex-row gap-3">
            <button class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-plus mr-2"></i> Tạo đơn mới
            </button>
            <button class="bg-gray-200 hover:bg-gray-300 text-gray-700 px-4 py-2 rounded-lg flex items-center">
                <i class="fas fa-file-export mr-2"></i> Xuất Excel
            </button>
        </div>
    </div>

    <!-- Bộ lọc -->
    <div class="bg-white rounded-lg shadow mb-6 p-4">
        <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Trạng thái</label>
                <select class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                    <option value="">Tất cả trạng thái</option>
                    <option value="pending">Chờ xử lý</option>
                    <option value="shipping">Đang giao</option>
                    <option value="delivered">Đã giao</option>
                    <option value="cancelled">Đã huỷ</option>
                    <option value="returned">Hoàn trả</option>
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Dự án</label>
                <select class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                    <option value="">Tất cả dự án</option>
                    <!-- Dynamic options would be populated here -->
                </select>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Từ ngày</label>
                <input type="date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Đến ngày</label>
                <input type="date" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
            </div>

            <div class="md:col-span-3 lg:col-span-4 flex items-end gap-3">
                <div class="flex-grow">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Tìm kiếm</label>
                    <input type="text" placeholder="Tìm theo mã đơn, tên người nhận, SĐT..." class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                </div>

                <button class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2.5 rounded-lg">
                    <i class="fas fa-search mr-2"></i> Tìm kiếm
                </button>

                <button class="bg-gray-200 hover:bg-gray-300 text-gray-700 px-4 py-2.5 rounded-lg">
                    <i class="fas fa-redo mr-2"></i> Đặt lại
                </button>
            </div>
        </div>
    </div>

    <!-- Bảng đơn hàng -->
    <div class="bg-white rounded-lg shadow overflow-hidden">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                <tr>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Mã đơn</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Dự án</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Người gửi</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Người nhận</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Sản phẩm</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Trạng thái</th>
                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Thao tác</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                <!-- Đơn hàng 1 -->
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm font-medium text-gray-900">#SP001</div>
                        <div class="text-sm text-gray-500">TRACK12345</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Thiết kế logo</div>
                        <div class="text-sm text-gray-500">ID: 123</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Nguyễn Văn A</div>
                        <div class="text-sm text-gray-500">0901234567</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường ABC, Phường XYZ, Quận 123, TP.HCM</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Nguyễn Văn A</div>
                        <div class="text-sm text-gray-500">0901234567</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường ABC, Phường XYZ, Quận 123, TP.HCM</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Tranh vẽ logo</div>
                        <div class="text-sm text-gray-500">SL: 2 | 1.5kg</div>
                    </td>
                    <td class="px-6 py-4">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full status-shipping">
                                Đang giao
                            </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <div class="flex space-x-2">
                            <button class="text-indigo-600 hover:text-indigo-900" title="Xem chi tiết">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="text-blue-600 hover:text-blue-900" title="Cập nhật">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="text-red-600 hover:text-red-900" title="Huỷ đơn">
                                <i class="fas fa-times-circle"></i>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Đơn hàng 2 -->
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm font-medium text-gray-900">#SP002</div>
                        <div class="text-sm text-gray-500">TRACK67890</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Thiết kế bản vẽ</div>
                        <div class="text-sm text-gray-500">ID: 124</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Trần Thị B</div>
                        <div class="text-sm text-gray-500">0909876543</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường DEF, Phường UVW, Quận 456, Hà Nội</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Trần Thị B</div>
                        <div class="text-sm text-gray-500">0909876543</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường DEF, Phường UVW, Quận 456, Hà Nội</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Bản vẽ kỹ thuật</div>
                        <div class="text-sm text-gray-500">SL: 1 | 0.5kg</div>
                    </td>
                    <td class="px-6 py-4">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full status-delivered">
                                Đã giao
                            </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <div class="flex space-x-2">
                            <button class="text-indigo-600 hover:text-indigo-900" title="Xem chi tiết">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="text-blue-600 hover:text-blue-900" title="Cập nhật">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="text-gray-400 cursor-not-allowed" title="Đã giao">
                                <i class="fas fa-times-circle"></i>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Đơn hàng 3 -->
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm font-medium text-gray-900">#SP003</div>
                        <div class="text-sm text-gray-500">TRACK24680</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Vẽ tranh phong cảnh</div>
                        <div class="text-sm text-gray-500">ID: 125</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Lê Văn C</div>
                        <div class="text-sm text-gray-500">0912345678</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường GHI, Phường JKL, Quận 789, Đà Nẵng</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Lê Văn C</div>
                        <div class="text-sm text-gray-500">0912345678</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường GHI, Phường JKL, Quận 789, Đà Nẵng</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Tranh phong cảnh</div>
                        <div class="text-sm text-gray-500">SL: 3 | 2.5kg</div>
                    </td>
                    <td class="px-6 py-4">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full status-pending">
                                Chờ xử lý
                            </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <div class="flex space-x-2">
                            <button class="text-indigo-600 hover:text-indigo-900" title="Xem chi tiết">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="text-blue-600 hover:text-blue-900" title="Cập nhật">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="text-red-600 hover:text-red-900" title="Huỷ đơn">
                                <i class="fas fa-times-circle"></i>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Đơn hàng 4 -->
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm font-medium text-gray-900">#SP004</div>
                        <div class="text-sm text-gray-500">TRACK13579</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Thiết kế bưu thiếp</div>
                        <div class="text-sm text-gray-500">ID: 126</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Phạm Thị D</div>
                        <div class="text-sm text-gray-500">0978654321</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường MNO, Phường PQR, Quận 012, Hải Phòng</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Phạm Thị D</div>
                        <div class="text-sm text-gray-500">0978654321</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường MNO, Phường PQR, Quận 012, Hải Phòng</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Bộ bưu thiếp</div>
                        <div class="text-sm text-gray-500">SL: 10 | 0.3kg</div>
                    </td>
                    <td class="px-6 py-4">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full status-cancelled">
                                Đã huỷ
                            </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <div class="flex space-x-2">
                            <button class="text-indigo-600 hover:text-indigo-900" title="Xem chi tiết">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="text-gray-400 cursor-not-allowed" title="Đã huỷ">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="text-gray-400 cursor-not-allowed" title="Đã huỷ">
                                <i class="fas fa-times-circle"></i>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Đơn hàng 5 -->
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm font-medium text-gray-900">#SP005</div>
                        <div class="text-sm text-gray-500">TRACK97531</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Vẽ chân dung</div>
                        <div class="text-sm text-gray-500">ID: 127</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Hoàng Văn E</div>
                        <div class="text-sm text-gray-500">0932145678</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường STU, Phường VWX, Quận 345, Cần Thơ</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Hoàng Văn E</div>
                        <div class="text-sm text-gray-500">0932145678</div>
                        <div class="text-sm text-gray-500 truncate max-w-xs">Đường STU, Phường VWX, Quận 345, Cần Thơ</div>
                    </td>
                    <td class="px-6 py-4">
                        <div class="text-sm text-gray-900">Tranh chân dung</div>
                        <div class="text-sm text-gray-500">SL: 1 | 1.0kg</div>
                    </td>
                    <td class="px-6 py-4">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full status-returned">
                                Hoàn trả
                            </span>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                        <div class="flex space-x-2">
                            <button class="text-indigo-600 hover:text-indigo-900" title="Xem chi tiết">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="text-gray-400 cursor-not-allowed" title="Đã hoàn trả">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="text-gray-400 cursor-not-allowed" title="Đã hoàn trả">
                                <i class="fas fa-times-circle"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Phân trang -->
        <div class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
            <div class="flex-1 flex justify-between sm:hidden">
                <a href="#" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                    Trước
                </a>
                <a href="#" class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                    Tiếp
                </a>
            </div>
            <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
                <div>
                    <p class="text-sm text-gray-700">
                        Hiển thị <span class="font-medium">1</span> đến <span class="font-medium">5</span> trong <span class="font-medium">12</span> kết quả
                    </p>
                </div>
                <div>
                    <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                        <a href="#" class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                            <span class="sr-only">Trước</span>
                            <i class="fas fa-chevron-left"></i>
                        </a>
                        <a href="#" aria-current="page" class="z-10 bg-blue-50 border-blue-500 text-blue-600 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                            1
                        </a>
                        <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                            2
                        </a>
                        <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                            3
                        </a>
                        <span class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700">
                            ...
                        </span>
                        <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                            9
                        </a>
                        <a href="#" class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                            <span class="sr-only">Tiếp</span>
                            <i class="fas fa-chevron-right"></i>
                        </a>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.8.1/flowbite.min.js"></script>
</body>
<%--<body>--%>
<%--<section class="section-padding">--%>
<%--    <div class="container">--%>
<%--        <div class="justify-content-center">--%>

<%--            <div style="position: relative; display: inline-block;">--%>
<%--                <button id="filter-btn"--%>
<%--                        style="width: 100px; height: 40px; display: flex; align-items: center; gap: 5px; padding: 5px 10px; background: white; border-radius: 5px; cursor: pointer;">--%>
<%--                    <span class="material-symbols--menu-rounded"></span>--%>
<%--                    <span style="color: black; font-size: 20px; font-family: Inter; font-weight: 500;">Lọc</span>--%>
<%--                </button>--%>

<%--                <div id="filter-list">--%>
<%--                    <label><input type="radio" name="sort" value="success"> Thành công</label><br>--%>
<%--                    <label><input type="radio" name="sort" value="waiting"> Đang chờ duyệt</label><br>--%>
<%--                    <label><input type="radio" name="sort" value="shipping"> Đang vận chuyển</label>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <img class="avatar"--%>
<%--                     src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"/>--%>
<%--                <div class="title">Lập trình web</div>--%>
<%--                <div class="date">20-02-2020</div>--%>
<%--                <div class="info sender">Người gửi: Nguyễn An C</div>--%>
<%--                <div class="info sender-address">Địa chỉ: Ngũ Hành Sơn - Đà Nẵng</div>--%>
<%--                <div class="info receiver">Người nhận: Nguyễn Văn A</div>--%>
<%--                <div class="info receiver-address">Địa chỉ: Ba Đình - Hà Nội</div>--%>
<%--                <div class="status-box-success">--%>
<%--                    <span class="status-text">Thành công</span>--%>
<%--                </div>--%>
<%--                <button class="detail-box detail-text">Chi tiết</button>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <img class="avatar"--%>
<%--                     src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"/>--%>
<%--                <div class="title">Lập trình web</div>--%>
<%--                <div class="date">20-02-2020</div>--%>
<%--                <div class="info sender">Người gửi: Nguyễn An C</div>--%>
<%--                <div class="info sender-address">Địa chỉ: Ngũ Hành Sơn - Đà Nẵng</div>--%>
<%--                <div class="info receiver">Người nhận: Nguyễn Văn A</div>--%>
<%--                <div class="info receiver-address">Địa chỉ: Ba Đình - Hà Nội</div>--%>
<%--                <div class="status-box-waiting">--%>
<%--                    <span class="status-text">Đang chờ duyệt</span>--%>
<%--                </div>--%>
<%--                <button class="detail-box detail-text">Chi tiết</button>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--                <img class="avatar"--%>
<%--                     src="../wp-content/uploads/2021/04/pexels-andrea-piacquadio-874158-200x200.jpg"/>--%>
<%--                <div class="title">Lập trình web</div>--%>
<%--                <div class="date">20-02-2020</div>--%>
<%--                <div class="info sender">Người gửi: Nguyễn An C</div>--%>
<%--                <div class="info sender-address">Địa chỉ: Ngũ Hành Sơn - Đà Nẵng</div>--%>
<%--                <div class="info receiver">Người nhận: Nguyễn Văn A</div>--%>
<%--                <div class="info receiver-address">Địa chỉ: Ba Đình - Hà Nội</div>--%>
<%--                <div class="status-box-shipping">--%>
<%--                    <span class="status-text">Đang vận chuyển</span>--%>
<%--                </div>--%>
<%--                <button class="detail-box detail-text">Chi tiết</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--</body>--%>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>
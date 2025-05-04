<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:useBean id="accDao" class="jobtrans.dal.AccountDAO" scope="session"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Quản Lý Admin</title>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">--%>
    <link rel="stylesheet" href="css/admin-menu-manage.css">
</head>
<body>
<%@include file="includes/header-01.jsp"%>
<div class="admin-menu-container">
    <div class="admin-header">
        <h1>Quản Lý Hệ Thống</h1>
        <p>Chọn một mục quản lý để tiếp tục</p>
    </div>

    <div class="menu-grid">
        <!-- Quản lý người dùng -->
        <div class="menu-category">
            <div class="menu-header">
                <h2><i class="fas fa-users"></i>Quản lý người dùng</h2>
            </div>
            <ul class="submenu-list">
                <li class="submenu-item">
                    <a href="acc-manage?action=viewAllUser" class="submenu-link">
                        <i class="fas fa-user-check"></i>
                        <span class="link-text">
                                Danh sách người dùng
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>

                <li class="submenu-item">
                    <a href="report-manage?action=viewAllReports" class="submenu-link">
                        <i class="fas fa-flag"></i>
                        <span class="link-text">
                                Quản lý Report
                                <span class="badge new">${accDao.getNumberOfPendingReports()} chờ xử lí</span>
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-user-slash"></i>
                        <span class="link-text">
                                Người dùng bị khóa
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- Quản lý công việc -->
        <div class="menu-category">
            <div class="menu-header">
                <h2><i class="fas fa-briefcase"></i>Quản lý công việc</h2>
            </div>
            <ul class="submenu-list">
                <li class="submenu-item">
                    <a href="job-manage?action=job-management" class="submenu-link">
                        <i class="fas fa-list"></i>
                        <span class="link-text">
                                Danh sách công việc
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-check-circle"></i>
                        <span class="link-text">
                                Duyệt công việc
                                <span class="badge new">12 mới</span>
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-chart-line"></i>
                        <span class="link-text">
                                Thống kê công việc
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-trash-alt"></i>
                        <span class="link-text">
                                Công việc đã xóa
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- Quản lý giao dịch -->
        <div class="menu-category">
            <div class="menu-header">
                <h2><i class="fas fa-money-bill-wave"></i>Quản lý giao dịch</h2>
            </div>
            <ul class="submenu-list">
                <li class="submenu-item">
                    <a href="trans-manage?action=trans-management" class="submenu-link">
                        <i class="fas fa-exchange-alt"></i>
                        <span class="link-text">
                                Danh sách giao dịch
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-hand-holding-usd"></i>
                        <span class="link-text">
                                Yêu cầu rút tiền
                                <span class="badge">8 chờ</span>
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-chart-pie"></i>
                        <span class="link-text">
                                Báo cáo doanh thu
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- Quản lý hợp đồng -->
        <div class="menu-category">
            <div class="menu-header">
                <h2><i class="fas fa-file-contract"></i>Quản lý hợp đồng</h2>
            </div>
            <ul class="submenu-list">
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-clipboard-list"></i>
                        <span class="link-text">
                                Danh sách hợp đồng
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-file-signature"></i>
                        <span class="link-text">
                                Hợp đồng mới
                                <span class="badge new">3 mới</span>
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-exclamation-circle"></i>
                        <span class="link-text">
                                Hợp đồng sắp hết hạn
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
                <li class="submenu-item">
                    <a href="#" class="submenu-link">
                        <i class="fas fa-file-export"></i>
                        <span class="link-text">
                                Xuất báo cáo hợp đồng
                                <i class="fas fa-chevron-right arrow"></i>
                            </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<script>
    // Ripple effect on menu items
    const menuLinks = document.querySelectorAll('.submenu-link');

    menuLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const x = e.clientX - e.target.getBoundingClientRect().left;
            const y = e.clientY - e.target.getBoundingClientRect().top;

            const ripple = document.createElement('span');
            ripple.classList.add('ripple');
            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;

            this.appendChild(ripple);

            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
</script>
</body>
<%@include file="includes/footer.jsp"%>

</html>
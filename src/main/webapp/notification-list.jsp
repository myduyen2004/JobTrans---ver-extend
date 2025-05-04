<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/21/2025
  Time: 12:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Thông Báo</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/notification-list.css">
</head>
<%@include file="includes/header-01.jsp"%>
<body>
<div class="container">
    <header>
        <div class="header-content">
            <h1><i class="fas fa-bell notification-icon"></i>Danh Sách Thông Báo</h1>
            <div class="controls">
                <form action="notification" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="mark-all-notifications">
                    <button type="submit" class="btn btn-mark-all">
                        <i class="fas fa-check-double"></i>
                        Đánh Dấu Đã Đọc
                    </button>
                </form>

            </div>
        </div>
    </header>

    <div class="filter-wrapper">
        <button class="filter-btn-01 active">Tất Cả</button>
        <button class="filter-btn-01">Chưa Đọc</button>
        <button class="filter-btn-01">Tương tác</button>
        <button class="filter-btn-01">Hệ Thống</button>
        <button class="filter-btn-01">Thanh Toán</button>
    </div>
    <ul class="notification-list">
        <c:forEach var="noti" items="${notificationList}">
            <c:choose>
                <c:when test="${!noti.haveRead}">
                    <li class="notification-item-01 unread">
                </c:when>
                <c:otherwise>
                    <li class="notification-item-01">
                </c:otherwise>
            </c:choose>
            <div class="notification-content">
                <c:choose>
                <c:when test="${noti.notificationType == 'Tương tác'}">
                <div class="notification-icon-wrapper icon-promotion">
                    <i class="fas fa-tag"></i>
                    </c:when>
                    <c:when test="${noti.notificationType == 'Hệ thống'}">
                    <div class="notification-icon-wrapper icon-system">
                        <i class="fas fa-cog"></i>
                        </c:when>
                        <c:when test="${noti.notificationType == 'Giao dịch'}">
                        <div class="notification-icon-wrapper icon-payment">
                            <i class="fas fa-money-bill-wave"></i>
                            </c:when>
                            </c:choose>


                        </div>
                        <div class="notification-details">
                            <div class="notification-header">
                                <h3 class="notification-title">${noti.notificationTitle}</h3>
                                <span class="notification-time">${noti.notificationTime}</span>
                            </div>
                            <p class="notification-message">
                                    ${noti.notificationContent}
                            </p>
                            <div class="notification-actions">
                                <form action="notification" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="detail-notification">
                                <button class="action-btn">
                                    <i class="fas fa-eye"></i> Xem chi tiết
                                </button>
                                </form>
                                <c:if test="${!noti.haveRead}">
                                    <form action="notification" method="post" style="display: inline;">
                                        <input type="hidden" name="action" value="mark-notification">
                                        <input type="hidden" name="notificationId" value="${noti.notificationId}">
                                    <button class="action-btn">
                                        <i class="fas fa-check"></i> Đánh dấu đã đọc
                                    </button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                    <c:when test="${!noti.haveRead}">
                    <span class="unread-indicator"></span>
                    </c:when>
                    </c:choose>
            </li>

        </c:forEach>
    </ul>

    <div class="empty-state" id="emptyState">
        <i class="fas fa-bell-slash empty-icon"></i>
        <h3 class="empty-title">Không có thông báo</h3>
        <p class="empty-description">Bạn không có thông báo nào vào lúc này. Chúng tôi sẽ thông báo khi có tin mới.</p>
    </div>

    <div class="pagination">
        <button class="page-item disabled">
            <i class="fas fa-chevron-left"></i>
        </button>
        <button class="page-item active">1</button>
        <button class="page-item">2</button>
        <button class="page-item">3</button>
        <button class="page-item">
            <i class="fas fa-chevron-right"></i>
        </button>
    </div>
</div>

<footer>
    © 2025 Hệ Thống Thông Báo | Tất cả các quyền được bảo lưu
</footer>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Filter buttons functionality
        const filterButtons = document.querySelectorAll('.filter-btn-01');
        const notificationItems = document.querySelectorAll('.notification-item-01');
        const emptyState = document.getElementById('emptyState');

        filterButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Remove active class from all buttons
                filterButtons.forEach(btn => btn.classList.remove('active'));

                // Add active class to clicked button
                this.classList.add('active');

                // Filter logic
                const filterType = this.textContent.trim();
                let visibleCount = 0;

                notificationItems.forEach(item => {
                    if (filterType === 'Tất Cả') {
                        item.style.display = 'block';
                        visibleCount++;
                    } else if (filterType === 'Chưa Đọc') {
                        if (item.classList.contains('unread')) {
                            item.style.display = 'block';
                            visibleCount++;
                        } else {
                            item.style.display = 'none';
                        }
                    } else {
                        // Filter by notification type
                        const iconClass = item.querySelector('.notification-icon-wrapper').classList;
                        const isMatch =
                            (filterType === 'Tương tác' && iconClass.contains('icon-promotion')) ||
                            (filterType === 'Hệ Thống' && iconClass.contains('icon-system')) ||
                            (filterType === 'Thanh Toán' && iconClass.contains('icon-payment'));

                        if (isMatch) {
                            item.style.display = 'block';
                            visibleCount++;
                        } else {
                            item.style.display = 'none';
                        }
                    }
                });

                // Show empty state if no notifications match filter
                emptyState.style.display = visibleCount === 0 ? 'block' : 'none';
            });
        });

        // Mark all as read button
        const markAllButton = document.querySelector('.btn-mark-all');
        markAllButton.addEventListener('click', function() {
            const unreadItems = document.querySelectorAll('.notification-item-01.unread');
            unreadItems.forEach(item => {
                item.classList.remove('unread');
                const indicator = item.querySelector('.unread-indicator');
                if (indicator) {
                    indicator.remove();
                }
            });
        });

        // Individual mark as read buttons
        const markReadButtons = document.querySelectorAll('.action-btn:nth-child(2)');
        markReadButtons.forEach(button => {
            button.addEventListener('click', function() {
                const notificationItem = this.closest('.notification-item-01');
                if (notificationItem.classList.contains('unread')) {
                    notificationItem.classList.remove('unread');
                    const indicator = notificationItem.querySelector('.unread-indicator');
                    if (indicator) {
                        indicator.remove();
                    }
                }
            });
        });

        // Animation on scroll
        const animateOnScroll = () => {
            const items = document.querySelectorAll('.notification-item-01');

            items.forEach(item => {
                const itemPosition = item.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.2;

                if (itemPosition < screenPosition) {
                    item.style.opacity = '1';
                    item.style.transform = 'translateY(0)';
                }
            });
        };

        // Initial check for items in viewport
        animateOnScroll();

        // Add animation on scroll
        window.addEventListener('scroll', animateOnScroll);
    });
</script>
</body>
<%@include file="includes/footer.jsp"%>

</html>

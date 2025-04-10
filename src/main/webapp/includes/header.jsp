<%@ page import="jobtrans.model.Account" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>

    <div class="site-header sticky-header">
        <div class="container">
            <div class="row">
                <div class="col-xl-2 col-md-3 my-auto">
                    <div class="logo">
                        <a href="home" rel="home" aria-current="page"><img width="80" height="71"
                                                                                 src="${pageContext.request.contextPath}/wp-content/uploads/2021/09/logo.png"
                                                                                 class="custom-logo" alt="ProLancer"
                                                                                 decoding="async" srcset=""
                                                                                 sizes="(max-width: 500px) 100vw, 500px"/></a>
                    </div>
                </div>

                <div class="col-xl-6 col-md-7 my-auto">
                    <div class="primary-menu d-none d-lg-inline-block">
                        <nav class="desktop-menu">
                            <ul id="menu-primary" class="menu">
                                <li id="menu-item-2318"
                                    class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-2316 current_page_item current-menu-ancestor current-menu-parent current_page_parent current_page_ancestor menu-item-2318">
                                    <a href="index.html">Trang chủ</a></li>
                                <li id="menu-item-26"
                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-26">
                                    <a href="projects/index.html">Công việc</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-391"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-391">
                                            <a href="../projects/my-project?projects-layout=projects_left_sidebar"
                                               class="dropdown-mega-menu-toggle">Công nghệ & IT</a>
                                            <div class="mega-menu-content"></div>
                                        </li>
                                        <li id="menu-item-391"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-391">
                                            <a href="../projects/my-project?projects-layout=projects_left_sidebar"
                                               class="dropdown-mega-menu-toggle">Marketing</a>
                                            <div class="mega-menu-content"></div>
                                        </li>
                                        <li id="menu-item-391"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-391">
                                            <a href="../projects/my-project?projects-layout=projects_left_sidebar"
                                               class="dropdown-mega-menu-toggle">Design</a>
                                            <div class="mega-menu-content"></div>
                                        </li>
                                        <li id="menu-item-391"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-391">
                                            <a href="../projects/my-project?projects-layout=projects_left_sidebar"
                                               class="dropdown-mega-menu-toggle">Dịch thuật</a>
                                            <div class="mega-menu-content"></div>
                                        </li>
                                        <li id="menu-item-391"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-391">
                                            <a href="../projects/my-project?projects-layout=projects_left_sidebar"
                                               class="dropdown-mega-menu-toggle">Tư vấn, Coaching</a>
                                            <div class="mega-menu-content"></div>
                                        </li>
                                        <li id="menu-item-391"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-391">
                                            <a href="../projects/my-project?projects-layout=projects_left_sidebar"
                                               class="dropdown-mega-menu-toggle">Khác</a>
                                            <div class="mega-menu-content"></div>
                                        </li>
                                    </ul>
                                </li>
                                <li
                                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-27"><a
                                        href="services/index.html">Tạo CV</a>
                                </li>
                                <li id="menu-item-20"
                                    class="menu-item menu-item-type-post_type menu-item-object-page menu-item-20"><a
                                        href="policy.jsp">Chính sách</a>
                                </li>
                                <li id="menu-item-382"
                                    class="menu-item menu-item-type-post_type menu-item-object-page menu-item-382"><a
                                        href="about-me.jsp">Về chúng tôi</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <%
                    Account account = (Account) session.getAttribute("sessionAccount");
                    if (account == null || "".equals(account)) {
                %>
                <div class="col-xl-3 col-md-2 my-auto">
                    <div class="header-btn d-none d-lg-block">
                        <a href="login-and-register.jsp">
                            Đăng nhập </a>
                    </div>
                </div>
                <%} else {%>
                <div id="menu-item-27" class="col-xl-4 col-md-2 my-auto">
                    <div class="header-btn d-none d-lg-block">
                        <div class="user-card"
                             style="display: flex; justify-content: space-between; align-items: center; width: 100%; padding: 10px; transition: all 0.3s;">

                            <!-- Icon chat và thông báo (sát với tên) -->
                            <div style="display: flex; align-items: center; gap: 60px; margin-left: 50px;">
                                <i class="fa fa-comments icon"
                                   style="font-size: 22px; color: white; transition: color 0.3s;"></i>
                                <i class="fa fa-bell icon"
                                   style="font-size: 22px; color: white; transition: color 0.3s;"></i>
                            </div>

                            <!-- Tên và điểm (giữ nguyên chỗ cũ) -->
                            <div style="flex: 1; text-align: center;">
                                <h2 id="user-name"
                                    style="color: white; font-size: 18px; font-weight: bold; margin: 0;"><%=account.getAccountName()%>
                                </h2>
                                <p id="user-score" style="color: white; font-size: 14px; margin: 0;">
                                    Điểm: <%=account.getPoint()%>
                                </p>
                            </div>

                            <!-- Ảnh đại diện -->
                            <div style="width: 18%; text-align: right; position: relative;">
                                <!-- Avatar để mở dropdown -->
                                <!-- Avatar để mở dropdown -->
                                <!-- Avatar để mở dropdown -->
                                <img id="dropdown-toggle"
                                     src="<%=account.getAvatar()%>" alt="Avatar"
                                     style="width: 48px; height: 48px; border-radius: 50%; border: 2px solid #6787fe; cursor: pointer;">

                                <!-- Dropdown Menu -->
                                <div id="dropdown-menu">
                                    <ul>

                                        <%if (account.getType().equals("Individual")){%>
                                        <li><i class="fas fa-user"></i> <a href="acc-manage?action=viewAdminAccount">Thông
                                            tin cá nhân</a></li>
                                        <li><i class="fas fa-user-edit"></i> <a href="profile?action=loadUpdateProfile">Chỉnh sửa thông tin</a></li>
                                        <%}else{%>
                                        <li><i class="fas fa-users"></i> <a href="acc-manage?action=viewAdminAccount">Thông
                                            tin nhóm</a></li>
                                        <li><i class="fas fa-cog"></i> <a href="profile?action=loadUpdateProfile">Chỉnh sửa thông tin chung</a></li>
                                        <li><i class="fas fa-users-cog"></i> <a href="group?action=showUpdateGroup">Chỉnh sửa thông tin nhóm</a></li>
                                        <%}%>
                                        <li><i class="fas fa-wallet"></i> <a href="#">Ví của tôi</a></li>
                                        <li><i class="fas fa-briefcase"></i> <a href="#">Quản lý công việc</a></li>

                                        <li><i class="fas fa-sign-out-alt"></i> <a href="logout">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </div>

                            <!-- FontAwesome Icons -->
                            <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>


                        </div>
                    </div>
                </div>
            </div>
            <%} %>
        </div>
    </div>
</header>


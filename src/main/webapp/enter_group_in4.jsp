<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="jobtrans.model.Account" %>

<!DOCTYPE html>
<html lang="vi">
<head>

    <jsp:useBean id="accountDao" class="jobtrans.dal.AccountDAO" scope="page">
        <jsp:setProperty name="accountDao" property="*" />
    </jsp:useBean>
<%--    <jsp:useBean id="groupMemberDao" class="jobtrans.dal.GroupMemberDAO" scope="page">--%>
<%--        <jsp:setProperty name="groupMemberDao" property="*" />--%>
<%--    </jsp:useBean>--%>
    <%--        int accountId = Integer.parseInt(request.getParameter("accountId")); // Lấy ID từ request--%>
    <%--        jobtrans.model.Account account = accountDao.getAccountById(accountId);--%>
    <%--    %>--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<link rel="profile" href="https://gmpg.org/xfn/11">-->

    <title>JobTrans &#8211; Nền tảng hỗ trợ thuê, làm việc cho freelancer</title>
    <meta name='robots' content='max-image-preview:large' />

    <!--new css -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="css/enter_group_in4.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body style="overflow-y: auto;
    height: 100%;
">
<%--Header--%>
<%@include file="includes/header-01.jsp"%>

<%@include file="includes/sidebar.jsp" %>
<!-- Preloading -->
<div id="preloader">
    <div class="spinner">
        <div class="uil-ripple-css"><div></div><div></div></div>
    </div>
</div>

<!--banner-->

<div class="row main-content" id="mainContent">
<!<!-- Account in4 -->
<div class="d-flex flex-col items-center account_card">
    <div class="row d-flex flex-row align-content-center" style="width: 1222px; height: 298px; border: solid 2px #6787FE; border-radius: 30px;">
        <div class="col-3 d-flex flex-col items-center flex-row align-content-center">
            <img style="border: solid 1px black; border-radius: 25px; margin-left: 25px;"
                 src="${account.getAvatar()}" width="225" height="225" alt="Group_Avatar"/>
        </div>
        <div class="col-6 space-y-4">
            <h2 style="font-size: 28px; font-weight: bold;">${account.getAccountName()} <i class="fas fa-check-circle text-blue-500"></i></h2>
            <button class="ml-auto px-4 py-2" style="background-color: #6787FE50; border: solid 1px #6787FE; border-radius: 20px; color: #6787FE;">
                <i class="fas fa-user-plus"></i>
                Follow
            </button>
            <p style="font-size: 19px; font-weight: bold;">
                ${account.getRole()}
            </p>
            <p style="font-size: 19px;">
<%--                                    Member since ${account.getJoinDate()}--%>
            </p>
            <div class="flex space-x-5 mt-2">
                <div style="background-color: #6787FE50; border: solid 1px #6787FE; border-radius: 20px; color: #6787FE;">
                        <span style="color: #6787FE; margin: 15px;">
                            <i class="fas fa-map-marker-alt"></i>
                            ${account.getAddress()}
                        </span>
                </div>
                <div style="background-color: #6787FE50; border: solid 1px #6787FE; border-radius: 20px; color: #6787FE;">
                        <span style="color: #6787FE; margin: 15px;">
                            <i class="fas fa-users"></i>
<%--                            ${account.getMemberCount()}--%>
                        </span>
                </div>
                <div style="background-color: #6787FE50; border: solid 1px #6787FE; border-radius: 20px; color: #6787FE;">
                        <span style="color: #6787FE; margin: 15px;">
                            <i class="fas fa-tag"></i>
                            ${account.getSpecialist()}
                        </span>
                </div>
            </div>
        </div>
        <div class="col-3 space-y-5 px-4">
            <div class="row flex flex-row align-content-center" style="background-color: #6787FE50; border-radius: 20px; height: 58px;">
                <div class="col-10">Số lời chào giá:</div>
                <div class="col-2">${accountDao.countTotalGreetings(account.getAccountId())}</div>
            </div>
            <div class="row flex flex-row align-content-center" style="background-color: #6787FE50; border-radius: 20px; height: 58px;">
                <div class="col-10">Công việc diễn ra:</div>
                <div class="col-2">${accountDao.countInProgressJobs(account.getAccountId())}</div>
            </div>
            <div class="row flex flex-row align-content-center" style="background-color: #6787FE50; border-radius: 20px; height: 58px;">
                <div class="col-10">Công việc hoàn thành:</div>
                <div class="col-2">${accountDao.countCompletedJobs(account.getAccountId())}</div>
            </div>
        </div>
    </div>
</div>


<!<!-- Enter in4 -->
<div class="bg-white rounded-lg shadow-lg p-6 mt-6" style="width: 1222px; margin: 120px auto;">
    <h2 class="text-xl font-bold text-blue-900 mb-4">
        THÔNG TIN THÀNH VIÊN
    </h2>

    <div class="flex space-x-4 mb-4">
        <c:forEach var="member" items="${memberList}" varStatus="loop">
            <button class="bt px-4 py-2 member-btn ${loop.first ? 'member-active' : ''}"
                    data-id="${member.memberId}"
                    onclick="selectMember(${member.memberId})">
                <i class="fas fa-user"></i>
                <c:if test="${loop.first}"> (Leader)</c:if>
                Member ${loop.index + 1}
            </button>
        </c:forEach>
    </div>

    <form id="memberForm" class="d-flex flex-col justify-content-center" method="post" action="group" accept-charset="UTF-8">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="memberId" id="memberId" value="${not empty selectedMember ? selectedMember.memberId : ''}">
        <input type="hidden" name="accountId" value="${not empty selectedMember ? selectedMember.accountId : ''}">

        <div style="border: solid 2px #6787FE; border-radius: 15px;" class="d-flex flex-col justify-content-center">
            <div class="grid grid-cols-1 gap-4" style="padding: 20px;">
                <div>
                    <label class="block text-gray-700">
                        Họ &amp; Tên:
                    </label>
                    <input id="memberName" name="memberName" class="w-full border border-blue-300 rounded-lg p-2" type="text" value="${selectedMember.memberName}"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Ngày sinh:
                    </label>
                    <input id="dateOfBirth" name="dateOfBirth" class="w-full border border-blue-300 rounded-lg p-2" type="date" value="${selectedMember.dateOfBirth}"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Giới tính:
                    </label>

                    <select id="gender" name="gender" class="">
                        <option value="Nam" ${selectedMember.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                        <option value="Nữ" ${selectedMember.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                    </select>

                </div>
                <div>
                    <label class="block text-gray-700">
                        Năm kinh nghiệm:
                    </label>
                    <input id="experienceYears" name="experienceYears" class="w-full border border-blue-300 rounded-lg p-2" type="number" value="${selectedMember.experienceYears}"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Học Vấn:
                    </label>
                    <input id="education" name="education" class="w-full border border-blue-300 rounded-lg p-2" type="text" value="${selectedMember.education}"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Giới thiệu chung:
                    </label>
                    <input id="bio" name="bio" class="w-full border border-blue-300 rounded-lg p-2" type="text" value="${selectedMember.bio}"/>
                </div>
                <div>
                    <label class="block text-gray-700">
                        Chuyên môn:
                    </label>
                    <input id="specialist" name="specialist" class="w-full border border-blue-300 rounded-lg p-2" type="text" value="${selectedMember.specialist}"/>
                </div>
            </div>
        </div>
        <button class="text-white px-4 py-2" type="submit" style="margin:10px auto; background-color: #6787FE; border: solid 2px #6787FE; border-radius: 15px;">
            <i class="fas fa-edit"></i>Cập nhật
        </button>
    </form>
</div>

<%--Footer--%>
<%@include file="includes/footer.jsp"%>
</div>
<!--======= Back to Top =======-->
<div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>
<%--JS--%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const firstMemberBtn = document.querySelector('.member-btn');
        if (firstMemberBtn) {
            const firstMemberId = firstMemberBtn.getAttribute('data-id');
            selectMember(firstMemberId);
        }
    });
</script>
<script>
    function formatDateForInput(gmtString) {

        try {
            if (!gmtString) return '';
            // Phương án 2: Dùng Date object nếu định dạng khác
            const date = new Date(gmtString);
            if (!isNaN(date.getTime())) {
                return date.toISOString().split('T')[0];
            }

            return '';
        } catch (e) {
            console.error("Date parsing error:", e);
            return '';
        }
    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Tự động chọn thành viên đầu tiên khi trang load
        const firstMemberBtn = document.querySelector('.member-btn');
        if (firstMemberBtn) {
            const firstMemberId = firstMemberBtn.getAttribute('data-id');
            selectMember(firstMemberId);
        }
    });

    function selectMember(memberId) {
        // Update active button styling
        document.querySelectorAll('.member-btn').forEach(btn => {
            btn.classList.remove('member-active');
            if (btn.getAttribute('data-id') == memberId) {
                btn.classList.add('member-active');
            }
        });

        // Update hidden memberId field
        document.getElementById('memberId').value = memberId;

        // Fetch member details via AJAX
        $.ajax({
            url: '${pageContext.request.contextPath}/group',
            type: 'GET',
            data: {
                action: 'member-details',
                memberId: memberId
            },
            dataType: 'json',
            success: function(data) {
                console.log('Raw API response:', data);
                if (data) {
                    // Cập nhật các trường form
                    document.getElementById('memberName').value = data.memberName || '';
                    console.log('Raw dateOfBirth:', data.dateOfBirth);
                    const dob = formatDateForInput(data.dateOfBirth);
                    console.log('Formatted dateOfBirth:', dob);
                    document.getElementById('dateOfBirth').value = dob;
                    // Xử lý radio button giới tính
                    // if (data.gender === 'Nam') {
                    //     document.querySelector('input[name="gender"][value="Nam"]').checked = true;
                    // } else if (data.gender === 'Nữ') {
                    //     document.querySelector('input[name="gender"][value="Nữ"]').checked = true;
                    // }

                    document.getElementById('experienceYears').value = data.experienceYears || '';
                    document.getElementById('education').value = data.education || '';
                    document.getElementById('bio').value = data.bio || '';
                    document.getElementById('specialist').value = data.specialist || '';
                }
                console.log("Full response data:", data);
                console.log("Date of birth raw:", data.dateOfBirth);
                const dob = data.dateOfBirth ? formatDateForInput(data.dateOfBirth) : '';
                console.log("Date of birth formatted:", dob);
                document.getElementById('dateOfBirth').value = dob;
            },
            error: function(xhr, status, error) {
                console.error('Error fetching member details:', error);
                alert('Có lỗi xảy ra khi tải thông tin thành viên. Vui lòng thử lại sau.');
            }
        });
    }
</script>
</body>
</html>
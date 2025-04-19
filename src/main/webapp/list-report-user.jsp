<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/buyers/harry-olson/ by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:34:54 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Harry Olson &#8211; ProLancer</title>
</head>

<body>
<section class="pb-95 bg-gray">
    <div class="row justify-content-center">
        <div class="col-xl-9">
            <div class="white-padding" style="display: flex; align-items: center; justify-content: center; height: 100%;">
                <!-- Centering using flexbox -->
                <div style="width: 954px; height: 509px; position: relative; background: white; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); border-radius: 15px; border: 2px #D9D9D9 solid;">
                    <!-- Nút Bộ lọc -->
                    <div id="filterButton" style="width: 107px; height: 36px; position: absolute; left: 805px; top: 22px; background: #6787FE; box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.25); border-radius: 13px; display: flex; align-items: center; justify-content: center; cursor: pointer;">
                        <span style="color: white; font-size: 20px; font-family: Roboto; font-weight: 700;">Bộ lọc</span>
                    </div>

                    <!-- Pop-up Ẩn ban đầu -->
                    <div id="popup" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); display: flex; justify-content: center; align-items: center; z-index: 999;">
                        <div style="width: 400px; background: white; border-radius: 8px; padding: 20px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);">
                            <!-- Header Title -->
                            <div style="font-size: 18px; font-weight: bold; margin-bottom: 20px;">Thông tin bộ lọc</div>

                            <!-- Filter Fields Section -->
                            <div style="display: flex; flex-direction: column; gap: 15px; margin-bottom: 20px;">
                                <!-- Báo cáo người dùng Checkbox -->
                                <div style="display: flex; justify-content: space-between; align-items: center;">
                                    <label for="userReport" style="font-size: 14px; font-family: Roboto, sans-serif;">Báo cáo người dùng</label>
                                    <input id="userReport" type="checkbox" style="width: 20px; height: 20px; cursor: pointer;" />
                                </div>

                                <!-- Báo cáo dự án Checkbox -->
                                <div style="display: flex; justify-content: space-between; align-items: center;">
                                    <label for="projectReport" style="font-size: 14px; font-family: Roboto, sans-serif;">Báo cáo dự án</label>
                                    <input id="projectReport" type="checkbox" style="width: 20px; height: 20px; cursor: pointer;" />
                                </div>

                                <!-- Số người trên mỗi trang Input -->
                                <div style="display: flex; justify-content: space-between; align-items: center;">
                                    <label for="peoplePerPage" style="font-size: 14px; font-family: Roboto, sans-serif;">Số người trên mỗi trang</label>
                                    <input id="peoplePerPage" type="number" min="1" max="100" placeholder="Nhập số"
                                           style="width: 100px; padding: 5px; border: 1px solid #D9D9D9; border-radius: 4px; text-align: right;" />
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div style="display: flex; justify-content: space-between; margin-top: 15px;">
                                <button onclick="applyFilters()" style="background: #6787FE; color: white; font-size: 14px; font-weight: bold; padding: 10px 20px; border: none; border-radius: 6px; cursor: pointer;">Áp dụng</button>
                                <button onclick="closePopup()" style="background: #DC1115; color: white; font-size: 14px; font-weight: bold; padding: 10px 20px; border: none; border-radius: 6px; cursor: pointer;">Hủy bỏ</button>
                            </div>


                        </div>
                    </div>












                    <!-- "Xem thêm" Text -->
                    <div style="position: absolute; left: 816px; top: 467px; display: flex; align-items: center; justify-content: center;">
                        <span style="color: black; font-size: 20px; font-family: Roboto; font-weight: 700; line-height: 20px;">Xem thêm</span>
                    </div>

                    <!-- Section 1: Người dùng A -->
                    <div style="width: 907px; height: 99px; position: absolute; left: 25px; top: 85px; background: white; border-radius: 14px; border: 2px #D9D9D9 solid; display: flex; align-items: center; justify-content: space-between; padding: 0 20px;">
                        <span style="color: black; font-size: 20px; font-family: Roboto; font-weight: 700;">Người dùng A</span>
                        <div style="display: flex; gap: 10px;">
                            <!-- "Xem chi tiết" -->
                            <div style="width: 132px; height: 38px; background: #6787FE; box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.25); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                                <span style="color: white; font-size: 20px; font-family: Roboto; font-weight: 600; line-height: 20px;">Xem chi tiết</span>
                            </div>
                            <!-- "Chặn" -->
                            <div style="width: 130px; height: 38px; background: #E22529; box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.25); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                                <span style="color: white; font-size: 20px; font-family: Roboto; font-weight: 600; line-height: 20px;">Chặn</span>
                            </div>
                        </div>
                    </div>

                    <!-- Section 2: Người dùng A -->
                    <div style="width: 907px; height: 99px; position: absolute; left: 25px; top: 215px; background: white; border-radius: 14px; border: 2px #D9D9D9 solid; display: flex; align-items: center; justify-content: space-between; padding: 0 20px;">
                        <span style="color: black; font-size: 20px; font-family: Roboto; font-weight: 700;">Người dùng A</span>
                        <div style="display: flex; gap: 10px;">
                            <!-- "Xem chi tiết" -->
                            <div style="width: 132px; height: 38px; background: #6787FE; box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.25); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                                <span style="color: white; font-size: 20px; font-family: Roboto; font-weight: 600; line-height: 20px;">Xem chi tiết</span>
                            </div>
                            <!-- "Chặn" -->
                            <div style="width: 130px; height: 38px; background: #E22529; box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.25); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                                <span style="color: white; font-size: 20px; font-family: Roboto; font-weight: 600; line-height: 20px;">Chặn</span>
                            </div>
                        </div>
                    </div>

                    <!-- Section 3: Nhóm A -->
                    <div style="width: 907px; height: 99px; position: absolute; left: 22px; top: 345px; background: white; border-radius: 14px; border: 2px #D9D9D9 solid; display: flex; align-items: center; justify-content: space-between; padding: 0 20px;">
                        <span style="color: black; font-size: 20px; font-family: Roboto; font-weight: 700;">Nhóm A</span>
                        <div style="display: flex; gap: 10px;">
                            <!-- "Xem chi tiết" -->
                            <div style="width: 132px; height: 38px; background: #6787FE; box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.25); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                                <span style="color: white; font-size: 20px; font-family: Roboto; font-weight: 600; line-height: 20px;">Xem chi tiết</span>
                            </div>
                            <!-- "Chặn" -->
                            <div style="width: 130px; height: 38px; background: #E22529; box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.25); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                                <span style="color: white; font-size: 20px; font-family: Roboto; font-weight: 600; line-height: 20px;">Chặn</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<script>(function() {function maybePrefixUrlField () {
    const value = this.value.trim()
    if (value !== '' && value.indexOf('http') !== 0) {
        this.value = 'http://' + value
    }
}

    const urlFields = document.querySelectorAll('.mc4wp-form input[type="url"]')
    for (let j = 0; j < urlFields.length; j++) {
        urlFields[j].addEventListener('blur', maybePrefixUrlField)
    }
})();</script>			<script type='text/javascript'>
    const lazyloadRunObserver = () => {
        const lazyloadBackgrounds = document.querySelectorAll( `.e-con.e-parent:not(.e-lazyloaded)` );
        const lazyloadBackgroundObserver = new IntersectionObserver( ( entries ) => {
            entries.forEach( ( entry ) => {
                if ( entry.isIntersecting ) {
                    let lazyloadBackground = entry.target;
                    if( lazyloadBackground ) {
                        lazyloadBackground.classList.add( 'e-lazyloaded' );
                    }
                    lazyloadBackgroundObserver.unobserve( entry.target );
                }
            });
        }, { rootMargin: '200px 0px 200px 0px' } );
        lazyloadBackgrounds.forEach( ( lazyloadBackground ) => {
            lazyloadBackgroundObserver.observe( lazyloadBackground );
        } );
    };
    const events = [
        'DOMContentLoaded',
        'elementor/lazyload/observe',
    ];
    events.forEach( ( event ) => {
        document.addEventListener( event, lazyloadRunObserver );
    } );
</script>
<script type='text/javascript'>
    (function () {
        var c = document.body.className;
        c = c.replace(/woocommerce-no-js/, 'woocommerce-js');
        document.body.className = c;
    })();
</script>
<script>
    // Lấy phần tử nút và pop-up
    var filterButton = document.getElementById('filterButton');
    var popup = document.getElementById('popup');

    // Thêm sự kiện click cho nút Bộ lọc
    filterButton.onclick = function() {
        // Hiển thị pop-up
        popup.style.display = 'flex';
    }

    // Hàm đóng pop-up
    function closePopup() {
        // Ẩn pop-up
        popup.style.display = 'none';
    }


</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const popup = document.getElementById('popup');
        const filterButton = document.getElementById('filterButton');

        // Kiểm tra localStorage để xem popup đã hiển thị chưa
        const hasPopupShown = localStorage.getItem('popupShown');

        if (!hasPopupShown) {
            openPopup();
        }

        // Bấm vào nút "Bộ lọc" để mở popup
        filterButton.addEventListener('click', openPopup);
    });

    function openPopup() {
        const popup = document.getElementById('popup');
        popup.style.display = 'flex';
    }

    function closePopup() {
        const popup = document.getElementById('popup');
        popup.style.display = 'none';

        // Đánh dấu popup đã hiển thị để không lặp lại khi reload
        localStorage.setItem('popupShown', 'true');
    }

    function applyFilters() {
        const userReportChecked = document.getElementById('userReport').checked;
        const projectReportChecked = document.getElementById('projectReport').checked;
        const peoplePerPage = document.getElementById('peoplePerPage').value;

        // Xử lý dữ liệu filter (tùy chỉnh tại đây)
        console.log('Báo cáo người dùng:', userReportChecked);
        console.log('Báo cáo dự án:', projectReportChecked);
        console.log('Số người trên mỗi trang:', peoplePerPage);

        alert('Áp dụng bộ lọc thành công!');

        // Đóng popup sau khi áp dụng
        closePopup();
    }

</script>
</body>
</html>

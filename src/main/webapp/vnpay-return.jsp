<%-- 
    Document   : vnpay-return
    Created on : Mar 4, 2025, 10:23:46 AM
    Author     : qn407
--%>

<%@page import="jakarta.servlet.jsp.jstl.core.Config"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.util.Map"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:33 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="profile" href="https://gmpg.org/xfn/11">

    <title>Projects &#8211; ProLancer</title>
    <meta name='robots' content='max-image-preview:large' />

    <style>
        .return {
            display: inline-block;
            padding: 10px 20px;
            background-color: #6787FE;
            color: #fff;
            text-decoration: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s, box-shadow 0.2s, color 0.3s;
            box-shadow: 0 5px 15px rgba(42, 65, 232, 0.3);
        }

        .return:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(42, 65, 232, 0.4);
            text-decoration: none;
            background-color: #F0F3FF;
            color: #6787FE;
            border: 1px solid #B2B2B2;
        }
    </style>


</head>

<body
    class="archive post-type-archive post-type-archive-projects wp-custom-logo theme-prolancer woocommerce-no-js elementor-default elementor-kit-1806">

    <!-- Preloading -->
    <div id="preloader">
        <div class="spinner">
            <div class="uil-ripple-css">
                <div></div>
                <div></div>
            </div>
        </div>
    </div>

        <%@include file="includes/header-login-01.jsp" %>

    <a class="skip-link screen-reader-text" href="#content">Skip to content</a>

    <!--Mobile Navigation Toggler-->
    <div class="off-canvas-menu-bar">
        <div class="container">
            <div class="row">
                <div class="col-6 my-auto">
                    <a href="../index.html" class="custom-logo-link" rel="home"><img width="500" height="71"
                            src="../wp-content/uploads/2021/09/logo.png" class="custom-logo" alt="ProLancer"
                            decoding="async"
                            srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                            sizes="(max-width: 500px) 100vw, 500px" /></a>
                </div>
                <div class="col-6">
                    <div class="mobile-nav-toggler float-end"><span class="fal fa-bars"></span></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Mobile Menu  -->
    <div class="off-canvas-menu">
        <div class="menu-backdrop"></div>
        <i class="close-btn fa fa-close"></i>
        <nav class="mobile-nav">
            <div class="text-center pt-3 pb-3">
                <a href="../index.html" class="custom-logo-link" rel="home"><img width="500" height="71"
                        src="../wp-content/uploads/2021/09/logo.png" class="custom-logo" alt="ProLancer"
                        decoding="async"
                        srcset="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo.png 500w, https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/logo-300x43.png 300w"
                        sizes="(max-width: 500px) 100vw, 500px" /></a>
            </div>

            <ul class="navigation"><!--Keep This Empty / Menu will come through Javascript--></ul>
            <div class="text-center">
                <a href="../frontend-dashboard/index6f28.html?fed=dashboard" class="prolancer-btn mt-4">
                    Dashboard </a>
            </div>
        </nav>
    </div>


    <section>
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 my-auto">
                        <h1>
                            Projects </h1>
                        <ul class="trail-items" itemscope itemtype="http://schema.org/BreadcrumbList">
                            <li class="trail-item trail-begin"><a href="../index.html"><span
                                        itemprop="name">Home</span></a>
                                <meta itemprop="position" content="1" />
                            </li>
                            <li class="trail-item trail-end"><span itemprop="item"><span
                                        itemprop="name">Projects</span></span>
                                <meta itemprop="position" content="2" />
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="section-padding">
        <div class="container">
            <div class="row justify-content-center flex-row-reverse">
                <div class="search-result col-xl-9">
                    <div class="report-container col-xl-12">
                        <!-- <%
                        //Begin process return from VNPAY
                        Map fields = new HashMap();
                        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                                fields.put(fieldName, fieldValue);
                            }
                        }
            
                        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
                        if (fields.containsKey("vnp_SecureHashType")) {
                            fields.remove("vnp_SecureHashType");
                        }
                        if (fields.containsKey("vnp_SecureHash")) {
                            fields.remove("vnp_SecureHash");
                        }
                        String signValue = Config.hashAllFields(fields);
            
                    %> -->
                        <!--Begin display -->
                        <div class="container">
                            <div class="header clearfix">
                                <h3 style="color: #6787FE; font-weight: 800;">KẾT QUẢ THANH TOÁN</h3>
                            </div>
                            <div class="">
                                <div class="form-group">
                                    <label>Mã giao dịch thanh toán:</label>
                                    <!-- <label><%=request.getParameter("vnp_TxnRef")%></label> -->
                                </div>
                                <div class="form-group">
                                    <label>Số tiền:</label>
                                    <!-- <label><%=request.getParameter("vnp_Amount")%></label> -->
                                </div>
                                <div class="form-group">
                                    <label>Mô tả giao dịch:</label>
                                    <!-- <label><%=request.getParameter("vnp_OrderInfo")%></label> -->
                                </div>
                                <div class="form-group">
                                    <label>Mã lỗi thanh toán:</label>
                                    <!-- <label><%=request.getParameter("vnp_ResponseCode")%></label> -->
                                </div>
                                <div class="form-group">
                                    <label>Mã giao dịch tại CTT VNPAY-QR:</label>
                                    <!-- <label><%=request.getParameter("vnp_TransactionNo")%></label> -->
                                </div>
                                <div class="form-group">
                                    <label>Mã ngân hàng thanh toán:</label>
                                    <!-- <label><%=request.getParameter("vnp_BankCode")%></label> -->
                                </div>
                                <div class="form-group">
                                    <label>Thời gian thanh toán:</label>
                                    <!-- <label><%=request.getParameter("vnp_PayDate")%></label> -->
                                </div>
                                <div class="form-group">
                                    <label>Tình trạng giao dịch:</label>
                                    <label>
                                        <!-- <%
                                        if (signValue.equals(vnp_SecureHash)) {
                                            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                                out.print("Thành công");
                                            } else {
                                                out.print("Không thành công");
                                            }
            
                                        } else {
                                            out.print("invalid signature");
                                        }
                                    %> -->
                                    </label>
                                </div>

                                <div style="text-align: center;">
                                <!-- <%
                                        if (signValue.equals(vnp_SecureHash)) {
                                            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {%> -->
                                <a href="./profile?action=addWallet" class="return">Quay về ví của bạn</a>
                                <!-- <%                } else {%> -->
                                <a href="./home" class="return">Quay về trang chủ</a>
                                <!-- <%                }%> -->
                            </div>
                            </div>
                            <p>
                                &nbsp;
                            </p>

                        </div>
                    </div>
                </div>
            </div>
            </aside>
        </div>
        </div>
        </div>
    </section>
                                <%@include file="includes/footer.jsp" %>

    <!--======= Back to Top =======-->
    <div id="backtotop"><i class="fal fa-lg fa-arrow-up"></i></div>



    <script>(function () {
            function maybePrefixUrlField() {
                const value = this.value.trim()
                if (value !== '' && value.indexOf('http') !== 0) {
                    this.value = 'http://' + value
                }
            }

            const urlFields = document.querySelectorAll('.mc4wp-form input[type="url"]')
            for (let j = 0; j < urlFields.length; j++) {
                urlFields[j].addEventListener('blur', maybePrefixUrlField)
            }
        })();</script>
    <script type='text/javascript'>
        const lazyloadRunObserver = () => {
            const lazyloadBackgrounds = document.querySelectorAll(`.e-con.e-parent:not(.e-lazyloaded)`);
            const lazyloadBackgroundObserver = new IntersectionObserver((entries) => {
                entries.forEach((entry) => {
                    if (entry.isIntersecting) {
                        let lazyloadBackground = entry.target;
                        if (lazyloadBackground) {
                            lazyloadBackground.classList.add('e-lazyloaded');
                        }
                        lazyloadBackgroundObserver.unobserve(entry.target);
                    }
                });
            }, { rootMargin: '200px 0px 200px 0px' });
            lazyloadBackgrounds.forEach((lazyloadBackground) => {
                lazyloadBackgroundObserver.observe(lazyloadBackground);
            });
        };
        const events = [
            'DOMContentLoaded',
            'elementor/lazyload/observe',
        ];
        events.forEach((event) => {
            document.addEventListener(event, lazyloadRunObserver);
        });
    </script>
    <script type='text/javascript'>
        (function () {
            var c = document.body.className;
            c = c.replace(/woocommerce-no-js/, 'woocommerce-js');
            document.body.className = c;
        })();
    </script>
    <link rel='stylesheet' id='wc-blocks-style-css'
        href='../wp-content/plugins/woocommerce/assets/client/blocks/wc-blocksfbdf.css?ver=wc-9.5.1' type='text/css'
        media='all' />
    <link rel='stylesheet' id='redux-custom-fonts-css'
        href='../wp-content/uploads/redux/custom-fonts/fonts4c5e.css?ver=1736760649' type='text/css' media='all' />
    <link rel='stylesheet' id='elementor-frontend-css'
        href='../wp-content/uploads/elementor/css/custom-frontend.mindc89.css?ver=1734726326' type='text/css'
        media='all' />
    <link rel='stylesheet' id='elementor-post-1803-css'
        href='../wp-content/uploads/elementor/css/post-1803fa5d.css?ver=1734726324' type='text/css' media='all' />
    <link rel='stylesheet' id='widget-image-css'
        href='../wp-content/plugins/elementor/assets/css/widget-image.min7ac2.css?ver=3.26.3' type='text/css'
        media='all' />
    <link rel='stylesheet' id='widget-heading-css'
        href='../wp-content/plugins/elementor/assets/css/widget-heading.min7ac2.css?ver=3.26.3' type='text/css'
        media='all' />
    <link rel='stylesheet' id='widget-icon-list-css'
        href='../wp-content/uploads/elementor/css/custom-widget-icon-list.mindc89.css?ver=1734726326' type='text/css'
        media='all' />
    <link rel='stylesheet' id='elementor-icons-css'
        href='../wp-content/plugins/elementor/assets/lib/eicons/css/elementor-icons.min705c.css?ver=5.34.0'
        type='text/css' media='all' />
    <link rel='stylesheet' id='elementor-post-1806-css'
        href='../wp-content/uploads/elementor/css/post-180621ee.css?ver=1734726327' type='text/css' media='all' />
    <link rel='stylesheet' id='google-fonts-1-css'
        href='https://fonts.googleapis.com/css?family=Rubik%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CPoppins%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CRoboto+Slab%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CRoboto%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic&amp;display=auto&amp;ver=6.7.1'
        type='text/css' media='all' />
    <script type="text/javascript" src="../wp-includes/js/dist/hooks.min4fdd.js?ver=4d63a3d491d11ffd8ac6"
        id="wp-hooks-js"></script>
    <script type="text/javascript" src="../wp-includes/js/dist/i18n.minc33c.js?ver=5e580eb46a90c2b997e6"
        id="wp-i18n-js"></script>
    <script type="text/javascript" id="wp-i18n-js-after">
        /* <![CDATA[ */
        wp.i18n.setLocaleData({ 'text direction\u0004ltr': ['ltr'] });
        /* ]]> */
    </script>
    <script type="text/javascript" src="../wp-content/plugins/contact-form-7/includes/swv/js/index5b21.js?ver=6.0.2"
        id="swv-js"></script>
    <script type="text/javascript" id="contact-form-7-js-before">
        /* <![CDATA[ */
        var wpcf7 = {
            "api": {
                "root": "https:\/\/themebing.com\/wp\/prolancer\/wp-json\/",
                "namespace": "contact-form-7\/v1"
            }
        };
        /* ]]> */
    </script>
    <script type="text/javascript" src="../wp-content/plugins/contact-form-7/includes/js/index5b21.js?ver=6.0.2"
        id="contact-form-7-js"></script>
    <script type="text/javascript" src="../../../../www.gstatic.com/charts/loader47a7.js?ver=1.4.5"
        id="charts-js"></script>
    <script type="text/javascript" src="../wp-content/plugins/prolancer-element/assets/js/rating47a7.js?ver=1.4.5"
        id="rating-js"></script>
    <script type="text/javascript"
        src="../wp-content/plugins/prolancer-element/assets/js/sweetalert2.min47a7.js?ver=1.4.5"
        id="sweetalert2-js"></script>
    <script type="text/javascript" src="../wp-content/plugins/prolancer-element/assets/js/select2.min47a7.js?ver=1.4.5"
        id="prolancer-select2-js"></script>
    <script type="text/javascript" src="../wp-content/plugins/prolancer-element/assets/js/plugins47a7.js?ver=1.4.5"
        id="prolancer-plugins-js"></script>
    <script type="text/javascript" src="../wp-includes/js/jquery/ui/core.minb37e.js?ver=1.13.3"
        id="jquery-ui-core-js"></script>
    <script type="text/javascript" src="../wp-includes/js/jquery/ui/mouse.minb37e.js?ver=1.13.3"
        id="jquery-ui-mouse-js"></script>
    <script type="text/javascript" src="../wp-includes/js/jquery/ui/sortable.minb37e.js?ver=1.13.3"
        id="jquery-ui-sortable-js"></script>
    <script type="text/javascript" id="prolancer-app-js-extra">
        /* <![CDATA[ */
        var prolancer_projects_views = { "data": "" };
        /* ]]> */
    </script>
    <script type="text/javascript" src="../wp-content/plugins/prolancer-element/assets/js/app47a7.js?ver=1.4.5"
        id="prolancer-app-js"></script>
    <script type="text/javascript" id="prolancer-main-js-extra">
        /* <![CDATA[ */
        var prolancerAjaxUrlObj = { "ajaxurl": "https:\/\/themebing.com\/wp\/prolancer\/wp-admin\/admin-ajax.php", "logo": "https:\/\/themebing.com\/wp\/prolancer\/wp-content\/uploads\/2021\/09\/logo.png", "alt_logo": "https:\/\/themebing.com\/wp\/prolancer\/wp-content\/uploads\/2021\/09\/logo-alt.png" };
        /* ]]> */
    </script>
    <script type="text/javascript" src="../wp-content/themes/prolancer/assets/js/main47a7.js?ver=1.4.5"
        id="prolancer-main-js"></script>
    <script type="text/javascript" id="prolancer-plugin-js-extra">
        /* <![CDATA[ */
        var prolancerPluginAjaxObj = { "ajaxurl": "https:\/\/themebing.com\/wp\/prolancer\/wp-admin\/admin-ajax.php" };
        /* ]]> */
    </script>
    <script type="text/javascript" src="../wp-content/plugins/prolancer-element/assets/js/plugin47a7.js?ver=1.4.5"
        id="prolancer-plugin-js"></script>
    <script type="text/javascript"
        src="../wp-content/plugins/prolancer-element/inc/mega-menu/assets/js/mega-menu47a7.js?ver=1.4.5"
        id="prolancer-mega-menu-js"></script>
    <script type="text/javascript" src="../wp-content/themes/prolancer/assets/js/bootstrap.min47a7.js?ver=1.4.5"
        id="bootstrap-js"></script>
    <script type="text/javascript"
        src="../wp-content/themes/prolancer/assets/js/jquery.magnific-popup.min47a7.js?ver=1.4.5"
        id="magnific-popup-js"></script>
    <script type="text/javascript" src="../wp-content/themes/prolancer/assets/js/skip-link-focus-fix47a7.js?ver=1.4.5"
        id="prolancer-skip-link-focus-fix-js"></script>
    <script type="text/javascript"
        src="../wp-content/plugins/woocommerce/assets/js/sourcebuster/sourcebuster.min0c46.js?ver=9.5.1"
        id="sourcebuster-js-js"></script>
    <script type="text/javascript" id="wc-order-attribution-js-extra">
        /* <![CDATA[ */
        var wc_order_attribution = { "params": { "lifetime": 1.0e-5, "session": 30, "base64": false, "ajaxurl": "https:\/\/themebing.com\/wp\/prolancer\/wp-admin\/admin-ajax.php", "prefix": "wc_order_attribution_", "allowTracking": true }, "fields": { "source_type": "current.typ", "referrer": "current_add.rf", "utm_campaign": "current.cmp", "utm_source": "current.src", "utm_medium": "current.mdm", "utm_content": "current.cnt", "utm_id": "current.id", "utm_term": "current.trm", "utm_source_platform": "current.plt", "utm_creative_format": "current.fmt", "utm_marketing_tactic": "current.tct", "session_entry": "current_add.ep", "session_start_time": "current_add.fd", "session_pages": "session.pgs", "session_count": "udata.vst", "user_agent": "udata.uag" } };
        /* ]]> */
    </script>
    <script type="text/javascript"
        src="../wp-content/plugins/woocommerce/assets/js/frontend/order-attribution.min0c46.js?ver=9.5.1"
        id="wc-order-attribution-js"></script>
    <script type="text/javascript" defer src="../wp-content/plugins/mailchimp-for-wp/assets/js/forms4b0b.js?ver=4.9.20"
        id="mc4wp-forms-api-js"></script>
    <script type="text/javascript" src="../wp-content/plugins/elementor/assets/js/webpack.runtime.min7ac2.js?ver=3.26.3"
        id="elementor-webpack-runtime-js"></script>
    <script type="text/javascript"
        src="../wp-content/plugins/elementor/assets/js/frontend-modules.min7ac2.js?ver=3.26.3"
        id="elementor-frontend-modules-js"></script>
    <script type="text/javascript" id="elementor-frontend-js-before">
        /* <![CDATA[ */
        var elementorFrontendConfig = { "environmentMode": { "edit": false, "wpPreview": false, "isScriptDebug": false }, "i18n": { "shareOnFacebook": "Share on Facebook", "shareOnTwitter": "Share on Twitter", "pinIt": "Pin it", "download": "Download", "downloadImage": "Download image", "fullscreen": "Fullscreen", "zoom": "Zoom", "share": "Share", "playVideo": "Play Video", "previous": "Previous", "next": "Next", "close": "Close", "a11yCarouselPrevSlideMessage": "Previous slide", "a11yCarouselNextSlideMessage": "Next slide", "a11yCarouselFirstSlideMessage": "This is the first slide", "a11yCarouselLastSlideMessage": "This is the last slide", "a11yCarouselPaginationBulletMessage": "Go to slide" }, "is_rtl": false, "breakpoints": { "xs": 0, "sm": 480, "md": 769, "lg": 993, "xl": 1440, "xxl": 1600 }, "responsive": { "breakpoints": { "mobile": { "label": "Mobile Portrait", "value": 768, "default_value": 767, "direction": "max", "is_enabled": true }, "mobile_extra": { "label": "Mobile Landscape", "value": 880, "default_value": 880, "direction": "max", "is_enabled": false }, "tablet": { "label": "Tablet Portrait", "value": 992, "default_value": 1024, "direction": "max", "is_enabled": true }, "tablet_extra": { "label": "Tablet Landscape", "value": 1200, "default_value": 1200, "direction": "max", "is_enabled": false }, "laptop": { "label": "Laptop", "value": 1200, "default_value": 1366, "direction": "max", "is_enabled": true }, "widescreen": { "label": "Widescreen", "value": 1400, "default_value": 2400, "direction": "min", "is_enabled": true } }, "hasCustomBreakpoints": true }, "version": "3.26.3", "is_static": false, "experimentalFeatures": { "additional_custom_breakpoints": true, "e_swiper_latest": true, "e_nested_atomic_repeaters": true, "e_onboarding": true, "e_css_smooth_scroll": true, "home_screen": true, "landing-pages": true, "nested-elements": true, "editor_v2": true, "link-in-bio": true, "floating-buttons": true }, "urls": { "assets": "https:\/\/themebing.com\/wp\/prolancer\/wp-content\/plugins\/elementor\/assets\/", "ajaxurl": "https:\/\/themebing.com\/wp\/prolancer\/wp-admin\/admin-ajax.php", "uploadUrl": "https:\/\/themebing.com\/wp\/prolancer\/wp-content\/uploads" }, "nonces": { "floatingButtonsClickTracking": "d146a643f2" }, "swiperClass": "swiper", "settings": { "editorPreferences": [] }, "kit": { "active_breakpoints": ["viewport_mobile", "viewport_tablet", "viewport_laptop", "viewport_widescreen"], "viewport_mobile": 768, "viewport_tablet": 992, "viewport_laptop": 1200, "viewport_widescreen": 1400, "global_image_lightbox": "yes", "lightbox_enable_counter": "yes", "lightbox_enable_fullscreen": "yes", "lightbox_enable_zoom": "yes", "lightbox_enable_share": "yes", "lightbox_title_src": "title", "lightbox_description_src": "description" }, "post": { "id": 0, "title": "Projects &#8211; ProLancer", "excerpt": "<p>Description.<\/p>\n" } };
        /* ]]> */
    </script>
    <script type="text/javascript" src="../wp-content/plugins/elementor/assets/js/frontend.min7ac2.js?ver=3.26.3"
        id="elementor-frontend-js"></script>

    <script>(function () { function c() { var b = a.contentDocument || a.contentWindow.document; if (b) { var d = b.createElement('script'); d.innerHTML = "window.__CF$cv$params={r:'90145e9ebbb96c05',t:'MTczNjc2MDY1MC4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='../../../cdn-cgi/challenge-platform/h/b/scripts/jsd/e0c90b6a3ed1/maind41d.js';document.getElementsByTagName('head')[0].appendChild(a);"; b.getElementsByTagName('head')[0].appendChild(d) } } if (document.body) { var a = document.createElement('iframe'); a.height = 1; a.width = 1; a.style.position = 'absolute'; a.style.top = 0; a.style.left = 0; a.style.border = 'none'; a.style.visibility = 'hidden'; document.body.appendChild(a); if ('loading' !== document.readyState) c(); else if (window.addEventListener) document.addEventListener('DOMContentLoaded', c); else { var e = document.onreadystatechange || function () { }; document.onreadystatechange = function (b) { e(b); 'loading' !== document.readyState && (document.onreadystatechange = e, c()) } } } })();</script>



</body>

<!-- Mirrored from themebing.com/wp/prolancer/projects/?projects-layout=projects_left_sidebar by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 Jan 2025 09:33:35 GMT -->

</html>

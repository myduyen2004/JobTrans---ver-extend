<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    /* <![CDATA[ */
    window._wpemojiSettings = {
        "baseUrl": "https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/72x72\/",
        "ext": ".png",
        "svgUrl": "https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/svg\/",
        "svgExt": ".svg",
        "source": {"concatemoji": "https:\/\/themebing.com\/wp\/prolancer\/wp-includes\/js\/wp-emoji-release.min.js?ver=6.7.1"}
    };
    /*! This file is auto-generated */
    !function (i, n) {
        var o, s, e;

        function c(e) {
            try {
                var t = {supportTests: e, timestamp: (new Date).valueOf()};
                sessionStorage.setItem(o, JSON.stringify(t))
            } catch (e) {
            }
        }

        function p(e, t, n) {
            e.clearRect(0, 0, e.canvas.width, e.canvas.height), e.fillText(t, 0, 0);
            var t = new Uint32Array(e.getImageData(0, 0, e.canvas.width, e.canvas.height).data),
                r = (e.clearRect(0, 0, e.canvas.width, e.canvas.height), e.fillText(n, 0, 0), new Uint32Array(e.getImageData(0, 0, e.canvas.width, e.canvas.height).data));
            return t.every(function (e, t) {
                return e === r[t]
            })
        }

        function u(e, t, n) {
            switch (t) {
                case"flag":
                    return n(e, "\ud83c\udff3\ufe0f\u200d\u26a7\ufe0f", "\ud83c\udff3\ufe0f\u200b\u26a7\ufe0f") ? !1 : !n(e, "\ud83c\uddfa\ud83c\uddf3", "\ud83c\uddfa\u200b\ud83c\uddf3") && !n(e, "\ud83c\udff4\udb40\udc67\udb40\udc62\udb40\udc65\udb40\udc6e\udb40\udc67\udb40\udc7f", "\ud83c\udff4\u200b\udb40\udc67\u200b\udb40\udc62\u200b\udb40\udc65\u200b\udb40\udc6e\u200b\udb40\udc67\u200b\udb40\udc7f");
                case"emoji":
                    return !n(e, "\ud83d\udc26\u200d\u2b1b", "\ud83d\udc26\u200b\u2b1b")
            }
            return !1
        }

        function f(e, t, n) {
            var r = "undefined" != typeof WorkerGlobalScope && self instanceof WorkerGlobalScope ? new OffscreenCanvas(300, 150) : i.createElement("canvas"),
                a = r.getContext("2d", {willReadFrequently: !0}),
                o = (a.textBaseline = "top", a.font = "600 32px Arial", {});
            return e.forEach(function (e) {
                o[e] = t(a, e, n)
            }), o
        }

        function t(e) {
            var t = i.createElement("script");
            t.src = e, t.defer = !0, i.head.appendChild(t)
        }

        "undefined" != typeof Promise && (o = "wpEmojiSettingsSupports", s = ["flag", "emoji"], n.supports = {
            everything: !0,
            everythingExceptFlag: !0
        }, e = new Promise(function (e) {
            i.addEventListener("DOMContentLoaded", e, {once: !0})
        }), new Promise(function (t) {
            var n = function () {
                try {
                    var e = JSON.parse(sessionStorage.getItem(o));
                    if ("object" == typeof e && "number" == typeof e.timestamp && (new Date).valueOf() < e.timestamp + 604800 && "object" == typeof e.supportTests) return e.supportTests
                } catch (e) {
                }
                return null
            }();
            if (!n) {
                if ("undefined" != typeof Worker && "undefined" != typeof OffscreenCanvas && "undefined" != typeof URL && URL.createObjectURL && "undefined" != typeof Blob) try {
                    var e = "postMessage(" + f.toString() + "(" + [JSON.stringify(s), u.toString(), p.toString()].join(",") + "));",
                        r = new Blob([e], {type: "text/javascript"}),
                        a = new Worker(URL.createObjectURL(r), {name: "wpTestEmojiSupports"});
                    return void (a.onmessage = function (e) {
                        c(n = e.data), a.terminate(), t(n)
                    })
                } catch (e) {
                }
                c(n = f(s, u, p))
            }
            t(n)
        }).then(function (e) {
            for (var t in e) n.supports[t] = e[t], n.supports.everything = n.supports.everything && n.supports[t], "flag" !== t && (n.supports.everythingExceptFlag = n.supports.everythingExceptFlag && n.supports[t]);
            n.supports.everythingExceptFlag = n.supports.everythingExceptFlag && !n.supports.flag, n.DOMReady = !1, n.readyCallback = function () {
                n.DOMReady = !0
            }
        }).then(function () {
            return e
        }).then(function () {
            var e;
            n.supports.everything || (n.readyCallback(), (e = n.source || {}).concatemoji ? t(e.concatemoji) : e.wpemoji && e.twemoji && (t(e.twemoji), t(e.wpemoji)))
        }))
    }((window, document), window._wpemojiSettings);
    /* ]]> */
</script>

<style id='wp-emoji-styles-inline-css' type='text/css'>

    img.wp-smiley, img.emoji {
        display: inline !important;
        border: none !important;
        box-shadow: none !important;
        height: 1em !important;
        width: 1em !important;
        margin: 0 0.07em !important;
        vertical-align: -0.1em !important;
        background: none !important;
        padding: 0 !important;
    }
</style>
<style id='classic-theme-styles-inline-css' type='text/css'>
    /*! This file is auto-generated */
    .wp-block-button__link {
        color: #fff;
        background-color: #32373c;
        border-radius: 9999px;
        box-shadow: none;
        text-decoration: none;
        padding: calc(.667em + 2px) calc(1.333em + 2px);
        font-size: 1.125em
    }

    .wp-block-file__button {
        background: #32373c;
        color: #fff;
        text-decoration: none
    }
</style>
<style id='global-styles-inline-css' type='text/css'>
    :root {
        --wp--preset--aspect-ratio--square: 1;
        --wp--preset--aspect-ratio--4-3: 4/3;
        --wp--preset--aspect-ratio--3-4: 3/4;
        --wp--preset--aspect-ratio--3-2: 3/2;
        --wp--preset--aspect-ratio--2-3: 2/3;
        --wp--preset--aspect-ratio--16-9: 16/9;
        --wp--preset--aspect-ratio--9-16: 9/16;
        --wp--preset--color--black: #000000;
        --wp--preset--color--cyan-bluish-gray: #abb8c3;
        --wp--preset--color--white: #ffffff;
        --wp--preset--color--pale-pink: #f78da7;
        --wp--preset--color--vivid-red: #cf2e2e;
        --wp--preset--color--luminous-vivid-orange: #ff6900;
        --wp--preset--color--luminous-vivid-amber: #fcb900;
        --wp--preset--color--light-green-cyan: #7bdcb5;
        --wp--preset--color--vivid-green-cyan: #00d084;
        --wp--preset--color--pale-cyan-blue: #8ed1fc;
        --wp--preset--color--vivid-cyan-blue: #0693e3;
        --wp--preset--color--vivid-purple: #9b51e0;
        --wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg, rgba(6, 147, 227, 1) 0%, rgb(155, 81, 224) 100%);
        --wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg, rgb(122, 220, 180) 0%, rgb(0, 208, 130) 100%);
        --wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg, rgba(252, 185, 0, 1) 0%, rgba(255, 105, 0, 1) 100%);
        --wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg, rgba(255, 105, 0, 1) 0%, rgb(207, 46, 46) 100%);
        --wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg, rgb(238, 238, 238) 0%, rgb(169, 184, 195) 100%);
        --wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg, rgb(74, 234, 220) 0%, rgb(151, 120, 209) 20%, rgb(207, 42, 186) 40%, rgb(238, 44, 130) 60%, rgb(251, 105, 98) 80%, rgb(254, 248, 76) 100%);
        --wp--preset--gradient--blush-light-purple: linear-gradient(135deg, rgb(255, 206, 236) 0%, rgb(152, 150, 240) 100%);
        --wp--preset--gradient--blush-bordeaux: linear-gradient(135deg, rgb(254, 205, 165) 0%, rgb(254, 45, 45) 50%, rgb(107, 0, 62) 100%);
        --wp--preset--gradient--luminous-dusk: linear-gradient(135deg, rgb(255, 203, 112) 0%, rgb(199, 81, 192) 50%, rgb(65, 88, 208) 100%);
        --wp--preset--gradient--pale-ocean: linear-gradient(135deg, rgb(255, 245, 203) 0%, rgb(182, 227, 212) 50%, rgb(51, 167, 181) 100%);
        --wp--preset--gradient--electric-grass: linear-gradient(135deg, rgb(202, 248, 128) 0%, rgb(113, 206, 126) 100%);
        --wp--preset--gradient--midnight: linear-gradient(135deg, rgb(2, 3, 129) 0%, rgb(40, 116, 252) 100%);
        --wp--preset--font-size--small: 13px;
        --wp--preset--font-size--medium: 20px;
        --wp--preset--font-size--large: 36px;
        --wp--preset--font-size--x-large: 42px;
        --wp--preset--font-family--inter: "Inter", sans-serif;
        --wp--preset--font-family--cardo: Cardo;
        --wp--preset--spacing--20: 0.44rem;
        --wp--preset--spacing--30: 0.67rem;
        --wp--preset--spacing--40: 1rem;
        --wp--preset--spacing--50: 1.5rem;
        --wp--preset--spacing--60: 2.25rem;
        --wp--preset--spacing--70: 3.38rem;
        --wp--preset--spacing--80: 5.06rem;
        --wp--preset--shadow--natural: 6px 6px 9px rgba(0, 0, 0, 0.2);
        --wp--preset--shadow--deep: 12px 12px 50px rgba(0, 0, 0, 0.4);
        --wp--preset--shadow--sharp: 6px 6px 0px rgba(0, 0, 0, 0.2);
        --wp--preset--shadow--outlined: 6px 6px 0px -3px rgba(255, 255, 255, 1), 6px 6px rgba(0, 0, 0, 1);
        --wp--preset--shadow--crisp: 6px 6px 0px rgba(0, 0, 0, 1);
    }

    :where(.is-layout-flex) {
        gap: 0.5em;
    }

    :where(.is-layout-grid) {
        gap: 0.5em;
    }

    body .is-layout-flex {
        display: flex;
    }

    .is-layout-flex {
        flex-wrap: wrap;
        align-items: center;
    }

    .is-layout-flex > :is(*, div) {
        margin: 0;
    }

    body .is-layout-grid {
        display: grid;
    }

    .is-layout-grid > :is(*, div) {
        margin: 0;
    }

    :where(.wp-block-columns.is-layout-flex) {
        gap: 2em;
    }

    :where(.wp-block-columns.is-layout-grid) {
        gap: 2em;
    }

    :where(.wp-block-post-template.is-layout-flex) {
        gap: 1.25em;
    }

    :where(.wp-block-post-template.is-layout-grid) {
        gap: 1.25em;
    }

    .has-black-color {
        color: var(--wp--preset--color--black) !important;
    }

    .has-cyan-bluish-gray-color {
        color: var(--wp--preset--color--cyan-bluish-gray) !important;
    }

    .has-white-color {
        color: var(--wp--preset--color--white) !important;
    }

    .has-pale-pink-color {
        color: var(--wp--preset--color--pale-pink) !important;
    }

    .has-vivid-red-color {
        color: var(--wp--preset--color--vivid-red) !important;
    }

    .has-luminous-vivid-orange-color {
        color: var(--wp--preset--color--luminous-vivid-orange) !important;
    }

    .has-luminous-vivid-amber-color {
        color: var(--wp--preset--color--luminous-vivid-amber) !important;
    }

    .has-light-green-cyan-color {
        color: var(--wp--preset--color--light-green-cyan) !important;
    }

    .has-vivid-green-cyan-color {
        color: var(--wp--preset--color--vivid-green-cyan) !important;
    }

    .has-pale-cyan-blue-color {
        color: var(--wp--preset--color--pale-cyan-blue) !important;
    }

    .has-vivid-cyan-blue-color {
        color: var(--wp--preset--color--vivid-cyan-blue) !important;
    }

    .has-vivid-purple-color {
        color: var(--wp--preset--color--vivid-purple) !important;
    }

    .has-black-background-color {
        background-color: var(--wp--preset--color--black) !important;
    }

    .has-cyan-bluish-gray-background-color {
        background-color: var(--wp--preset--color--cyan-bluish-gray) !important;
    }

    .has-white-background-color {
        background-color: var(--wp--preset--color--white) !important;
    }

    .has-pale-pink-background-color {
        background-color: var(--wp--preset--color--pale-pink) !important;
    }

    .has-vivid-red-background-color {
        background-color: var(--wp--preset--color--vivid-red) !important;
    }

    .has-luminous-vivid-orange-background-color {
        background-color: var(--wp--preset--color--luminous-vivid-orange) !important;
    }

    .has-luminous-vivid-amber-background-color {
        background-color: var(--wp--preset--color--luminous-vivid-amber) !important;
    }

    .has-light-green-cyan-background-color {
        background-color: var(--wp--preset--color--light-green-cyan) !important;
    }

    .has-vivid-green-cyan-background-color {
        background-color: var(--wp--preset--color--vivid-green-cyan) !important;
    }

    .has-pale-cyan-blue-background-color {
        background-color: var(--wp--preset--color--pale-cyan-blue) !important;
    }

    .has-vivid-cyan-blue-background-color {
        background-color: var(--wp--preset--color--vivid-cyan-blue) !important;
    }

    .has-vivid-purple-background-color {
        background-color: var(--wp--preset--color--vivid-purple) !important;
    }

    .has-black-border-color {
        border-color: var(--wp--preset--color--black) !important;
    }

    .has-cyan-bluish-gray-border-color {
        border-color: var(--wp--preset--color--cyan-bluish-gray) !important;
    }

    .has-white-border-color {
        border-color: var(--wp--preset--color--white) !important;
    }

    .has-pale-pink-border-color {
        border-color: var(--wp--preset--color--pale-pink) !important;
    }

    .has-vivid-red-border-color {
        border-color: var(--wp--preset--color--vivid-red) !important;
    }

    .has-luminous-vivid-orange-border-color {
        border-color: var(--wp--preset--color--luminous-vivid-orange) !important;
    }

    .has-luminous-vivid-amber-border-color {
        border-color: var(--wp--preset--color--luminous-vivid-amber) !important;
    }

    .has-light-green-cyan-border-color {
        border-color: var(--wp--preset--color--light-green-cyan) !important;
    }

    .has-vivid-green-cyan-border-color {
        border-color: var(--wp--preset--color--vivid-green-cyan) !important;
    }

    .has-pale-cyan-blue-border-color {
        border-color: var(--wp--preset--color--pale-cyan-blue) !important;
    }

    .has-vivid-cyan-blue-border-color {
        border-color: var(--wp--preset--color--vivid-cyan-blue) !important;
    }

    .has-vivid-purple-border-color {
        border-color: var(--wp--preset--color--vivid-purple) !important;
    }

    .has-vivid-cyan-blue-to-vivid-purple-gradient-background {
        background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;
    }

    .has-light-green-cyan-to-vivid-green-cyan-gradient-background {
        background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;
    }

    .has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background {
        background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;
    }

    .has-luminous-vivid-orange-to-vivid-red-gradient-background {
        background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;
    }

    .has-very-light-gray-to-cyan-bluish-gray-gradient-background {
        background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;
    }

    .has-cool-to-warm-spectrum-gradient-background {
        background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;
    }

    .has-blush-light-purple-gradient-background {
        background: var(--wp--preset--gradient--blush-light-purple) !important;
    }

    .has-blush-bordeaux-gradient-background {
        background: var(--wp--preset--gradient--blush-bordeaux) !important;
    }

    .has-luminous-dusk-gradient-background {
        background: var(--wp--preset--gradient--luminous-dusk) !important;
    }

    .has-pale-ocean-gradient-background {
        background: var(--wp--preset--gradient--pale-ocean) !important;
    }

    .has-electric-grass-gradient-background {
        background: var(--wp--preset--gradient--electric-grass) !important;
    }

    .has-midnight-gradient-background {
        background: var(--wp--preset--gradient--midnight) !important;
    }

    .has-small-font-size {
        font-size: var(--wp--preset--font-size--small) !important;
    }

    .has-medium-font-size {
        font-size: var(--wp--preset--font-size--medium) !important;
    }

    .has-large-font-size {
        font-size: var(--wp--preset--font-size--large) !important;
    }

    .has-x-large-font-size {
        font-size: var(--wp--preset--font-size--x-large) !important;
    }

    :where(.wp-block-post-template.is-layout-flex) {
        gap: 1.25em;
    }

    :where(.wp-block-post-template.is-layout-grid) {
        gap: 1.25em;
    }

    :where(.wp-block-columns.is-layout-flex) {
        gap: 2em;
    }

    :where(.wp-block-columns.is-layout-grid) {
        gap: 2em;
    }

    :root :where(.wp-block-pullquote) {
        font-size: 1.5em;
        line-height: 1.6;
    }
</style>
<link rel='stylesheet' id='contact-form-7-css'
      href='wp-content/plugins/contact-form-7/includes/css/styles5b21.css?ver=6.0.2' type='text/css' media='all'/>
<link rel='stylesheet' id='richtext-css'
      href='wp-content/plugins/prolancer-element/assets/css/richtext.min9704.css?ver=6.7.1' type='text/css'
      media='all'/>
<link rel='stylesheet' id='prolancer-select2-css'
      href='wp-content/plugins/prolancer-element/assets/css/select2.min9704.css?ver=6.7.1' type='text/css' media='all'/>
<link rel='stylesheet' id='prolancer-dashboard-css'
      href='wp-content/plugins/prolancer-element/assets/css/dashboard9704.css?ver=6.7.1' type='text/css' media='all'/>
<link rel='stylesheet' id='slick-theme-css'
      href='wp-content/plugins/prolancer-element/assets/css/slick-theme9704.css?ver=6.7.1' type='text/css' media='all'/>
<link rel='stylesheet' id='prolancer-plugins-css'
      href='wp-content/plugins/prolancer-element/assets/css/plugins9704.css?ver=6.7.1' type='text/css' media='all'/>
<link rel='stylesheet' id='prolancer-plugin-css'
      href='wp-content/plugins/prolancer-element/assets/css/plugin9704.css?ver=6.7.1' type='text/css' media='all'/>
<link rel='stylesheet' id='prolancer-mega-menu-css'
      href='wp-content/plugins/prolancer-element/inc/mega-menu/assets/css/mega-menu9704.css?ver=6.7.1' type='text/css'
      media='all'/>
<link rel='stylesheet' id='woocommerce-layout-css'
      href='wp-content/plugins/woocommerce/assets/css/woocommerce-layout0c46.css?ver=9.5.1' type='text/css'
      media='all'/>
<link rel='stylesheet' id='woocommerce-smallscreen-css'
      href='wp-content/plugins/woocommerce/assets/css/woocommerce-smallscreen0c46.css?ver=9.5.1' type='text/css'
      media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' id='woocommerce-general-css'
      href='wp-content/plugins/woocommerce/assets/css/woocommerce0c46.css?ver=9.5.1' type='text/css' media='all'/>

<style id='woocommerce-inline-inline-css' type='text/css'>
    .woocommerce form .form-row .required {
        visibility: visible;
    }
</style>
<link rel='stylesheet' id='prolancer-fonts-css'
      href='https://fonts.googleapis.com/css?family=Rubik%3A300%2C400%2C500%2C700%2C900&amp;subset=latin%2Clatin-ext&amp;display=fallback&amp;ver=6.7.1'
      type='text/css' media='all'/>
<link rel='stylesheet' id='animate-css' href='wp-content/themes/prolancer/assets/css/animate.min9704.css?ver=6.7.1'
      type='text/css' media='all'/>
<link rel='stylesheet' id='prolancer-default-css'
      href='wp-content/themes/prolancer/assets/css/default9704.css?ver=6.7.1' type='text/css' media='all'/>
<link rel='stylesheet' id='magnific-popup-css'
      href='wp-content/themes/prolancer/assets/css/magnific-popup.min9704.css?ver=6.7.1' type='text/css' media='all'/>
<link rel='stylesheet' id='fontawesome-css'
      href='wp-content/themes/prolancer/assets/css/fontawesome.min9704.css?ver=6.7.1' type='text/css' media='all'/>
<link rel='stylesheet' id='bootstrap-css' href='wp-content/themes/prolancer/assets/css/bootstrap.min9704.css?ver=6.7.1'
      type='text/css' media='all'/>
<link rel='stylesheet' id='prolancer-style-css' href='wp-content/themes/prolancer/style9704.css?ver=6.7.1'
      type='text/css' media='all'/>
<style id='prolancer-style-inline-css' type='text/css'>

    .featured-post, .notifications-widget .notifications-button span, .wp-block-search .wp-block-search__button, .sellers .slick-arrow.fa-chevron-left, .sellers .slick-arrow.fa-chevron-right, .buyers .slick-arrow.fa-chevron-left, .buyers .slick-arrow.fa-chevron-right, .services .slick-arrow.fa-chevron-left, .services .slick-arrow.fa-chevron-right, .projects .slick-arrow.fa-chevron-left, .projects .slick-arrow.fa-chevron-right, .page-links a.post-page-numbers, .my-account-widget i, .brands_form input[type="submit"], .header-btn a:hover, .top-header .ajax-search-form button, .service-widget .skills a:hover, .follow-button:hover, .message-button:hover, .progress-bar, .irs--round .irs-from, .irs--round .irs-to, .irs--round .irs-bar, .prolancer-rgb-btn:hover, .skills-required a:hover, .select2-container--default .select2-selection--multiple .select2-selection__choice, .message_sender, .feds-user-profile a, .shopping-cart-widget i, .countdown-date span, .preview-btn li a:hover, #backtotop i, .product-item-content .add_to_cart_button:hover, .product-item-content .added_to_cart:hover, .comment-navigation .nav-links a, .select-items div:hover, .same-as-selected, .mean-container .mean-nav ul li a.mean-expand:hover, button, input[type="button"], .widget_price_filter .ui-slider .ui-slider-range, .widget_price_filter .ui-slider .ui-slider-handle, input[type="reset"], .off-canvas-menu .navigation li > a:hover, .off-canvas-menu .navigation .dropdown-btn:hover, .off-canvas-menu .navigation li .cart-contents, input[type="submit"], .prolancer-search-btn, .video-item .view-detail, .widget-product-details .widget-add-to-cart .variations .value .variation-radios [type="radio"]:checked + label:after, .single-product .product_meta .tagged_as a:hover, .single-product .product_meta .posted_in a:hover, .widget-product-details .widget-add-to-cart .variations .value .variation-radios [type="radio"]:not(:checked) + label:after, .widget_shopping_cart_content .button, .banner2 .banner-cat .cat-count, ul.banner-button li:first-child a, ul.banner-button li a:hover, .prolancer-pricing-table.recommended, .prolancer-pricing-table a:hover, .wedocs-single-wrap .wedocs-sidebar ul.doc-nav-list > li.current_page_parent > a, .wedocs-single-wrap .wedocs-sidebar ul.doc-nav-list > li.current_page_item > a, .wedocs-single-wrap .wedocs-sidebar ul.doc-nav-list > li.current_page_ancestor > a, .primary-menu ul li .children li.current-menu-item > a, .recent-themes-widget, .newest-filter ul li.select-cat, .download-filter ul li.select-cat, input[type="button"], input[type="reset"], input[type="submit"], .checkout-button, .tag-cloud-link:hover, .prolancer-btn, .prolancer-btn.bordered:hover, .post-navigation .nav-previous a, .post-navigation .nav-next a, .blog-btn .btn:hover, .mean-container .mean-nav, .recent-theme-item .permalink, .banner-item-btn a, .meta-attributes li span a:hover, .theme-item-price span, .error-404 a, .product-item-image .onsale, .theme-item-btn a:hover, .theme-banner-btn a, .comment-list .comment-reply-link, .comment-form input[type=submit], .pagination .nav-links .page-numbers.current, .pagination .nav-links .page-numbers:hover, .excerpt-date, .woocommerce-MyAccount-navigation li.is-active a, .primary-menu ul li .children li a:hover, .header-btn .sub-menu li a:hover, a.product_type_variable, a.product_type_simple, a.product_type_external, a.product_type_grouped, a.add_to_cart_button, a.added_to_cart, .tags > a:hover, .single-post .post-share ul li a:hover, .playerContainer .seekBar .outer .inner, .playerContainer .volumeControl .outer .inner {
        background: #6787FE;
    }

    .prolancer-service-item.style-1 .service-price h4, .prolancer-project-item.style-1 ul li, .stats .col-lg-4:nth-child(1) .dashboard-stats-item, .stats .col-lg-3:nth-child(1) .dashboard-stats-item, .prolancer-buyer-item.style-1 ul li, #newsletterModal .modal-content .close, .prolancer-service-item.style-2 .service-price h4, .prolancer-seller-item.style-1 ul li, .follow-button, .message-button, .prolancer-rgb-btn, .pagination .nav-links .page-numbers, .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
        background: rgb(103 135 254 / 10%);
    }

    .seller-profile .stats-list .stats:nth-child(1) span {
        background: #6787FE;
    }


    .widget .seller-detail:nth-child(6) i,
    .widget .seller-detail:nth-child(2) i,
    .buyer-profile ul.stats li:nth-child(1),
    .buyer-profile ul.meta li:nth-child(1),
    .prolancer-seller-item.style-2 ul li:nth-child(1),
    .prolancer-service-item.style-2 ul li:nth-child(1),
    .service-meta-cards .col-xl-4:nth-child(1) .service-meta,
    .project-meta-cards .col-xl-4:nth-child(1) .project-meta,
    .project-meta-cards .col-xl-4:nth-child(5) .project-meta,
    .seller-profile .stats-list .stats:nth-child(1) {
        background: rgb(103 135 254 / 20%);
    }

    .seller-profile .stats-list .stats:nth-child(2) span {
        background: #00E9B9;
    }

    .widget .seller-detail:nth-child(3) i,
    .stats .col-lg-3:nth-child(4) .dashboard-stats-item,
    .frontend-dashboard-header .balance-in-navbar, .buyer-profile ul.meta li:nth-child(2),
    .buyer-profile ul.stats li:nth-child(2),
    .prolancer-seller-item.style-2 ul li:nth-child(2),
    .prolancer-service-item.style-2 ul li:nth-child(2),
    .service-meta-cards .col-xl-4:nth-child(2) .service-meta,
    .project-meta-cards .col-xl-4:nth-child(6) .project-meta,
    .project-meta-cards .col-xl-4:nth-child(2) .project-meta,
    .seller-profile .stats-list .stats:nth-child(2) {
        background: rgb(0 233 185 / 20%);
    }

    .seller-profile .stats-list .stats:nth-child(3) span {
        background: #FFBB00;
    }

    .stats .col-lg-4:nth-child(3) .dashboard-stats-item, .stats .col-lg-3:nth-child(3) .dashboard-stats-item, .frontend-dashboard-header .balance-in-navbar, .widget .seller-detail:nth-child(4) i, .buyer-profile ul.meta li:nth-child(3),
    .prolancer-project-item.style-1 ul li:nth-child(3),
    .prolancer-buyer-item.style-2 ul li:nth-child(2),
    .prolancer-service-item.style-2 ul li:nth-child(3),
    .service-meta-cards .col-xl-4:nth-child(3) .service-meta,
    .project-meta-cards .col-xl-4:nth-child(3) .project-meta,
    .seller-profile .stats-list .stats:nth-child(3) {
        background: rgb(255 187 0 / 20%);
    }

    .seller-profile .stats-list .stats:nth-child(4) span {
        background: #FF007A;
    }


    .stats .col-lg-4:nth-child(2) .dashboard-stats-item, .stats .col-lg-3:nth-child(2) .dashboard-stats-item, .widget .seller-detail:nth-child(5) i,
    .buyer-profile ul.stats li:nth-child(3),
    .prolancer-buyer-item.style-2 ul li:nth-child(1),
    .prolancer-service-item.style-2 ul li:nth-child(4),
    .project-meta-cards .col-xl-4:nth-child(4) .project-meta,
    .seller-profile .stats-list .stats:nth-child(4) {
        background: rgb(255 0 122 / 20%);
    }

    .project-meta-cards .col-xl-4:nth-child(5) .project-meta {
        background: rgb(153 129 251 / 20%);
    }

    .project-meta-cards .col-xl-4:nth-child(6) .project-meta {
        background: rgb(129 215 66 / 20%);
    }

    .notifications-content i, i.verified, .page-template-custom-page-without-breadcrumb .site-header.fixed-top .header-btn a, .prolancer-service-item.style-2 .slick-dots li button:before, .header-btn a, .prolancer-service-item.style-1 .service-price h4, .primary-menu ul li .sub-menu li a:hover, .primary-menu ul li .sub-menu li.current-menu-item > a, .header-btn .sub-menu li.is-active a, .product-item-button a:hover, .wp-block-search .wp-block-search__button, .prolancer-table td a .fa-edit, .price-tab .fa-check, table .fa-check, .prolancer-rgb-btn, .pagination .nav-links .page-numbers, .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active, .banner.style-2 .banner-content h1 span, .client-info h4, .product-filter ul li a.active, a, a:hover, .current_page_item a, .tags a:hover, blockquote:before, .cart_item .product-name a:hover, .widget_recent_comments ul li .comment-author-link a, .mini-cart .cart-contents:hover span, ul.banner-button li a, .testimonial-content > i, .prolancer-btn.bordered, .cat-links a, .plyr--full-ui input[type=range], .prolancer-team-social li a, .preview-btn li a, .related-post-title a:hover, .comment-author-link, .entry-meta ul li a:hover, .widget-product-details table td span a:hover, .iconbox-item i, .footer-widget ul li a:hover, .widget li a:hover, p.no-comments a, .blog-meta span, .blog-content h4:hover a, .tags-links a, .tags a, .navbar-logo-text, .docs-single h4 a:hover, .docs-single ul li a:hover, .navbar .menu-item > .active, blockquote::before, .primary-menu ul li > a:hover, .tags a, a.button, .the_excerpt .entry-title a:hover {
        color: #6787FE;
    }


    .message_receiver .download, .page-template-custom-page-without-breadcrumb .site-header.fixed-top .header-btn a, .header-btn a, .dropzone.is-dragover, .irs--round .irs-handle, .prolancer-project-item.style-1:hover, .prolancer-project-item.style-2:hover, .feds-user-profile a, .feds-user-profile img, .category-item h5, .uil-ripple-css div, .testimonial-img img, .product-item.style-3:hover, .prolancer-btn.bordered, ul.banner-button li a, .preview-btn li a, .prolancer-pricing-table a, blockquote, .loader, .related-themes .single-related-theme:hover, .theme-author span, .tags a, .playerContainer, .sticky .the_excerpt_content {
        border-color: #6787FE !important;
    }

    .irs-from:before, .irs-to:before {
        border-top-color: #6787FE !important;
    }


    .navbar-toggler-icon {
        background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='#6787FE' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E");
    }

    /*----------------------------------------
    IF SCREEN SIZE LESS THAN 769px WIDE
    ------------------------------------------*/

    @media screen and (max-width: 768px) {
        .navbar .menu-item > .active {
            background: #6787FE;
        }
    }


</style>
<link rel='stylesheet' id='elementor-icons-css'
      href='wp-content/plugins/elementor/assets/lib/eicons/css/elementor-icons.min705c.css?ver=5.34.0' type='text/css'
      media='all'/>
<link rel='stylesheet' id='elementor-frontend-css'
      href='wp-content/uploads/elementor/css/custom-frontend.mindc89.css?ver=1734726326' type='text/css' media='all'/>
<link rel='stylesheet' id='elementor-post-1806-css'
      href='wp-content/uploads/elementor/css/post-180621ee.css?ver=1734726327' type='text/css' media='all'/>
<link rel='stylesheet' id='widget-image-css'
      href='wp-content/plugins/elementor/assets/css/widget-image.min7ac2.css?ver=3.26.3' type='text/css' media='all'/>
<link rel='stylesheet' id='widget-heading-css'
      href='wp-content/plugins/elementor/assets/css/widget-heading.min7ac2.css?ver=3.26.3' type='text/css' media='all'/>
<link rel='stylesheet' id='widget-counter-css'
      href='wp-content/plugins/elementor/assets/css/widget-counter.min7ac2.css?ver=3.26.3' type='text/css' media='all'/>
<link rel='stylesheet' id='widget-text-editor-css'
      href='wp-content/plugins/elementor/assets/css/widget-text-editor.min7ac2.css?ver=3.26.3' type='text/css'
      media='all'/>
<link rel='stylesheet' id='elementor-post-2316-css'
      href='wp-content/uploads/elementor/css/post-23167b8b.css?ver=1734726322' type='text/css' media='all'/>
<link rel="preload" as="style"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap">
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
      media="print" onload="this.media='all'">
<noscript>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap">
</noscript>
<link rel='stylesheet' id='elementor-icons-shared-0-css'
      href='wp-content/plugins/elementor/assets/lib/font-awesome/css/fontawesome.min52d5.css?ver=5.15.3' type='text/css'
      media='all'/>
<link rel='stylesheet' id='elementor-icons-fa-regular-css'
      href='wp-content/plugins/elementor/assets/lib/font-awesome/css/regular.min52d5.css?ver=5.15.3' type='text/css'
      media='all'/>
<link rel='stylesheet' id='elementor-icons-fa-brands-css'
      href='wp-content/plugins/elementor/assets/lib/font-awesome/css/brands.min52d5.css?ver=5.15.3' type='text/css'
      media='all'/>
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
<script type="text/javascript" src="wp-includes/js/jquery/jquery.minf43b.js?ver=3.7.1" id="jquery-core-js"></script>
<script type="text/javascript" src="wp-includes/js/jquery/jquery-migrate.min5589.js?ver=3.4.1"
        id="jquery-migrate-js"></script>
<script type="text/javascript" src="wp-content/plugins/prolancer-element/assets/js/richtext.min47a7.js?ver=1.4.5"
        id="richtext-js"></script>
<script type="text/javascript"
        src="wp-content/plugins/woocommerce/assets/js/jquery-blockui/jquery.blockUI.min22b2.js?ver=2.7.0-wc.9.5.1"
        id="jquery-blockui-js" defer="defer" data-wp-strategy="defer"></script>
<script type="text/javascript" id="wc-add-to-cart-js-extra">
    /* <![CDATA[ */
    var wc_add_to_cart_params = {
        "ajax_url": "\/wp\/prolancer\/wp-admin\/admin-ajax.php",
        "wc_ajax_url": "\/wp\/prolancer\/?wc-ajax=%%endpoint%%",
        "i18n_view_cart": "View cart",
        "cart_url": "https:\/\/themebing.com\/wp\/prolancer\/cart\/",
        "is_cart": "",
        "cart_redirect_after_add": "no"
    };
    /* ]]> */
</script>
<script type="text/javascript" src="wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart.min0c46.js?ver=9.5.1"
        id="wc-add-to-cart-js" defer="defer" data-wp-strategy="defer"></script>
<script type="text/javascript"
        src="wp-content/plugins/woocommerce/assets/js/js-cookie/js.cookie.mineaec.js?ver=2.1.4-wc.9.5.1"
        id="js-cookie-js" defer="defer" data-wp-strategy="defer"></script>
<script type="text/javascript" id="woocommerce-js-extra">
    /* <![CDATA[ */
    var woocommerce_params = {
        "ajax_url": "\/wp\/prolancer\/wp-admin\/admin-ajax.php",
        "wc_ajax_url": "\/wp\/prolancer\/?wc-ajax=%%endpoint%%"
    };
    /* ]]> */
</script>
<script type="text/javascript" src="wp-content/plugins/woocommerce/assets/js/frontend/woocommerce.min0c46.js?ver=9.5.1"
        id="woocommerce-js" defer="defer" data-wp-strategy="defer"></script>
<script type="text/javascript" src="wp-content/themes/prolancer/assets/js/popper.min47a7.js?ver=1.4.5"
        id="popper-js"></script>
<link rel="https://api.w.org/" href="wp-json/index.html"/>
<link rel="alternate" title="JSON" type="application/json" href="wp-json/wp/v2/pages/2316.json"/>
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="xmlrpc0db0.html?rsd"/>
<meta name="generator" content="WordPress 6.7.1"/>
<meta name="generator" content="WooCommerce 9.5.1"/>
<link rel="canonical" href="index.html"/>
<link rel='shortlink' href='index.html'/>
<link rel="alternate" title="oEmbed (JSON)" type="application/json+oembed"
      href="wp-json/oembed/1.0/embed00aa.json?url=https%3A%2F%2Fthemebing.com%2Fwp%2Fprolancer%2F"/>
<link rel="alternate" title="oEmbed (XML)" type="text/xml+oembed"
      href="wp-json/oembed/1.0/embed84fb?url=https%3A%2F%2Fthemebing.com%2Fwp%2Fprolancer%2F&amp;format=xml"/>
<meta name="generator" content="Redux 4.5.4"/>
<noscript>
    <style>.woocommerce-product-gallery {
        opacity: 1 !important;
    }</style>
</noscript>
<meta name="generator"
      content="Elementor 3.26.3; features: additional_custom_breakpoints; settings: css_print_method-external, google_font-enabled, font_display-auto">
<style>
    .e-con.e-parent:nth-of-type(n+4):not(.e-lazyloaded):not(.e-no-lazyload),
    .e-con.e-parent:nth-of-type(n+4):not(.e-lazyloaded):not(.e-no-lazyload) * {
        background-image: none !important;
    }

    @media screen and (max-height: 1024px) {
        .e-con.e-parent:nth-of-type(n+3):not(.e-lazyloaded):not(.e-no-lazyload),
        .e-con.e-parent:nth-of-type(n+3):not(.e-lazyloaded):not(.e-no-lazyload) * {
            background-image: none !important;
        }
    }

    @media screen and (max-height: 640px) {
        .e-con.e-parent:nth-of-type(n+2):not(.e-lazyloaded):not(.e-no-lazyload),
        .e-con.e-parent:nth-of-type(n+2):not(.e-lazyloaded):not(.e-no-lazyload) * {
            background-image: none !important;
        }
    }
</style>
<style class='wp-fonts-local' type='text/css'>
    @font-face {
        font-family: Inter;
        font-style: normal;
        font-weight: 300 900;
        font-display: fallback;
        src: url('wp-content/plugins/woocommerce/assets/fonts/Inter-VariableFont_slnt,wght.woff2') format('woff2');
        font-stretch: normal;
    }

    /* @font-face{font-family:Cardo;font-style:normal;font-weight:400;font-display:fallback;src:url('wp-content/plugins/woocommerce/assets/fonts/cardo_normal_400.woff2') format('woff2');} */
</style>
<link rel="icon" href="wp-content/uploads/2021/09/cropped-thumbnail-32x32.png" sizes="32x32"/>
<link rel="icon" href="wp-content/uploads/2021/09/cropped-thumbnail-192x192.png" sizes="192x192"/>
<link rel="apple-touch-icon" href="wp-content/uploads/2021/09/cropped-thumbnail-180x180.png"/>
<meta name="msapplication-TileImage"
      content="https://themebing.com/wp/prolancer/wp-content/uploads/2021/09/cropped-thumbnail-270x270.png"/>
<style id="prolancer_opt-dynamic-css" title="dynamic-css" class="redux-options-output">h1, h2, h3, h4, h5, h6 {
    font-family: Inter;
    font-weight: 700;
    font-style: normal;
    color: #333333;
}

body, p {
    font-family: Rubik;
    line-height: 28px;
    font-weight: normal;
    font-style: normal;
    color: #4A6375;
    font-size: 16px;
}

.custom-logo-link img {
    width: 150px;
}

.breadcrumbs {
    background-color: #333333;
    background-image: url('wp-content/uploads/2021/09/breadcrumb-bg.jpg');
}</style>
<style>
    body {
        font-family: 'Inter', sans-serif;
    }
</style>
<style>
    /* Dropdown menu container */
    #dropdown-menu {
        display: none;
        position: absolute;
        top: 60px;
        right: 0; /* Căn sát mép phải */
        background: white;
        border-radius: 12px;
        width: 250px;
        box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        overflow: hidden;
        opacity: 0;
        transform: translateY(-10px);
        transition: opacity 0.3s ease, transform 0.3s ease;
    }

    /* List styling */
    #dropdown-menu ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    /* Dropdown items */
    #dropdown-menu li {
        display: flex;
        align-items: center;
        padding: 14px 18px;
        cursor: pointer;
        transition: background 0.3s, transform 0.2s ease-in-out;
        font-weight: 500;
        text-align: left;
        border-bottom: 1px solid #f0f2ff;
    }

    /* Background màu xen kẽ */
    #dropdown-menu li:nth-child(odd) {
        background: #f8f9ff;
    }

    /* Hover effect */
    #dropdown-menu li:hover {
        background: linear-gradient(90deg, #6787fe, #9baeff);
        color: white;
        transform: scale(1.05);
    }

    /* Icon styling */
    #dropdown-menu li i {
        margin-right: 14px;
        color: #6787fe;
        font-size: 20px;
        transition: color 0.3s ease;
    }

    /* Hover đổi màu icon */
    #dropdown-menu li:hover i {
        color: white;
    }

    /* Style for the links */
    #dropdown-menu li a {
        all: unset;
        display: block;
        font-family: 'Roboto', 'Segoe UI', Arial, sans-serif;
        font-size: 16px;
        font-weight: 20px;
    }

    /* Hover effect for links */
    #dropdown-menu li:hover a {
        color: white;
    }

    /* Last item no border */
    #dropdown-menu li:last-child {
        border-bottom: none;
    }

    #dropdown-toggle {
        width: 48px;
        height: 48px;
        border-radius: 50%;
        border: 2px solid #6787fe;
        cursor: pointer !important; /* Đảm bảo luôn có con trỏ bàn tay */
        transition: transform 0.2s ease-in-out;
    }

    /* Khi avatar được click, vẫn giữ hiệu ứng */
    #dropdown-toggle:active,
    #dropdown-toggle:focus {
        cursor: pointer !important;
    }
</style>

<header>

    <div class="site-header sticky-header">
        <div class="container">
            <div class="row">
                <div class="col-xl-2 col-md-3 my-auto">
                    <div class="logo">
                        <a href="index.html" rel="home" aria-current="page"><img width="80" height="71"
                                                                                 src="wp-content/uploads/2021/09/logo.png"
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
                                        href="blog/index.html">Chính sách</a>
                                </li>
                                <li id="menu-item-382"
                                    class="menu-item menu-item-type-post_type menu-item-object-page menu-item-382"><a
                                        href="about/index.html">Về chúng tôi</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <%
                    Object account = session.getAttribute("account");
                    Object home = session.getAttribute("home");
                    if (account == null || "".equals(account)) {
                %>
                <div class="col-xl-3 col-md-2 my-auto">
                    <div class="header-btn d-none d-lg-block">
                        <a href="./authentication/loginAndRegister.jsp">
                            Đăng nhập </a>
                    </div>
                </div>
                <%} else if (home == null) {%>
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
                                    style="color: white; font-size: 18px; font-weight: bold; margin: 0;"><%=(String) session.getAttribute("userName")%>
                                </h2>
                                <p id="user-score" style="color: white; font-size: 14px; margin: 0;">
                                    Điểm: <%=session.getAttribute("point")%>
                                </p>
                            </div>

                            <!-- Ảnh đại diện -->
                            <div style="width: 18%; text-align: right; position: relative;">
                                <!-- Avatar để mở dropdown -->
                                <!-- Avatar để mở dropdown -->
                                <!-- Avatar để mở dropdown -->
                                <img id="dropdown-toggle"
                                     src="wp-content/uploads/2021/04/pexels-mentatdgt-1138903-80x80.jpg" alt="Avatar"
                                     style="width: 48px; height: 48px; border-radius: 50%; border: 2px solid #6787fe; cursor: pointer;">

                                <!-- Dropdown Menu -->
                                <div id="dropdown-menu">
                                    <ul>
                                        <li><i class="fas fa-user"></i> <a href="acc-manage?action=viewAdminAccount">Thông
                                            tin cá nhân</a></li>
                                        <li><i class="fas fa-wallet"></i> <a href="#">Ví của tôi</a></li>
                                        <li><i class="fas fa-briefcase"></i> <a href="#">Quản lý công việc</a></li>
                                        <li><i class="fas fa-cog"></i> <a href="#">Cài đặt</a></li>
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
            <%} else {%>
            <div id="menu-item-27" class="col-xl-4 col-md-2 my-auto">
                <div class="header-btn d-none d-lg-block">
                    <div class="user-card"
                         style="display: flex; justify-content: space-between; align-items: center; width: 100%; padding: 10px; transition: all 0.3s;">

                        <!-- Icon chat và thông báo (sát với tên) -->
                        <div style="display: flex; align-items: center; gap: 60px; margin-left: 50px;">
                            <i class="fa fa-comments icon"
                               style="font-size: 22px; color: #4a6375; transition: color 0.3s;"></i>
                            <i class="fa fa-bell icon"
                               style="font-size: 22px; color: #4a6375; transition: color 0.3s;"></i>
                        </div>

                        <!-- Tên và điểm (giữ nguyên chỗ cũ) -->
                        <div style="flex: 1; text-align: center;">
                            <h2 id="user-name-02"
                                style="color: #4a6375; font-size: 18px; font-weight: 00; margin: 0"><%=(String) session.getAttribute("userName")%>
                                >>></h2>
                            <p id="user-score-02" style="color: #4a6375; font-size: 14px; margin: 0;">Điểm: 100</p>
                        </div>

                        <!-- Ảnh đại diện -->
                        <div style="width: 18%; text-align: right; position: relative;">
                            <img id="avatar-img" src="wp-content/uploads/2021/04/pexels-mentatdgt-1138903-80x80.jpg"
                                 alt="Avatar"
                                 style="width: 48px; height: 48px; border-radius: 50%; border: 2px solid #4a6375;">
                            <div id="dropdown-menu">
                                <ul>
                                    <li><i class="fas fa-user"></i> <a href="acc-manage?action=viewAdminAccount">Thông
                                        tin cá nhân</a></li>
                                    <li><i class="fas fa-wallet"></i> <a href="#">Ví của tôi</a></li>
                                    <li><i class="fas fa-briefcase"></i> <a href="#">Quản lý công việc</a></li>
                                    <li><i class="fas fa-cog"></i> <a href="#">Cài đặt</a></li>
                                    <li><i class="fas fa-sign-out-alt"></i> <a href="logout">Đăng xuất</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
    </div>
</header>
<script>
    document.getElementById("dropdown-toggle").addEventListener("click", function () {
        this.style.cursor = "pointer"; // Đảm bảo luôn có con trỏ bàn tay
    });

    document.addEventListener("DOMContentLoaded", function () {
        const toggleBtn = document.getElementById("dropdown-toggle");
        const dropdownMenu = document.getElementById("dropdown-menu");

        // Toggle dropdown visibility
        toggleBtn.addEventListener("click", function (event) {
            event.stopPropagation();
            if (dropdownMenu.style.display === "block") {
                dropdownMenu.style.opacity = "0";
                dropdownMenu.style.transform = "translateY(-10px)";
                setTimeout(() => dropdownMenu.style.display = "none", 300);
            } else {
                dropdownMenu.style.display = "block";
                dropdownMenu.style.right = 0; // Căn sát mép phải
                setTimeout(() => {
                    dropdownMenu.style.opacity = "1";
                    dropdownMenu.style.transform = "translateY(0)";
                }, 10);
            }
        });

        // Close dropdown when clicking outside
        document.addEventListener("click", function (event) {
            if (!dropdownMenu.contains(event.target) && event.target !== toggleBtn) {
                dropdownMenu.style.opacity = "0";
                dropdownMenu.style.transform = "translateY(-10px)";
                setTimeout(() => dropdownMenu.style.display = "none", 300);
            }
        });
    });
</script>
<script>
    window.addEventListener("scroll", function () {
        let menuItem = document.getElementById("menu-item-27");
        let icons = document.querySelectorAll(".icon");
        let userName = document.getElementById("user-name");
        let userScore = document.getElementById("user-score");

        if (window.scrollY > 50) {
            menuItem.style.background = "transparent";
            menuItem.style.boxShadow = "0px 4px 10px rgba(0, 0, 0, 0.1)";
            userName.style.color = "#4a6375";
            userScore.style.color = "#4a6375";
            icons.forEach(icon => icon.style.color = "#4a6375");
        } else {
            menuItem.style.background = "transparent";
            menuItem.style.boxShadow = "none";
            userName.style.color = "white";
            userScore.style.color = "white";
            icons.forEach(icon => icon.style.color = "white");
        }
    });
</script>
<script>
    window.addEventListener("scroll", function () {
        let menuItem = document.getElementById("menu-item-27");
        let icons = document.querySelectorAll(".icon");
        let userName = document.getElementById("user-name-01");
        let userScore = document.getElementById("user-score-01");

        if (window.scrollY > 50) {
            menuItem.style.background = "transparent";
            menuItem.style.boxShadow = "0px 4px 10px rgba(0, 0, 0, 0.1)";
            userName.style.color = "#4a6375";
            userScore.style.color = "#4a6375";
            icons.forEach(icon => icon.style.color = "#4a6375");
        } else {
            menuItem.style.background = "transparent";
            menuItem.style.boxShadow = "none";
            userName.style.color = "white";
            userScore.style.color = "white";
            icons.forEach(icon => icon.style.color = "white");
        }
    });
</script>
<script>
    window.addEventListener("scroll", function () {
        let menuItem = document.getElementById("menu-item-27");
        let icons = document.querySelectorAll(".icon-01");
        let userName = document.getElementById("user-name-02");
        let userScore = document.getElementById("user-score-02");

        if (window.scrollY > 50) {
            menuItem.style.background = "transparent";
            menuItem.style.boxShadow = "0px 4px 10px rgba(0, 0, 0, 0.1)";
            userName.style.color = "#4a6375";
            userScore.style.color = "#4a6375";
            icons.forEach(icon => icon.style.color = "#4a6375");
        } else {
            menuItem.style.background = "transparent";
            menuItem.style.boxShadow = "none";
            userName.style.color = "#4a6375";
            userScore.style.color = "#4a6375";
            icons.forEach(icon => icon.style.color = "#4a6375");
        }
    });
</script>
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
        }, {rootMargin: '200px 0px 200px 0px'});
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
      href='wp-content/plugins/woocommerce/assets/client/blocks/wc-blocksfbdf.css?ver=wc-9.5.1' type='text/css'
      media='all'/>
<link rel='stylesheet' id='redux-custom-fonts-css'
      href='wp-content/uploads/redux/custom-fonts/fonts2dd1.css?ver=1736760615' type='text/css' media='all'/>
<link rel='stylesheet' id='elementor-post-1803-css'
      href='wp-content/uploads/elementor/css/post-1803fa5d.css?ver=1734726324' type='text/css' media='all'/>
<link rel='stylesheet' id='widget-icon-list-css'
      href='wp-content/uploads/elementor/css/custom-widget-icon-list.mindc89.css?ver=1734726326' type='text/css'
      media='all'/>
<script type="text/javascript" src="wp-includes/js/dist/hooks.min4fdd.js?ver=4d63a3d491d11ffd8ac6"
        id="wp-hooks-js"></script>
<script type="text/javascript" src="wp-includes/js/dist/i18n.minc33c.js?ver=5e580eb46a90c2b997e6"
        id="wp-i18n-js"></script>
<script type="text/javascript" id="wp-i18n-js-after">
    /* <![CDATA[ */
    wp.i18n.setLocaleData({'text direction\u0004ltr': ['ltr']});
    /* ]]> */
</script>
<script type="text/javascript" src="wp-content/plugins/contact-form-7/includes/swv/js/index5b21.js?ver=6.0.2"
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
<script type="text/javascript" src="wp-content/plugins/contact-form-7/includes/js/index5b21.js?ver=6.0.2"
        id="contact-form-7-js"></script>
<script type="text/javascript" src="../../../www.gstatic.com/charts/loader47a7.js?ver=1.4.5" id="charts-js"></script>
<script type="text/javascript" src="wp-content/plugins/prolancer-element/assets/js/rating47a7.js?ver=1.4.5"
        id="rating-js"></script>
<script type="text/javascript" src="wp-content/plugins/prolancer-element/assets/js/sweetalert2.min47a7.js?ver=1.4.5"
        id="sweetalert2-js"></script>
<script type="text/javascript" src="wp-content/plugins/prolancer-element/assets/js/select2.min47a7.js?ver=1.4.5"
        id="prolancer-select2-js"></script>
<script type="text/javascript" src="wp-content/plugins/prolancer-element/assets/js/plugins47a7.js?ver=1.4.5"
        id="prolancer-plugins-js"></script>
<script type="text/javascript" src="wp-includes/js/jquery/ui/core.minb37e.js?ver=1.13.3"
        id="jquery-ui-core-js"></script>
<script type="text/javascript" src="wp-includes/js/jquery/ui/mouse.minb37e.js?ver=1.13.3"
        id="jquery-ui-mouse-js"></script>
<script type="text/javascript" src="wp-includes/js/jquery/ui/sortable.minb37e.js?ver=1.13.3"
        id="jquery-ui-sortable-js"></script>
<script type="text/javascript" id="prolancer-app-js-extra">
    /* <![CDATA[ */
    var prolancer_page_views = {"data": ""};
    /* ]]> */
</script>
<script type="text/javascript" src="wp-content/plugins/prolancer-element/assets/js/app47a7.js?ver=1.4.5"
        id="prolancer-app-js"></script>
<script type="text/javascript" id="prolancer-main-js-extra">
    /* <![CDATA[ */
    var prolancerAjaxUrlObj = {
        "ajaxurl": "https:\/\/themebing.com\/wp\/prolancer\/wp-admin\/admin-ajax.php",
        "logo": "https:\/\/themebing.com\/wp\/prolancer\/wp-content\/uploads\/2021\/09\/logo.png",
        "alt_logo": "https:\/\/themebing.com\/wp\/prolancer\/wp-content\/uploads\/2021\/09\/logo-alt.png"
    };
    /* ]]> */
</script>
<script type="text/javascript" src="wp-content/themes/prolancer/assets/js/main47a7.js?ver=1.4.5"
        id="prolancer-main-js"></script>
<script type="text/javascript" id="prolancer-plugin-js-extra">
    /* <![CDATA[ */
    var prolancerPluginAjaxObj = {"ajaxurl": "https:\/\/themebing.com\/wp\/prolancer\/wp-admin\/admin-ajax.php"};
    /* ]]> */
</script>
<script type="text/javascript" src="wp-content/plugins/prolancer-element/assets/js/plugin47a7.js?ver=1.4.5"
        id="prolancer-plugin-js"></script>
<script type="text/javascript"
        src="wp-content/plugins/prolancer-element/inc/mega-menu/assets/js/mega-menu47a7.js?ver=1.4.5"
        id="prolancer-mega-menu-js"></script>
<script type="text/javascript" src="wp-content/themes/prolancer/assets/js/bootstrap.min47a7.js?ver=1.4.5"
        id="bootstrap-js"></script>
<script type="text/javascript" src="wp-content/themes/prolancer/assets/js/jquery.magnific-popup.min47a7.js?ver=1.4.5"
        id="magnific-popup-js"></script>
<script type="text/javascript" src="wp-content/themes/prolancer/assets/js/skip-link-focus-fix47a7.js?ver=1.4.5"
        id="prolancer-skip-link-focus-fix-js"></script>
<script type="text/javascript"
        src="wp-content/plugins/woocommerce/assets/js/sourcebuster/sourcebuster.min0c46.js?ver=9.5.1"
        id="sourcebuster-js-js"></script>
<script type="text/javascript" id="wc-order-attribution-js-extra">
    /* <![CDATA[ */
    var wc_order_attribution = {
        "params": {
            "lifetime": 1.0e-5,
            "session": 30,
            "base64": false,
            "ajaxurl": "https:\/\/themebing.com\/wp\/prolancer\/wp-admin\/admin-ajax.php",
            "prefix": "wc_order_attribution_",
            "allowTracking": true
        },
        "fields": {
            "source_type": "current.typ",
            "referrer": "current_add.rf",
            "utm_campaign": "current.cmp",
            "utm_source": "current.src",
            "utm_medium": "current.mdm",
            "utm_content": "current.cnt",
            "utm_id": "current.id",
            "utm_term": "current.trm",
            "utm_source_platform": "current.plt",
            "utm_creative_format": "current.fmt",
            "utm_marketing_tactic": "current.tct",
            "session_entry": "current_add.ep",
            "session_start_time": "current_add.fd",
            "session_pages": "session.pgs",
            "session_count": "udata.vst",
            "user_agent": "udata.uag"
        }
    };
    /* ]]> */
</script>
<script type="text/javascript"
        src="wp-content/plugins/woocommerce/assets/js/frontend/order-attribution.min0c46.js?ver=9.5.1"
        id="wc-order-attribution-js"></script>
<script type="text/javascript"
        src="wp-content/plugins/elementor/assets/lib/jquery-numerator/jquery-numerator.min3958.js?ver=0.2.1"
        id="jquery-numerator-js"></script>
<script type="text/javascript" defer src="wp-content/plugins/mailchimp-for-wp/assets/js/forms4b0b.js?ver=4.9.20"
        id="mc4wp-forms-api-js"></script>
<script type="text/javascript" src="wp-content/plugins/elementor/assets/js/webpack.runtime.min7ac2.js?ver=3.26.3"
        id="elementor-webpack-runtime-js"></script>
<script type="text/javascript" src="wp-content/plugins/elementor/assets/js/frontend-modules.min7ac2.js?ver=3.26.3"
        id="elementor-frontend-modules-js"></script>
<script type="text/javascript" id="elementor-frontend-js-before">
    /* <![CDATA[ */
    var elementorFrontendConfig = {
        "environmentMode": {"edit": false, "wpPreview": false, "isScriptDebug": false},
        "i18n": {
            "shareOnFacebook": "Share on Facebook",
            "shareOnTwitter": "Share on Twitter",
            "pinIt": "Pin it",
            "download": "Download",
            "downloadImage": "Download image",
            "fullscreen": "Fullscreen",
            "zoom": "Zoom",
            "share": "Share",
            "playVideo": "Play Video",
            "previous": "Previous",
            "next": "Next",
            "close": "Close",
            "a11yCarouselPrevSlideMessage": "Previous slide",
            "a11yCarouselNextSlideMessage": "Next slide",
            "a11yCarouselFirstSlideMessage": "This is the first slide",
            "a11yCarouselLastSlideMessage": "This is the last slide",
            "a11yCarouselPaginationBulletMessage": "Go to slide"
        },
        "is_rtl": false,
        "breakpoints": {"xs": 0, "sm": 480, "md": 769, "lg": 993, "xl": 1440, "xxl": 1600},
        "responsive": {
            "breakpoints": {
                "mobile": {
                    "label": "Mobile Portrait",
                    "value": 768,
                    "default_value": 767,
                    "direction": "max",
                    "is_enabled": true
                },
                "mobile_extra": {
                    "label": "Mobile Landscape",
                    "value": 880,
                    "default_value": 880,
                    "direction": "max",
                    "is_enabled": false
                },
                "tablet": {
                    "label": "Tablet Portrait",
                    "value": 992,
                    "default_value": 1024,
                    "direction": "max",
                    "is_enabled": true
                },
                "tablet_extra": {
                    "label": "Tablet Landscape",
                    "value": 1200,
                    "default_value": 1200,
                    "direction": "max",
                    "is_enabled": false
                },
                "laptop": {
                    "label": "Laptop",
                    "value": 1200,
                    "default_value": 1366,
                    "direction": "max",
                    "is_enabled": true
                },
                "widescreen": {
                    "label": "Widescreen",
                    "value": 1400,
                    "default_value": 2400,
                    "direction": "min",
                    "is_enabled": true
                }
            }, "hasCustomBreakpoints": true
        },
        "version": "3.26.3",
        "is_static": false,
        "experimentalFeatures": {
            "additional_custom_breakpoints": true,
            "e_swiper_latest": true,
            "e_nested_atomic_repeaters": true,
            "e_onboarding": true,
            "e_css_smooth_scroll": true,
            "home_screen": true,
            "landing-pages": true,
            "nested-elements": true,
            "editor_v2": true,
            "link-in-bio": true,
            "floating-buttons": true
        },
        "urls": {
            "assets": "https:\/\/themebing.com\/wp\/prolancer\/wp-content\/plugins\/elementor\/assets\/",
            "ajaxurl": "https:\/\/themebing.com\/wp\/prolancer\/wp-admin\/admin-ajax.php",
            "uploadUrl": "https:\/\/themebing.com\/wp\/prolancer\/wp-content\/uploads"
        },
        "nonces": {"floatingButtonsClickTracking": "d146a643f2"},
        "swiperClass": "swiper",
        "settings": {"page": [], "editorPreferences": []},
        "kit": {
            "active_breakpoints": ["viewport_mobile", "viewport_tablet", "viewport_laptop", "viewport_widescreen"],
            "viewport_mobile": 768,
            "viewport_tablet": 992,
            "viewport_laptop": 1200,
            "viewport_widescreen": 1400,
            "global_image_lightbox": "yes",
            "lightbox_enable_counter": "yes",
            "lightbox_enable_fullscreen": "yes",
            "lightbox_enable_zoom": "yes",
            "lightbox_enable_share": "yes",
            "lightbox_title_src": "title",
            "lightbox_description_src": "description"
        },
        "post": {
            "id": 2316,
            "title": "ProLancer%20%E2%80%93%20Freelance%20MarketPlace",
            "excerpt": "",
            "featuredImage": false
        }
    };
    /* ]]> */
</script>
<script type="text/javascript" src="wp-content/plugins/elementor/assets/js/frontend.min7ac2.js?ver=3.26.3"
        id="elementor-frontend-js"></script>

<script>(function () {
    function c() {
        var b = a.contentDocument || a.contentWindow.document;
        if (b) {
            var d = b.createElement('script');
            d.innerHTML = "window.__CF$cv$params={r:'90145dcb19f9fd2f',t:'MTczNjc2MDYxNS4wMDAwMDA='};var a=document.createElement('script');a.nonce='';a.src='../../cdn-cgi/challenge-platform/h/b/scripts/jsd/e0c90b6a3ed1/maind41d.js';document.getElementsByTagName('head')[0].appendChild(a);";
            b.getElementsByTagName('head')[0].appendChild(d)
        }
    }

    if (document.body) {
        var a = document.createElement('iframe');
        a.height = 1;
        a.width = 1;
        a.style.position = 'absolute';
        a.style.top = 0;
        a.style.left = 0;
        a.style.border = 'none';
        a.style.visibility = 'hidden';
        document.body.appendChild(a);
        if ('loading' !== document.readyState) c(); else if (window.addEventListener) document.addEventListener('DOMContentLoaded', c); else {
            var e = document.onreadystatechange || function () {
            };
            document.onreadystatechange = function (b) {
                e(b);
                'loading' !== document.readyState && (document.onreadystatechange = e, c())
            }
        }
    }
})();</script>
</body>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en-US">

<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đánh giá đối tác &#8211; JobTrans</title>
    <meta name='robots' content='max-image-preview:large'/>
    <link href="./css/rating-partner.css" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
</head>

<body style="font-family: Inter, sans-serif">
<div class="py-4 banner_title">
    <div class="text-white mb-2 mt-3" style="padding-left: 50px">
        <p>
            <a>Công việc của tôi >> </a>
            <a>Công việc đã đăng</a>
        </p>
    </div>
    <span class="text-white font-weight-bold"
          style="padding-left: 50px; font-size: 40px;">Lập trình web bán hàng </span>
    <div class="text-white mt-2">
        <span style="font-size:24px; padding-left: 50px;">
            <a>>> Quản lý công việc >> </a>
            <a>Đối tác</a>
        </span>
    </div>
</div>
<section class="section-padding m-4">
    <div class="container">
        <div class="row justify-content-center flex-row-reverse mx-auto" style="width: 1280px;">
            <h3 class="text-center mb-3" style="font-size: 32px; font-weight: bold">Đánh giá</h3>
            <div>
                <form>
                    <div class="row mb-3">
                        <div class="col-2" style="font-weight: bold; font-size: 20px;">Tên đối tác</div>
                        <div class="col-10" style="font-size: 20px;">
                            <p>Tên đối tác 1</p>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-2 bold" style="font-weight: bold; font-size: 20px;">Xếp hạng</div>
                        <div class="col-10">
                            <%--                            <input type="text" value="50"/>--%>
                            <div class="star-rating">
                                <input type="radio" id="star5" name="rating" value="5"/>
                                <label for="star5">★</label>
                                <input type="radio" id="star4" name="rating" value="4"/>
                                <label for="star4">★</label>
                                <input type="radio" id="star3" name="rating" value="3"/>
                                <label for="star3">★</label>
                                <input type="radio" id="star2" name="rating" value="2"/>
                                <label for="star2">★</label>
                                <input type="radio" id="star1" name="rating" value="1"/>
                                <label for="star1">★</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-2 bold" style="font-weight: bold; font-size: 20px;">Đánh giá</div>
                        <div class="col-10">
                            <textarea
                                    style="border-radius: 10px; border: 2px solid #6787FE; width: 100%; height: 300px;">
                            </textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-10">
                            <input type="submit"
                                   style="color: #fff; background-color: #0F1B63; padding: 10px 10px 10px 10px; border-radius: 15px;"
                                   value="Gửi đánh giá"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>

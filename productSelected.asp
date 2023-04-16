<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/index.css" />
    <link rel="stylesheet" href="./css/header.css" />
    <link
      rel="stylesheet"
      href="./css/dist/bootstrap-5.0.2-dist/css/bootstrap.min.css" />
  </head>
  <body>
    

    <!--#include file="./components/header.asp"  -->

    <main>
      <div class="product row container mt-5">
        <!-- Product Left  -->
        <div class="col-lg-6 text-center">
          <img
            width="60%"
            src="./assets/image/redminote12pro5g-0.webp"
            alt="" />
        </div>

        <!-- Product Right  -->
        <div class="col-lg-6">
          <h5>Nokia C21 Plus 2GB/64GB - Chính hãng</h5>
          <p class="mt-3">
            <strong>Mô tả:</strong>Nokia C21 Plus sở hữu kích thước nhỏ gọn
            164.8 x 75.9 X 8.55 mm với trọng lượng chỉ 191g. Chính vì vậy mà
            người dùng có thể cầm gọn trong một tay để sử dụng mà không cảm thấy
            mỏi.
          </p>

          <div class="price">
            <strong>Giá:</strong>
            <span class="text-danger fw-bold"> 5.999.999 VND </span>
          </div>
          <div class="mt-3 d-flex gap-2 align-items-center">
            <strong>Màu:</strong>
            <select class="form-control d-inline" name="color" id="">
              <option value="">Blue</option>
              <option value="">Green</option>
              <option value="">red</option>
            </select>
          </div>

          <div class="d-grid mt-5">
            <a href="./cart.html" class="btn btn-danger">Thêm vào giỏ hàng</a>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>

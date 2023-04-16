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
    <header class="header d-flex p-1 position-relative">
      <span class="icon__menu d-lg-none position-absolute">
        <i class="fa-solid fa-bars"></i>
      </span>
      <div
        class="container d-lg-flex justify-content-between align-items-center">
        <!-- logo  -->
        <div class="logo text-center flex-column justify-contents-center">
          <img src="./assets/image/logo.png" alt="" height="30px" />
        </div>

        <!-- navbar -->
        <div
          class="menu d-lg-block d-none d-lg-flex justify-content-between align-items-center flex-lg-fill">
          <nav>
            <ul class="nav-list d-lg-flex align-items-center gap-5 fw-bold m-0">
              <li class="nav-item d-block">
                <a href="" class="text-decoration-none"> Apple </a>
              </li>
              <li class="nav-item d-block">
                <a href="" class="text-decoration-none"> Samsung</a>
              </li>
              <li class="nav-item d-block">
                <a href="" class="text-decoration-none"> Oppo </a>
              </li>
                <li class="nav-item d-block">
                <a href="" class="text-decoration-none"> Xiaomi </a>
              </li>
            </ul>
          </nav>

          <!-- feature  -->
          <div class="d-flex align-items-center">

            <form class="box__search d-flex gap-1">
              <input
                type="text "
                class="form-control "
                placeholder="Tìm kiếm sản phẩm" />

              <button class="btn" type="submit">
                <i class="fa-solid fa-magnifying-glass"></i>
              </button>
            </form>
            <i class="fa-solid fa-user"></i>
            <i class="fa-solid fa-cart-shopping"></i>
          </div>
        </div>
      </div>
    </header>
  </body>
</html>

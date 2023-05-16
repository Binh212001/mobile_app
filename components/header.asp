<%
dim product

if(trim(product) <>"") then
product = Request.Form("phone")  
end if
%>

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
    <link rel="stylesheet" href="../css/index.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link
      rel="stylesheet"
      href="../css/dist/bootstrap-5.0.2-dist/css/bootstrap.min.css" />
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
          class=" d-lg-block d-none d-lg-flex justify-content-between align-items-center flex-lg-fill">
          <nav>
            <ul class="nav-list d-lg-flex align-items-center gap-5 fw-bold m-0">
              <li class="nav-item d-block">
                <a href="/" class="text-decoration-none"> Trang chu </a>
              </li>
              <li class="nav-item d-block">
                <a href="/products.asp" class="text-decoration-none"> San pham</a>
              </li>
              <li class="nav-item d-block">
                <a href="/cart.asp" class="text-decoration-none"> Gio hang </a>
              </li>
            </ul>
          </nav>

          <!-- feature  -->
          <div class="d-flex align-items-center">
            <form action="search.asp?name=<%=product%>" class="box__search d-flex gap-1">
              <input
                type="text "
                name="phone"
                class="form-control"
                placeholder="Tìm kiếm sản phẩm" />

              <button class="btn" type="submit">
                <i class="fa-solid fa-magnifying-glass"></i>
              </button>
            </form>
             
                      <% if (Session("displayName")="") then
                        Response.Write(" <a href='./Login.asp'> Login  </a>")                   
                        end if
                      %>
            <div class="menu position-relative">
             <% if (Session("displayName")<>"") then

              Response.write("<i class='fa-solid fa-user'></i>")
               end if %>
              <div class=" menu__item  position-absolute rounded border" style="width: 150px ; right:0 ; background-color: #fff;" >   
                    <div  class="p-1 d-flex text-start menu__item__data">
                      <img class="circle" src="./assets/image/redminote12pro5g-0.webp"/> 
                      <strong><%=Session("displayName")%></strong>
                    </div>  
                    <a href="user.asp" class="p-1 d-block text-start menu__item__data">
                      Cap nhat thong tin
                    </a>  
                    <a href="/ProductAdmin.asp" class="p-1 d-block text-start menu__item__data">
                      Quan Tri
                    </a>  
                    <a  href="logout.asp" name="UserLogout" class="p-1 d-block text-start menu__item__data">Dang xuat</a>
                      
              </div>
            </div>

        </div>
      </div>
    </header>
  </body>

  <script src="../css/dist/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</html>



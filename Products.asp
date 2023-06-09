
<!-- #include file="db/connectDB.asp" -->
<!--#include file="./models/Phone.asp" -->
<%

  Set phones = Server.CreateObject("Scripting.Dictionary")
  Dim  seq, Aphone
  Set recordset = connection.Execute("select * from phones where status=1 order by createdAt asc ")

    seq = 0
  Do While Not recordset.EOF
    seq = seq+1
    set Aphone = New Phone
    Aphone.Id = recordset.Fields("id")
    Aphone.Name = recordset.Fields("phoneName")
    Aphone.Desc = recordset.Fields("description")
    Aphone.Price = recordset.Fields("price")
    Aphone.Qty = recordset.Fields("quantity")
    Aphone.Img = recordset.Fields("image")
    Aphone.Status = recordset.Fields("status")
    phones.add seq, Aphone
    recordset.MoveNext
  Loop 
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
      href="./css/dist/bootstrap-5.0.2-dist/css/bootstrap.min.css" />
  </head>
  <body>
     <!--#include file="./components/header.asp"  -->
    <div class="container-fluid">


      <div class="row">
        <div class="col-2 bg-secondary">
          <strong> Categories: </strong>
          <select class="form-control" name="category" id="category">
            <option value="iphone">iphone</option>
            <option value="iphone">iphone</option>
            <option value="iphone">iphone</option>
            <option value="iphone">iphone</option>
          </select>
        </div>



        <div class="col-10 row">


          <% For Each item in phones %> 
            <div class="card col-lg-3">
      <a href="../SingleProduct.asp?id=<%=phones(item).Id%>">
        <div class="card text-start">
          <img
            width="100%"
            class="card-img-top text-center"
            src="/savefiles/<%=phones(item).Img%>"
            alt="Title" />
          <div class="card-body">
            <h5 class="card__title">
              <%=phones(item).Name%>
            </h5>
            <strong
              class="d-block text-decoration-none text-danger fz-bold text-center">
              <%=phones(item).Price%>

            </strong>
            <div class="text-center">
              <i class="fa-solid fa-cart-shopping"></i>
            </div>
          </div>
        </div>
      </a>
    </div>
      <% Next %>   


        </div>
      </div>
    </div>
  </body>
</html>


<!-- #include file="db/connectDB.asp" -->
<!--#include file="./models/Phone.asp" -->
<%
  if (Session("isAdmin")=0)then
  Response.redirect("/")
  end if

  Set phones = Server.CreateObject("Scripting.Dictionary")
  Dim  seq, Aphone
  Set recordset = connection.Execute("select * from phones where status=1 order by createdAt asc")

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
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </head>
  <body>
    <!-- SideBar -->
     <h2 class="text-center">San Pham</h2>

    <div class="container-fluid row position-relative">
      <!--#include file="./components/sidebar.asp"  -->
      <div class="col-10">
      <div class="d-flex gap-2">
      <form  class="d-flex" action="productAdminSearch.asp" method="post">
      <input class ="form-control "  name="keyword" /> 
      <button class="btn btn-primary"  type="submit">Tim Kiem</button>
      </form>
      <a class="btn btn-primary"  href="productForm.asp">Them San Pham</a>
      </div>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">MSP</th>
                <th scope="col">Ten</th>
                <th scope="col">Anh</th>
                <th scope="col">So luong</th>
                <th scope="col">Gia</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>

              </tr>
            </thead>
            <tbody>


            <% For Each item in phones %> 
              <tr class="">
                <td scope="row"><%=phones(item).Id%></td>
                <td scope="row"><%=phones(item).name%></td>
                <td scope="row">
                <img width="100px" src="/savefiles/<%=phones(item).Img%>" />
                </td>
                <td scope="row"><%=phones(item).Qty%></td>
                <td scope="row"><%=phones(item).price%></td>

                <td scope="row"><%=phones(item).Status%></td>
                <td>
                <a href="/ProductForm.asp?id=<%=phones(item).Id%>">
                <i class="fa-regular fa-pen-to-square"></i>
                </a>
                 <a href="/deleteProduct.asp?prodcutId=<%=phones(item).Id%>">
                <i class="fa-regular fa-pen-to-square"></i>
                </a>
                </td>
                </tr>
              <% Next %>             
            </tbody>
          </table>
        </div>
      </div>
    </div>

      
  </body>
</html>

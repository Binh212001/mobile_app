
<!-- #include file="./db/connectDB.asp" -->

<%
  dim userId
  userId = Session("userId")
  
  'check user have been login yet!
  if (not isnull(userId)) then
  'if user lack "address" or "phone"  ===> update user


    dim sql 
    sql=  "SELECT carts.* , phones.phoneName , phones.price , phones.image  FROM  carts join  phones  on carts.phoneId = phones.id where userId=?"
    Dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connection
    cmdPrep.CommandType=1
    cmdPrep.Prepared=true
    cmdPrep.CommandText = sql

    cmdPrep.Parameters(0)=userId
    dim result 
    set result = cmdPrep.execute()

  else
  Response.redirect("../login.asp")
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
      href="./css/dist/bootstrap-5.0.2-dist/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer" />
  </head>
  <body>
    <!--#include file="./components/header.asp"  -->
    <div class="container">
      <div class="row">
        <div class="col-8 table-responsive">
          <h5 class="text-center">Gio hang</h5>

          <table class="table bg-white">
            <thead>
              <tr>
                <th>Id</th>
                <th>Product</th>
                <th>Image</th>
                <th>Price</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
            <%
             do while not Result.EOF
            %>
              <tr>
                <td scope="row"><%=result("id")%></td>
                <td><%=result("phoneName")%></td>
                <td><img src="./savefiles/<%=result("image")%>" width="200"/></td>
                <td><%=result("price")%></td>
                <td><a href="deletecart.asp?cartId=<%=result("id")%>" class="fa fa-trash" aria-hidden="true"></a></td>
              </tr>
              <%
                Result.MoveNext
                loop
              %>
            </tbody>
          </table>
        </div>
        <div class="col-4">
          <h5 class="text-center">Da mua</h5>
          <div class="card text-start">
            <img
              class="card-img-top"
              src="assets/image/redminote12pro5g-0.webp"
              alt="Title" />
            <div class="card-body">
              <h4 class="card-title">Name</h4>
              <div>So luong</div>
              <p class="card-text">Total</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

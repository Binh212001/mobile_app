
<!-- #include file="./db/connectDB.asp" -->

<%
  dim userId
  userId = Session("userId")
  
  'check user have been login yet!
  if (not isnull(userId)) then
  'if user lack "address" or "phone"  ===> update user


    dim sql  , sql2
    sql=  "SELECT carts.* , phones.phoneName , phones.price , phones.image  FROM  carts join  phones  on carts.phoneId = phones.id where userId=?"
    sql2=  "SELECT orders.* , phones.phoneName , phones.price , phones.image  FROM  orders join  phones  on orders.phoneId = phones.id where userId=? and orders.status=1"
   
    Dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connection
    cmdPrep.CommandType=1
    cmdPrep.Prepared=true
    cmdPrep.CommandText = sql

    cmdPrep.Parameters(0)=userId
    dim result  , orderresult
    set result = cmdPrep.execute()
    cmdPrep.CommandText = sql2

    cmdPrep.Parameters(0)=userId
    set  orderresult =cmdPrep.execute

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
        <div class="col-6 table-responsive">
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
                <td><a href="deletecart.asp?cartId=<%=result("id")%>" class="fa fa-trash" aria-hidden="true"></a>
                      <a href="addorder.asp?phoneId=<%=result("phoneId")%>&color=<%=result("color")%>&capacity=<%="capacity"%>">
                        <i class="fa-solid fa-cart-shopping"></i>
                      </a>
                </td>
              </tr>
              <%
                Result.MoveNext
                loop
              %>
            </tbody>
          </table>
        </div>
        <div class="col-6 table-responsive">
          <h5 class="text-center"> Order</h5>

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
             do while not orderresult.EOF
            %>
              <tr>
                <td scope="row"><%=orderresult("id")%></td>
                <td><%=orderresult("phoneName")%></td>
                <td><img src="./savefiles/<%=orderresult("image")%>" width="200"/></td>
                <td><%=orderresult("price")%></td>
                <td><a href="userdeleteorder.asp?orderId=<%=orderresult("id")%>" class="fa fa-trash" aria-hidden="true"></a>
              
                </td>
              </tr>
              <%
                orderresult.MoveNext
                loop
              %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
</html>

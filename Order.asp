<!-- #include file="./db/connectDB.asp" -->

<%

  Dim cmdPrep
  set cmdPrep = Server.CreateObject("ADODB.Command")
  cmdPrep.ActiveConnection = connection
  cmdPrep.CommandType=1
  cmdPrep.Prepared=true
  cmdPrep.CommandText = "select * from orders join phones on orders.phoneId = phones.id "
  dim result
  set result = cmdPrep.execute()
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
    <!-- SideBar -->
    <h3 class="text-center">Don Hang</h3>
    <div class="container-fluid row">
      <div class="col-2">
        <a href="productAdmin.asp" class="d-block">San pham</a>
        <a href="order.asp" class="d-block">Don Hang</a>
      </div>
      <div class="col-10">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">MSP</th>
                <th scope="col">Ten</th>
                <th scope="col">Anh</th>
                <th scope="col">So luong</th>
                <th scope="col">Tong</th>
                <th class="col">action</th>
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
                <td><%=result("price")%></td>

                <td><a href="deleteorder.asp?orderId=<%=result("id")%>" class="fa fa-trash" aria-hidden="true"></a></td>
              </tr>
              <%
                Result.MoveNext
                loop
              %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
</html>


<!-- #include file="./db/connectDB.asp" -->

<% 
dim name 
name= Request.QueryString("name")
if(TRIM(name)<>"" and not isnull(name)) then
  Session("notfound") = "Khong tim  thay"
else
  Dim cmdPrep
  set cmdPrep = Server.CreateObject("ADODB.Command")
  cmdPrep.ActiveConnection = connection
  cmdPrep.CommandType=1
  cmdPrep.Prepared=true
  cmdPrep.CommandText = "select * from phones where status=1 and phoneName like '%"+name+"%'"
  dim Result
  set Result = cmdPrep.execute()
end if

%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <!--#include file="./components/Header.asp"  -->

    <main>

      <section class="content mt-5">
        <div class="row container-fluid gutter">

          <%
            do while not Result.EOF
            %>
          <div class="card col-lg-3">
            <a href="../SingleProduct.asp?id=<%=result("id")%>">
              <div class="card text-start">
                <img
                  width="100%"
                  class="card-img-top text-center"
                  src="/savefiles/<%=result("image")%>"
                  alt="Title" />
                <div class="card-body">
                  <h5 class="card__title"><%=result("phoneName")%></h5>
                  <strong
                    class="d-block text-decoration-none text-danger fz-bold text-center">
                    <%=result("id")%>
                  </strong>
                  <div class="text-center">
                    <i class="fa-solid fa-cart-shopping"></i>
                  </div>
                </div>
              </div>
            </a>
          </div>

            <%
                Result.MoveNext
                loop
              %>
        </div>
      </section>
    </main>
  </body>
</html>

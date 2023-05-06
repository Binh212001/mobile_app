
<!-- #include file="db/connectDB.asp" -->


<%
  if (Request.ServerVariables("REQUEST_METHOD") = "POST") THEN        

  Dim username, password
  username = Request.Form("username")
  password = Request.Form("password")
If (NOT isnull(username) AND NOT isnull(password) AND TRIM(username)<>"" AND TRIM(password)<>"" ) Then
    ' true
    Dim sql
    sql = "select * from users where username= ? and password= ?"
    Dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connection
    cmdPrep.CommandType=1
    cmdPrep.Prepared=true
    cmdPrep.CommandText = sql
    cmdPrep.Parameters(0)=username
    cmdPrep.Parameters(1)=password
    Dim result
    set result = cmdPrep.execute()
    'kiem tra ket qua result o day
    If not result.EOF Then
        ' dang nhap thanh cong
        Session("username")=result("username")
        Session("address")=result("address")
        Session("displayName")=result("displayName")
        Session("userCreatedAt")=result("createdAt")
        Response.redirect("home.asp")
    Else
    Session("LoginError")="Tai khon la mat khau khong chinh xac"
    result.Close()
    connection.Close()
    End if
    End if
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
  </head>
  <body>
    <div
      class="d-flex flex-column justify-contents-center"
      style="
        height: 100vh;
        background-image: url(./assets/image/slide1.webp);
        background-repeat: no-repeat;
        background-size: cover;
      ">
      <h5 class="text-center"><%Response.Write(Session("LoginError"))%></h5>
      <form style="width: 60%"  method="post" action="Login.asp" class="bg-white rounded border m-auto p-3">
        <h4 class="text-center fz-bold">Login</h4>
        <div class="mb-3">
          <label for="username">Tai Khoan</label>
          <input type="text " name="username" class="form-control" />
        </div>
        <div class="mb-3">
          <label for="password">Mat khau</label>
          <input type="password" name="password" class="form-control" />
        </div>

        <div class="d-grid">
          <div class="text-center mb-3">
            Ban chua co tai khoan.<a href="/register.asp">Dang ki ngay</a>
          </div>
          <button class="btn btn-primary btn-sm mb-3" type="submit" 
            >Dang Nhap
          </button>
        </div>
      </form>
    </div>
  </body>
</html>

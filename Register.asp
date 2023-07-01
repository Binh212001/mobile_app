
<!-- #include file="db/connectDB.asp" -->

<%

  if (Request.ServerVariables("REQUEST_METHOD") = "POST") THEN  

    Dim username, password , displayName , confirmPassword
    username = Request.Form("username")
    password = Request.Form("password")
    displayName = Request.Form("displayName")
    confirmPassword = Request.Form("confirmPassword")


    If (NOT isnull(username) AND NOT isnull(password) AND NOT isnull(displayName) AND NOT isnull(confirmPassword) AND TRIM(username)<>"" AND TRIM(password)<>"" AND TRIM(password)=TRIM(confirmPassword) ) Then
    ' true

      'check user da dang ki chua
      Dim cmdPrep, Result
      Set cmdPrep = Server.CreateObject("ADODB.Command")
      cmdPrep.ActiveConnection = connection
      cmdPrep.CommandType = 1
      cmdPrep.CommandText ="select * from users where username=?"
      cmdPrep.Parameters(0)=username
      Set result= cmdPrep.execute()

      If not result.EOF Then
      ' username da ton tai
        Session("userExiting")="Username da ton tai"
        Response.redirect("register.asp")
      Else
        'dang ki
        cmdPrep.CommandText =  "insert into users(username,password,displayName ) values (?,?,?)"
        cmdPrep.Parameters(0)=username
        cmdPrep.Parameters(1)=password
        cmdPrep.Parameters(2)=displayName
        
        set result= cmdPrep.execute() 
        Response.redirect("login.asp")
        result.Close()
        connection.Close()
      End if
    end if
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
  <div><%=Session("userExiting")%></div>
    <div
      class="d-flex flex-column justify-contents-center"
      style="
        height: 100vh;
        background-image: url(./assets/image/slide1.webp);
        background-repeat: no-repeat;
        background-size: cover;
      ">
      <form method="post" action="register.asp" style="width: 60%" class="bg-white rounded border m-auto p-3">
        <h4 class="text-center fz-bold">Dang ki</h4>
        <div class="mb-3">
          <label for="username">Tai Khoan</label>
          <input type="text " class="form-control"id="username" name="username" />
        </div>
        <div class="mb-3">
          <label for="password">Mat khau</label>
          <input type="password" class="form-control" id="password" name="password"  />
        </div>

        <!-- dang ki -->
        <div class="mb-3">
          <label for="name">Ho va Ten:</label>
          <input type="text " class="form-control" name="displayName" id="displayName" />
        </div>
        <div class="mb-3">
          <label for="confirmPassword">Confirm password:</label>
          <input type="password" class="form-control" name="confirmPassword" id="confirmPassword"  />
        </div>
        <div class="d-grid">
          <button type="submit" class="btn btn-danger btn-sm mb-3"   role="button"
            >Dang ki
          </button>
        </div>
      </form>
    </div>
  </body>
</html>

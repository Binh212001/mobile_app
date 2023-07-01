<!-- #include file="db/connectDB.asp" -->
<!-- #include file="aspuploader/include_aspuploader.asp" -->
<!--#include file="./models/User.asp" -->


<%

  Dim cmdPrep
  set cmdPrep = Server.CreateObject("ADODB.Command")
  cmdPrep.ActiveConnection = connection
  cmdPrep.CommandType=1
  cmdPrep.Prepared=true
  
  displayName = Request.Form("displayName")
  address = Request.Form("address")
  phone = Request.Form("phone")

  if (not isnull(displayName) and not isnull(address) and not isnull(phone) and TRIM(displayName)<>"" and TRIM(address)<>"" and TRIM(phone)<>"")then

  dim sqlupdateUser
  sqlupdateUser = "update users set displayName=? , phone=?, address=? where id=?"
  cmdPrep.CommandText =sqlupdateUser
  cmdPrep.Parameters(0)=displayName
  cmdPrep.Parameters(1)=phone
  cmdPrep.Parameters(2)=address
  cmdPrep.Parameters(3)=cint(Session("userId"))
  cmdPrep.execute()


  Session("displayName") = displayName
  Session("phone") = phone
  Session("address") = address


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
    <link rel="stylesheet" href="./css/index.css" />

    <link rel="stylesheet" href="./css/home.css" />
    <link
      rel="stylesheet"
      href="./css/dist/bootstrap-5.0.2-dist/css/bootstrap.min.css" />
  </head>
  <body>
    <!--#include file="./components/Header.asp"  -->
    <div class="container">
      <div>
        <div class="row mt-4">
          <div class="col-3">
          <%
          if Session("avatar")<> "" then
            Response.write("<img width='100%' src='savefiles/"+Session("avatar")+"'/>")
          else
            Response.write("<img src='assets/image/logo.png'/>")
          end if
          %>
          <form method="post">
              <%
				Dim uploader
				Set uploader=new AspUploader
				uploader.MaxSizeKB=10240
				uploader.Name="picture"
				uploader.InsertText="Upload File (Max 10M)"
				uploader.MultipleFilesUpload=true
        uploader.AllowedFileExtensions="*.jpg,*.png,*.gif,*.zip"
		    uploader.SaveDirectory="savefiles"
        
				%>
				<%=uploader.GetString() %>
            </form>
          </div>
          <div class="col-8">
            <div class="mb-3">
              <strong>id:</strong>
              <%=Session("userId")%>
            </div>

            <div class="mb-3">
              <strong>Ten:</strong>
              <%=Session("displayName")%>

            </div>

            <div class="mb-3">
              <strong>Dia chi:</strong>
              <%=Session("address")%>

            </div>

            <div class="mb-3">
              <strong>SDT:</strong>
              <%=Session("phone")%>

            </div>
          </div>

          <form method="post">
            <div class="mb-3">
              <label class="form-label">Ten</label>
              <input
                class="form-control"
                name="displayName"
                placeholder="abc@mail.com" />
            </div>
            <div class="mb-3">
              <label class="form-label">SDT</label>
              <input
                class="form-control"
                name="phone"
                placeholder="So dien thoai" />
            </div>
            <div class="mb-3">
              <label class="form-label">Dia chi</label>
              <input
                class="form-control"
                name="address"
                placeholder="Dia chi" />
            </div>

            <button class="btn btn-success" type="submit">Cap Nhat</button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>

<%



  If Request.Form("picture")&""<>"" Then
  
  dim mvcfile
  Set mvcfile=uploader.GetUploadedFile(Request.Form("picture")) 
  picture =mvcfile.FileName


    cmdPrep.CommandText ="update users  set  avatar =? where id=?"
    cmdPrep.Parameters(0)=picture
    cmdPrep.Parameters(1)=cint(Session("userId"))
    cmdPrep.execute()
    Session("avatar")=picture

  
end if
%>
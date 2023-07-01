<!-- #include file="db/connectDB.asp" -->
<!--#include file="./models/Phone.asp" -->
<!--#include file="./models/Color.asp" -->
<!--#include file="./models/Capacity.asp" -->


<%
  dim id  , APhone , Acolor  ,seq
  Set colors = Server.CreateObject("Scripting.Dictionary")
  Set capacities = Server.CreateObject("Scripting.Dictionary")



  id= Request.QueryString("id") 'lay id tren url
  sqlGetPhone = "select * from phones where id=? "
  

    Dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connectionString
    cmdPrep.CommandType=1
    cmdPrep.Prepared=true
    'Tao commantext
    cmdPrep.CommandText = sqlGetPhone
    cmdPrep.Parameters(0)=id
 
    Dim result 
    set result = cmdPrep.execute() 'tra ve 1 danh sach
    if not result.EOF then
      set Aphone = new Phone
      Aphone.Name = result("phoneName")
      Aphone.Img = result("image")
      Aphone.Desc = result("description")
      Aphone.Qty = result("quantity")
      Aphone.Price = result("price")
    end if


    'load mau
    
    Set recordset = connection.Execute("select * from getColorOfPhone('"+id+"')")
    seq = 0
    Do While Not recordset.EOF
    seq = seq+1

    set Acolor = New Color
    Acolor.Id = recordset.Fields("id")
    Acolor.Color = recordset.Fields("colorName")

    colors.add seq, Acolor

    recordset.MoveNext
  Loop 
 'load
  Set recordset = connection.Execute("select * from getCapacityOfPhone('"+id+"')")

   Do While Not recordset.EOF
    seq = seq+1
    set Acapacity = New Capacity
    Acapacity.Id = recordset.Fields("id")
    Acapacity.Rom = recordset.Fields("rom")
    Acapacity.Ram = recordset.Fields("ram")
    capacities.add seq, Acapacity
    recordset.MoveNext
  Loop 

%>

<%
  dim  colorselect  ,   capacityselect
  colorselect = Request.form("color")
  capacityselect = Request.form("capacity")
  IF(not  isnull(colorselect) and not isnull(capacityselect)and TRIM(colorselect)<>"" and TRIM(capacityselect)<>"")then
  Response.redirect("/addtocart.asp?phoneId="+id+"&color="+colorselect+"&capacity="+capacityselect+"")
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
    <link rel="stylesheet" href="./css/header.css" />
    <link
      rel="stylesheet"
      href="./css/dist/bootstrap-5.0.2-dist/css/bootstrap.min.css" />
  </head>
  <body>
    

    <!--#include file="./components/header.asp"  -->

    <main>
      <div class="product row container mt-5">
        <!-- Product Left  -->
        <div class="col-lg-6 text-center">
          <img
            width="60%"
            src="./assets/image/redminote12pro5g-0.webp"
            alt="" />
        </div>

        <!-- Product Right  -->
        <div class="col-lg-6">
          <h5><%=Aphone.Name%></h5>
          <p class="mt-3">
            <strong>Mô tả:</strong>
            <%=Aphone.Desc%>
          </p>

          <div class="price">
            <strong>Giá:</strong>
            <span class="text-danger fw-bold">
            <%=Aphone.Price%>
            </span>
          </div>
          <form method="post">
          <div class="mt-3 d-flex gap-2 align-items-center">
            <strong>Màu:</strong>
              <% For Each item in colors %> 
                <input type="radio" name="color" required  placeholder="Loai" value = "<%= colors(item).Color %>"   />
                <span><%= colors(item).Color %> </span>
              <% Next %>
          </div>
          <div class="d-flex gap-2 align-items-center">
            <strong>Capacities:</strong>
              <% For Each item in capacities %> 
                <input type="radio" name="capacity" required  placeholder="Loai" value = "<%= capacities(item).Rom %>/<%= capacities(item).Ram %>"  />
                <span><%= capacities(item).Rom %> / <%= capacities(item).Ram %>  GB </span>
              <% Next %>
          </div>
        
            <button type="submit"  class="btn btn-danger">Thêm vào giỏ hàng</button>
   
          </form>

        </div>
      </div>
    </main>
  </body>
</html>


<!-- #include file="./db/connectDB.asp" -->

<%
dim color , capacity , phoneId , userId
  userId = Session("userId")
  phoneId  = Request.QueryString("phoneId")
  color  = Request.QueryString("color")
  capacity  = Request.QueryString("capacity")

  'check user have been login yet!
  if (not isnull(Session("userId"))) then
  'if user lack "address" or "phone"  ===> update user
    if(not isnull(Session("address")) and not isnull(Session("phone")) and trim(Session("address"))<>"" and trim(Session("phone"))<>""  ) then
    'add to cart
    Dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    cmdPrep.ActiveConnection = connection
    cmdPrep.CommandType=1
    cmdPrep.Prepared=true
    dim sql  
    sql=  "insert into carts(userId , phoneId , color, capacity) values(?,?,?,?)"
    cmdPrep.CommandText = sql


    cmdPrep.Parameters(0)=userId
    cmdPrep.Parameters(1)=cint(phoneId)
    cmdPrep.Parameters(2)=color
    cmdPrep.Parameters(3)=capacity

    cmdPrep.execute
    Response.redirect("../cart.asp")

    else
      Response.redirect("../user.asp")
    end if
  else
  Response.redirect("../login.asp")
  end if
%>

<!-- #include file="./db/connectDB.asp" -->

<%
  dim orderId  
  'lay tren url
  orderId = Request.QueryString("orderId")


  Response.write(orderId)
  if(not isnull(orderId) and trim(orderId)<>"")then


  Dim cmdPrep
  set cmdPrep = Server.CreateObject("ADODB.Command")
  cmdPrep.ActiveConnection = connection
  cmdPrep.CommandType=1
  cmdPrep.Prepared=true
  cmdPrep.CommandText = "update  orders set status=0 where id=? "
  cmdPrep.Parameters(0)=orderId
  cmdPrep.execute()

  Response.redirect("./cart.asp")

  end if

%>

<!-- #include file="./db/connectDB.asp" -->

<%
  dim orderId  
  orderId = Request.QueryString("orderId")

  Response.write(orderId)
  if(not isnull(orderId) and trim(orderId)<>"")then
 

  Dim cmdPrep
  set cmdPrep = Server.CreateObject("ADODB.Command")
  cmdPrep.ActiveConnection = connection
  cmdPrep.CommandType=1
  cmdPrep.Prepared=true
  cmdPrep.CommandText = "DELETE FROM orders where id=? "
  cmdPrep.Parameters(0)=orderId
  cmdPrep.execute()

  Response.redirect("./order.asp")

  end if

%>
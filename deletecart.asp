
<!-- #include file="./db/connectDB.asp" -->

<%
  dim cartId  
  cartId = Request.QueryString("cartId")

  Response.write(cartId)
  if(not isnull(cartId) and trim(cartId)<>"")then
 

  Dim cmdPrep
  set cmdPrep = Server.CreateObject("ADODB.Command")
  cmdPrep.ActiveConnection = connection
  cmdPrep.CommandType=1
  cmdPrep.Prepared=true
  cmdPrep.CommandText = "Delete from   carts  where id=? "
  cmdPrep.Parameters(0)=cartId
  cmdPrep.execute()

  Response.redirect("./Cart.asp")

  end if

%>
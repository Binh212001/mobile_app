<!-- #include file="./db/connectDB.asp" -->

<%
  dim prodcutId  
  prodcutId = Request.QueryString("prodcutId")

  Response.write(prodcutId)
  if(not isnull(prodcutId) and trim(prodcutId)<>"")then
 

  Dim cmdPrep
  set cmdPrep = Server.CreateObject("ADODB.Command")
  cmdPrep.ActiveConnection = connection
  cmdPrep.CommandType=1
  cmdPrep.Prepared=true
  cmdPrep.CommandText = "update phones set status=0 where id=? "
  cmdPrep.Parameters(0)=prodcutId
  cmdPrep.execute()

  Response.redirect("./productAdmin.asp")

  end if

%>
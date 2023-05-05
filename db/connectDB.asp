<%
'code here
 Dim connection, connectionString

  connectionString = Application("connectionString")

  Set connection = Server.CreateObject("ADODB.Connection")
  
  connection.ConnectionString = connectionString
  connection.Open()
%>
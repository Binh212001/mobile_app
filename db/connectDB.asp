<%
'code here
 Dim connection, connectionString

  connectionString = Application("connectionString") 'Lay trong global.asa

  Set connection = Server.CreateObject("ADODB.Connection")
  
  connection.ConnectionString = connectionString
  connection.Open()
%>
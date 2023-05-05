<%
Dim email, password
email = Request.Form("email")
password = Request.Form("password")
If (NOT isnull(email) AND NOT isnull(password) AND TRIM(email)<>"" AND TRIM(password)<>"") Then
    ' true
    Dim sql
    sql = "select * from TAIKHOAN where email= ? and password= ?"
    Dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType=1
    cmdPrep.Prepared=true
    cmdPrep.CommandText = sql
    cmdPrep.Parameters(0)=email
    cmdPrep.Parameters(1)=password
    Dim result
    set result = cmdPrep.execute()
    'kiem tra ket qua result o day
    If not result.EOF Then
        ' dang nhap thanh cong
        Session("email")=result("email")
        Session("Success")="Login Successfully"
        Dim carts(2)
        carts(0)=5
        carts(1)=10
        carts(2)=15
        Session("s_Carts") = carts
        Response.redirect("index.asp")
    Else
        ' dang nhap ko thanh cong
        Session("Error") = "Wrong email or password"
    End if
    result.Close()
    connDB.Close()
Else
    ' Kiem tra vi co the trung voi truong hop logout
    If (Request.ServerVariables("REQUEST_METHOD") = "POST") Then
        Session("Error")="Please input email and password."
    End if
    
End if
<%@ Language="VBScript" %>   
<!-- #include file="aspuploader/include_aspuploader.asp" -->  
<html>   
<head>   
</head>   
<body>   
        <form id="form1" method="POST">   
        <%   
            Dim uploader   
            Set uploader=new AspUploader   
            uploader.Name="myuploader"  
            uploader.Render()   
        %>   
        </form>   
               
<%   
  
If Request.Form("myuploader")&""<>"" Then  
    Dim mvcfile   
    Set mvcfile=uploader.GetUploadedFile(Request.Form("myuploader"))   
       
    Response.Write("<div style='font-family:Fixedsys'>")   
    Response.Write("Uploaded File")   
    Response.Write("<br/><br/>FileName: ")   
    Response.Write(mvcfile.FileName)   
    Response.Write("<br/>FileSize: ")   
    Response.Write(mvcfile.FileSize)   
'   Response.Write("<br/>FilePath: ")   
'   Response.Write(mvcfile.FilePath)   
    Response.Write("</div>")   
End If  
  
%>   
                           
</body>   
</html>  
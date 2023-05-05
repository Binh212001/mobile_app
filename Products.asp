<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="./css/dist/bootstrap-5.0.2-dist/css/bootstrap.min.css" />
  </head>
  <body>
     <!--#include file="./components/header.asp"  -->
    <div class="container-fluid">
      <div class="row">
        <div class="col-2 bg-secondary">
          <strong> Categories: </strong>
          <select class="form-control" name="category" id="category">
            <option value="iphone">iphone</option>
            <option value="iphone">iphone</option>
            <option value="iphone">iphone</option>
            <option value="iphone">iphone</option>
          </select>
        </div>
        <div class="col-10 row">
          <!--#include file="./components/productItem.asp"  -->
          <!--#include file="./components/productItem.asp"  -->
          <!--#include file="./components/productItem.asp"  -->
          <!--#include file="./components/productItem.asp"  -->
        </div>
      </div>
    </div>
  </body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Currency Converter</title>
  <link rel="stylesheet" type="text/css" href="">
</head>
<body>
<h2>Currency Converter</h2>
<form action="/display-discount" method="POST">
  <label>Product Description: </label><br/>
  <input type="text" name="description"/><br/>
  <label>List Price: </label><br/>
  <input type="text" name="price" value=0><br/>
  <label>Discount Percent: </label><br/>
  <input type="text" name="percent"/><br/>
  <input type = "submit" id = "submit" value = "Calculate Discount"/>
</form>
</body>
</html>
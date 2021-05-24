<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fashion Folks</title>
</head>
<link rel="icon" href="pics/f1.png" type="image/x-icon">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
   <link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
body {
  font-family: Arial, Helvetica, sans-serif;
}
.w3-allerta {
  font-family: "Allerta Stencil", Sans-serif;
}

.total{
background-color: #f2f2f2;
height:100%;
width:100%;
}
</style>
<body>
<div class="total">
<div class="w3-container">
  <div class="w3-bar w3-blue">
  <table><tr><td style="padding-left:100px ">
   <a href="AfterLoginHomePage.jsp" style="margin-left:20% ;color:white;font-size:40px;font-family:Righteous;text-decoration:none">F2</a>
</td>
<td><div  style="padding-left:700px"></div></td>
    <td><div class="w3-dropdown-hover w3-mobile">
    <button class="w3-button w3-blue">MyAccount<i class="fa fa-caret-down" style="text-decoration:none"></i></button>
      <div class="w3-dropdown-content w3-bar-block ">
        <a href="#" class="w3-bar-item w3-button w3-mobile">My Profile</a>
        <a href="Login.html" class="w3-bar-item w3-button w3-mobile">Logout</a>
      </div>
    </div></td>
    <td><div class="w3-dropdown-hover w3-mobile">
    <button class="w3-button w3-blue">More<i class="fa fa-caret-down" style="text-decoration:none"></i></button>
      <div class="w3-dropdown-content w3-bar-block ">
        <a href="AboutUs.html" class="w3-bar-item w3-button w3-mobile">AboutUs</a>
        <a href="MyOrdersServlet" class="w3-bar-item w3-button w3-mobile">MyOrders</a>
        <a href="DownApp.html" class="w3-bar-item w3-button w3-mobile">Download</a>
      </div>
    </div></td><td style="padding-left:25px ">
     <a href="MyCartServlet" class="w3-bar-item w3-button w3-mobile" style="text-decoration:none;color:white">Cart</a></td></tr></table>
  </div>
</div>
<div class="w3-container">
  <div class="w3-bar w3-white">
    <div class="w3-dropdown-hover w3-mobile"  style="margin-left:15%">
      <button class="w3-button" style="background-color:white">Mobiles<i class="fa fa-caret-down"></i></button>
      <div class="w3-dropdown-content w3-bar-block">
        <a href="SelectServlet?subId=10" class="w3-bar-item w3-button w3-mobile">Samsung</a>
        <a href="SelectServlet?subId=11" class="w3-bar-item w3-button w3-mobile">Redmi</a>
        <a href="SelectServlet?subId=13" class="w3-bar-item w3-button w3-mobile">Oppo</a>
        <a href="SelectServlet?subId=12" class="w3-bar-item w3-button w3-mobile">One plus</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-mobile"  style="margin-left:15%">
      <button class="w3-button">Dresses<i class="fa fa-caret-down"></i></button>
      <div class="w3-dropdown-content w3-bar-block">
        <a href="SelectServlet?subId=14" class="w3-bar-item w3-button w3-mobile">Ethnic</a>
        <a href="SelectServlet?subId=15" class="w3-bar-item w3-button w3-mobile">Western</a>
        <a href="SelectServlet?subId=16" class="w3-bar-item w3-button w3-mobile">Summer</a>
         <a href="SelectServlet?subId=17" class="w3-bar-item w3-button w3-mobile">Winter</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-mobile"  style="margin-left:15%">
      <button class="w3-button">Books<i class="fa fa-caret-down"></i></button>
      <div class="w3-dropdown-content w3-bar-block">
        <a href="SelectServlet?subId=23" class="w3-bar-item w3-button w3-mobile">Comics</a>
        <a href="SelectServlet?subId=24" class="w3-bar-item w3-button w3-mobile">Fiction</a>
        <a href="SelectServlet?subId=25" class="w3-bar-item w3-button w3-mobile">Kids</a>
          <a href="SelectServlet?subId=26" class="w3-bar-item w3-button w3-mobile">Business</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-mobile"  style="margin-left:15%">
      <button class="w3-button">Furniture<i class="fa fa-caret-down"></i></button>
      <div class="w3-dropdown-content w3-bar-block">
        <a href="SelectServlet?subId=18" class="w3-bar-item w3-button w3-mobile">Home Light</a>
        <a href="SelectServlet?subId=19" class="w3-bar-item w3-button w3-mobile">Home Decor</a>
        <a href="SelectServlet?subId=20" class="w3-bar-item w3-button w3-mobile">Festive Decor</a>
         <a href="SelectServlet?subId=21" class="w3-bar-item w3-button w3-mobile">Pet Supplies</a>
      </div>
    </div>
  </div>
</div>
</br></br>
 <img src="pics/${customer.profilePath}" style="margin-left:600px"height=270px width=200px>
</br></br></br></br>
<div style="margin-left:520px">
<form action="UpdateServlet?custId=${customer.custId}" method="Post" enctype="multipart/form-data">
<h4>Personal Information</h4>
  <input type="text" name="firstName"  value="${customer.firstName}" size="26px">&nbsp&nbsp&nbsp&nbsp
  <input type="text" name="lastName" value="${customer.lastName}" size="26px"></br></br>
    <h4>User Name & Password</h4>
    <input type="text" name="userName" value="${customer.userName}" readonly = "true" size="26px">&nbsp&nbsp&nbsp&nbsp
        <input type="password" name="password" value="${customer.password}" size="26px"></br></br>
    <h4>Email ID</h4>
    <input type="text" name="email" value="${customer.email}" size="60px"></br></br>
    <h4>Mobile no.</h4>
    <input type="text" name="phoneNum" value="${customer.phoneNum}" size="26px"></br></br>
   <h4>Upload Image : </h4> <input type="file"  name="file"  id="file"  required"></br></br>
   <input style="background-color:rgb(0, 98, 230);color:white;padding:10px" type="submit" value="Update"></br></br>
</form>
</div>

</div>



<div style="background-color:rgb(0, 26, 51);margin-top:0px">
</br></br></br>
<table>
<tr>
<td>
<a target="_blank" href="https://www.facebook.com/flipkart" class="fa fa-facebook" style="margin-left:100px;font-size:60px;padding-left:20px"></a>
</td><td><a target="_blank" href="https://twitter.com/flipkart" class="fa fa-twitter" style="margin-left:108px;font-size:60px"></a>
</td><td><a target="_blank" href="https://www.youtube.com/flipkart" class="fa fa-google-plus" style="margin-left:112px;font-size:60px"></a>
</td><td><a target="_blank" href="https://plus.google.com/109591199284807005836/posts" class="fa fa-youtube" style="margin-left:114px;font-size:60px"></a>
<td>
<div style="color:white;padding-left:50px">
<h4 style="color:grey">Mail Us:</h4>
<h5>Fashion Folks Internet Pvt Ltd Block B (Begonia),</h5>
<h5>Ground Floor, Embassy Tech Village,</h5>
<h5>Outer Ring Road, Devarabeesanahalli Village,</h5>
<h5>Varthur Hobli, Bengaluru East Taluk,</h5>
<h5>Bengaluru District,</h5>
<h5>Karnataka, India, 560103.</h5>
</div>
</td>
<td>
<div style="color:white">
<h4 style="color:grey">Registered Office Address:</h4>
<h5>Flipkart Internet Private Limited,</h5>
<h5>Vaishnavi Summit, Ground Floor, 7th Main,</h5>
<h5>80 Feet Road, 3rd Block,</h5>
<h5>Koramangala,</h5>
<h5>Bengaluru - 560034</h5>
<h5>India</h5>
<h5>CIN : U51109KA2012PTC066107</h5>
<h5>Telephone: 1800 208 9898</h5>
</div>
</td>
</tr>
</table>
</br></br></br>
</div>
</body>
</html>

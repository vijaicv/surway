<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SurWay-LoginPage</title>
<link rel="stylesheet" type="text/css" href="CSS/loginSignup.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap" rel="stylesheet">
</head>
<body>
<div class="loginmainbox">
<p class="porange">Hello there,<br>Welcome Back</p>
<div class="mailbox">
<div class="flex-container">
<form>
<img src="images/mailid.png">
<input type="email" name="email" placeholder="email id">
</form>
</div>
</div>
<div class="passwordbox">
<div class="flex-container">
<form>
<img src="images/password.png">
<input type="password" name="pwd" placeholder="password">
</form>
</div>
</div>
<div class="loginbuttonbox">
<div class="flex-container">
<img src="images/login.png"><font color="white">Login</font>
</div>
</div>
</div>
<div class="verticalline"></div>
<div class="signupmainbox">
<p class="porange">Get On Board</p>
<div class="username">
<div class="flex-container">
<form>
<img src="images/username.png">
<input type="text" name="uname" placeholder="Name">
</form>
</div>
</div>
<div class="signupmail">
<div class="flex-container">
<form>
<img src="images/mailid.png">
<input type="email" name="email" placeholder="email id">
</form>
</div>
</div>
<div class="signuppassword">
<div class="flex-container">
<form>
<img src="images/password.png">
<input type="password" name="pwd" placeholder="password">
</form>
</div>
</div>
<div class="signupconfirmpassword">
<div class="flex-container">
<form>
<img src="images/password.png">
<input type="password" name="pwd" placeholder="Confirm password">
</form>
</div>
</div>
<div class="signupdob">
<div class="flex-container">
<form>
<img src="images/calender.png">
<font color="black" size="2">DOB</font><input type="date" name="dob" >
</form>
</div>
</div>
<div class="gender">
<div class="radio-toolbar">
<div class="flex-container">
<form>
  <font size="2"><input type="radio" name="gender" value="male" checked>Male
  <input type="radio" name="gender" value="female">Female
  <input type="radio" name="gender" value="other">Other </font> 
</form>
</div>
</div>
</div>
<div class="signupbuttonbox">
<div class="flex-container">
<img src="images/signup.png"><font color="white">SignUP</font>
</div>
</div>
</div>
</body>
</html>
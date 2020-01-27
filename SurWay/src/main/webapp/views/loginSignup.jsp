<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SurWay-LoginPage</title>
<link rel="stylesheet" type="text/css" href="CSS/loginSignup.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="loginmainbox">
		<form  name="loginform" action="/login" onsubmit="return loginVerification()">
			<p class="login">
				Hello there,<br>Welcome Back
			</p>
			<div class="mailbox">
				<div class="flex-container">

					<img src="images/mailid.png"> <input type="email" name="email" placeholder="email id">
				</div>
			</div>
			<div class="passwordbox">
				<div class="flex-container">
					<img src="images/password.png"> <input type="password" name="pwd" placeholder="password">
				</div>
			</div>
			<div class="loginbuttonbox">
				<div class="flex-container">
					<img id="btn1" src="images/login.png"> <button class="button" type="submit">Login</button>
				</div>
			</div>
		</form>
	</div>
	<div class="verticalline"></div>
	<div class="signupmainbox">
		<form name="signupform" action="/login" onsubmit="return signupVerification()">
			<p class="porange">Get On Board</p>
			<div class="username">
				<div class="flex-container">
					<img src="images/username.png"> <input type="text"
						name="uname" placeholder="Name">
				</div>
			</div>
			<div class="signupmail">
				<div class="flex-container">
					<img src="images/mailid.png"> <input type="email"
						name="email" placeholder="email id">
				</div>
			</div>
			<div class="signuppassword">
				<div class="flex-container">
					<img src="images/password.png"> <input type="password"
						name="pwd" placeholder="password">
				</div>
			</div>
			<div class="signupconfirmpassword">
				<div class="flex-container">
					<img src="images/password.png"> <input type="password"
						name="confirmpwd" placeholder="Confirm password">
				</div>
			</div>
			<div class="signupdepartment">
				<select name="department">
					<option value="department">---------Department----------</option>
					<option value="HR">HR</option>
					<option value="Microservices">MIcroservices</option>
					<option value="Testing">Testing</option>
					<option value="UI/UX">UI/UX</option>
					<option value="dataanalyst">Data Analyst</option>
				</select>
			</div>
			<div class="gender">
				<div class="flex-container">
					<font size="2"><input type="radio" name="gender"
						value="male" checked>Male <input type="radio"
						name="gender" value="female">Female <input type="radio"
						name="gender" value="other">Other </font>
				</div>
			</div>
			<div class="signupbuttonbox">
				<div class="flex-container">
					<img id="btn2" src="images/signup.png">
					<button class="button" type="submit">SignUP</button>
				</div>
			</div>
		</form>
	</div>
	<script src="js/loginSignup.js"></script>
</body>
</html>
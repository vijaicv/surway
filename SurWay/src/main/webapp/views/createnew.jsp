<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">
<style>
.box {
	background-color: white;
	margin-left: 75px;
	margin-right: 75px;
	height: 550px;
	margin-top: 100px;
	box-shadow: 2px 1px 4px 2px grey;
	border-radius: 25px;
}

.button {
	background-color: #FF9800;
	font-size: 20px;
	border: none;
	border-radius: 30px;
	padding: 16px 40px;
	margin-left: 600px;
	margin-top: 25px;
	color: white;
	transition: all 0.5s;
	cursor: pointer;
	box-shadow: 2px 1px 3px 0px grey;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

.head {
	text-align: center;
	padding-top: 50px;
	font-size: 65px;
	font-family: "Source Sans Pro";
}

.textarea {
	margin: 0 auto;
	padding: 10px;
	border-radius: 15px;
	border: 3px solid #03a9f4;
	font-size: 30px;
	text-align: center;
}

.title {
	margin: 0 auto;
	padding: 10px;
	border-radius: 15px;
	border: 3px solid #03a9f4;
	font-size: 30px;
	text-align: center;
}

.div1 {
	text-align: center;
	margin-top: 20px;
}

.div2 {
	position: absolute;
	top: 550px;
	left: 100px;
}
</style>
</head>
<body style="background-color: #03A9F4; font-family: Open Sans">
	<form action="/survey/create" method="post">

		<div class="box">
			<h1 class="head">Create New Survey</h1>
			<br>
			<div class="div1">
				<input type="text" name="title" maxlength="100" class="title"
					placeholder="Title"><br>
			</div>
			<input type="hidden" name="authorId" value="101">
			<div class="div1">
				<textarea name="description" class="textarea" rows="3" cols="25"
					maxlength="2000" placeholder="Description"></textarea>
			</div>

			<div class="div2">
				<button type="submit" class="button">
					<span>Submit</span>
				</button>
			</div>
		</div>
	</form>

</body>
</html>

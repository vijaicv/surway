<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">
<style>
.box {
	background-color: white;
	margin-left: 75px;
	margin-right: 75px;
	height: 200px;
	margin-top: 150px;
	box-shadow: 2px 1px 4px 2px grey;
	border-radius: 25px;
	padding: 30px;
	text-align: center;
}

.head {
	text-align: center;
	padding-top: 100px;
	font-size: 75px;
	font-family: "Source Sans Pro";
}

.button {
	background-color: #FF9800;
	font-size: 20px;
	border: none;
	border-radius: 30px;
	padding: 16px 40px;
	margin-left: 900px;
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

.url {
	padding: 10px;
	border-radius: 20px;
	border: 1px solid black;
	margin: 20px;
}

#copyButton {
	padding: 10px;
	border: none;
	border-radius: 20px;
	background-color: blue;
	color: white;
	font-weight: bold;
	cursor:pointer;
}
</style>

<script type="text/javascript">

function copyUrl() {
	  /* Get the text field */
	  var copyText = document.getElementById("urlBox");

	  /* Select the text field */
	  copyText.select();
	  copyText.setSelectionRange(0, 99999); /*For mobile devices*/

	  /* Copy the text inside the text field */
	  document.execCommand("copy");

	  /* Alert the copied text */
	  alert("url copied to clipboard");
	}

</script>
</head>
<body style="background-color: #03A9F4; font-family: Open Sans">

	<div class="box">
		<h3>Survey Published Sucessfully</h3>
		you can now share your survey via the url:<br /> 
		<input id="urlBox"
			class="url" style="width: 300px;"
			value="localhost:8080/question/view?survey=${surveyId}&q=1"><br>
		<button onclick="copyUrl()" id="copyButton">Copy url</button>
	</div>
</body>
</html>
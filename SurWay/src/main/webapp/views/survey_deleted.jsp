<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap" rel="stylesheet">
<style>
 .box{
  background-color: white;
  margin-left:75px;
  margin-right: 75px;
  height: 400px;
  margin-top: 150px;
  box-shadow: 2px 1px 4px 2px grey;
  border-radius: 25px;
 } 
 .head{
  text-align: center;
  padding-top: 100px;
  font-size: 75px;
  font-family:"Source Sans Pro";
 }
 .button{
  background-color: #FF9800;
  font-size: 20px;
  border:none;
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
  
</style>
</head>
<body style="background-color:#03A9F4;font-family: Open Sans">
  
    
<div class="box">
  <h1 class="head">Survey Deleted Sucessfully<h1>
    <button class="button"><span>Go to DashBoard</span></button>
</div>

</body>
</html>
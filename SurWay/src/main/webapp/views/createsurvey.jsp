<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bedrock2.surway.models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create SurWay</title>
<link rel="stylesheet" type="text/css" href="/css/createsurway.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">

 <script type="text/javascript" src="/js/createsurvey.js"></script>
 
 	<%
		Survey survey = (Survey)request.getAttribute("survey");
	%>
	
	

 <script type="text/javascript" src="/js/createsurvey.js"></script>



</head>
<body onload="disableRadio()">
    <h1><%= survey.getTitle() %></h1>
    <p id= "description"><%= survey.getDescription() %></p>
    <form action="/question/addQuestion" onsubmit= "checkEmpty(this)" method= "post">
    	 <div class="mainbox">
        	<div id = "typecontainer">
           		 <b><label>Type :-</label></b>
            	<select id="questiontype_container" onchange="selectingOptionType(this.value)" name="type">
                	<option value = "1" >MCQ</option>
                	<option value = "2" >Multiple Answer</option>
                	<option value = "3" >Descriptive</option>
                	<option value = "4" >Dropdown</option>
            	</select><br><br>
            	<input type="hidden" name="surveyId" value=<%= survey.getId() %>>
            	<input type = "checkbox" name="mandatory" value="true"><b>Mandatory</b><br><br><br><br>
            	<a id= "finishButton" href="/Dashboard/101">Finish</a><br>
            	<label>Q${qNum}</label>
            	<%
            		int num = (int)(request.getAttribute("qNum"));
            		System.out.println("Number From: "+num);
            	%>
            	
            	<input type="hidden" name="questionNumber" value=<%= num %>>
            	<textarea rows = "7" cols = "125" placeholder="Type your Question here." name="question" required="required"></textarea><br><br>
            	<div id= "MCQSection" style= "display: block">
           			<input class="myRadio" type ="radio">&nbsp&nbsp<input type= "text" name="optionOne" >
            		<input type ="radio" class="myRadio">&nbsp&nbsp<input type= "text" name="optionTwo" ><br><br>
            		<div id="additionalOption1" style= "display: none"><input type ="radio" class="myRadio">&nbsp&nbsp<input type= "text" name="optionThree"></div>
            		<div id="additionalOption2" style= "display: none"><input type ="radio" class="myRadio">&nbsp&nbsp<input type= "text" name="optionFour"><br><br></div>
            		<div id="additionalOption3" style= "display: none"><input type ="radio" class="myRadio">&nbsp&nbsp<input type= "text" name="optionFive"><br></div>
            		<center><button type= "button" onclick= "addingOption()">Add Option</button></center>
            	</div>
				<div id="multipleAnswers" style = "display: none">
					<input type ="radio" class="myRadio">&nbsp&nbsp<input type= "text" name="optionOne">
            		<input type ="radio" class="myRadio">&nbsp&nbsp<input type= "text" name="optionTwo"><br><br>
            		<div id="additionalOption1" style= "display: none"><input type ="radio" class="myRadio">&nbsp&nbsp<input type= "text" name="optionThree"></div>
            		<div id="additionalOption2" style= "display: none"><input type ="radio" class="myRadio">&nbsp&nbsp<input type= "text" name="optionFour"><br><br></div>
            		<div id="additionalOption3" style= "display: none"><input type ="radio" class="myRadio">&nbsp&nbsp<input type= "text" name="optionFive"><br></div>
            		<center><button type= "button" onclick= "addingOption()">Add Option</button></center>
				</div>
				<div id= "descriptive" style="display: none">
					<p style = "color: tomato;">Your expected responses for this question will be a normal paragraph with a maximum limit of 20000 charecters.</p>
				</div>
				<div id= "dropdownAnswer" style="display: none">
					<p style="color: tomato;">Dear User, Please list your options as a comma seperated list of values. for eg: you need to enter as tomato,orange,apple for the three option namely tomato, orange and apple</p>	
					<textarea rows="2" cols="125" name= "dropdownOptions"></textarea>		
				</div>
				<input id = "buttonNext" type="submit" name="next" value= "Next">    
        	</div>
      	</div>  
    </form>
   		


</body>
</html>
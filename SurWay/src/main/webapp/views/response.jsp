<%@page import="com.bedrock2.surway.models.Survey"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	%>
	<%@ page import="com.bedrock2.surway.models.*" %>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">
<title>SurWay Response Page</title>
<link rel="stylesheet" href="css/response.css">
</head>
<body bgcolor="#428ABF" style="font-family: Open Sans">

	<div class="headcontainer">
		<div id="hd">
			<h1>
				Employee feedback survey
				<h1>
		</div>
		<div id="hds">Survey to find out the employee feedback on current work atmostphere.</div>
	</div>

	<div class="questionstatcontainer">
	<%
	//getting objects of qstn and survey from db
	Survey survey=(Survey)request.getAttribute("surveyInfo");
	Question question=(Question)request.getAttribute("question");
    System.out.println(survey.getTitle()+question.getQuestion());
	//Question count is retrieved and giving properties to Question number status and progress bar
	//integer question count is taken from url
	// float totalqs=10;
	float totalqs=survey.getQuestionCount();
	 //float currentqs=4;
	 float currentqs=question.getId();
	 float barwidth=70;
	 float oneqsln=barwidth/totalqs;
	 float setbarwidth=currentqs*oneqsln;
	for(int i=1;i<=totalqs;i++)
	{
	%>
		<div class="questionstat">
			<div class="qsstat" style="color: white"><%=i %></div>
		</div>
	
	<% 
	}
	
	%>
	</div>
	<br>
	<div class="maincontainer">
		Mandatory <br> 
		<strong><%=currentqs%>/<%=totalqs%> Answered</strong> <br>
		<div class="bar1">
			<div style="width: <%=setbarwidth%>vw;height: 20px;border-radius: 10px;background-color: green;"></div>
		</div>
		<br> <b><%=question.getId()%>.<%=question.getQuestion()%></b> <br>
		<%
		//Retrieving and setting options
			
			
			//String[] opt = (String[]) request.getAttribute("options");
			String option=question.getOptions();
			String[] opt=option.split(",");
			int i = 0, ln = opt.length;
			for (i = 0; i < ln; i++) {
				
		%>
		<br> <input type="radio" name="vehicle1" value="Bike" class="onlyone"><%=opt[i]%><br>
		<%
			}
		%>


	</div>

	<br>
	<div class="btcontainerprev">
		<button class="buttonprev">Previous</button>
	</div>
	<div class="btcontainernext">
		<button class="buttonnext">Next</button>
	</div>
	<br>
	<br>
	
</body>
</html>
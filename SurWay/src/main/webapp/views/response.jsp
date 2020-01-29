<%@page import="com.bedrock2.surway.models.Survey"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.bedrock2.surway.models.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap" rel="stylesheet">
<title>SurWay Response Page</title>
<link rel="stylesheet" href="/css/response.css">
</head>
<body bgcolor="#428ABF" style="font-family: Open Sans">
<script type="text/javascript" src="js/response.js"></script>
<%
//-----Recieving objects of Survey class and Question class--------------------
//-----Setting suvey title and description-------------------------------------
Survey survey=(Survey)request.getAttribute("surveyInfo");
Question question=(Question)request.getAttribute("question");
System.out.println(survey.getTitle()+question.getQuestionString());
int sid=survey.getId();
int qnum=question.getQuestionNumber();
%>
<form action="/regResponse" method="post">

	<div class="headcontainer">
		<div id="hd">
			<h1>
				<%=survey.getTitle() %>
				<h1>
		</div>
		<div id="hds"><%=survey.getDescription()%></div>
	</div>

	<div class="questionstatcontainer">
	<%
//-----Question number and progress bar setting--------------------------------

	 float totalqs=survey.getQuestionCount();
	 float currentqs=question.getQuestionNumber();
	 float barwidth=70;
	 float oneqsln=barwidth/totalqs;
	 float setbarwidth=currentqs*oneqsln;
	 
	 for(int i=1;i<=totalqs;i++)	
	{
	%>
		<div class="questionstat">
			<div class="qsstat" style="color: white"><a href="/question?survey=<%=survey.getId()%>&q=<%=i%>"><%=i %></a></div>
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
		<br> <b><%=question.getQuestionNumber()%> .<%=question.getQuestionString()%></b> <br>
		<%
//-----Question type classification--------------------------------------------

		 int type=question.getType();
		 if(type==1)	 
		 {
//-----Option string is splitting---------------------------------------------
			String[] opt=question.getOptions();
			int i = 0, ln = opt.length;
			for (i = 0; i < ln; i++) 
			{
				
	%>
		<br> <input type="radio" name="optionNo" class="onlyone" value="<%=i%>"><%=opt[i]%><br>
	<%
			}
		 }
		 if(type==2)
		 {	
			 String[] opt=question.getOptions();
				int i = 0, ln = opt.length;
				for (i = 0; i < ln; i++) 
				{
			%>
				<br> <input type="checkbox" name="optionId" class="onlyone" value="<%=i%>"><%=opt[i]%><br>
			<%	
				}
		 }
		 if(type==3)
		 {
			 %>
				<br> <textarea rows="7" cols="132" name="optionNo" placeholder="Remarks cannot be more than 250 characters...!"></textarea><br>
			<%
		 }
		 if(type==4)
		 {
			 String[] opt=question.getOptions();
				int i = 0, ln = opt.length;
				%>
				<select name="optionNo" style="max-width:150px;">
				<% 
				for (i = 0; i < ln; i++) 
				{
			 	%>
 					 <option value="<%=opt[i]%>"><%=opt[i]%></option>
				<%
				}
				%>
				</select>
				<%
		 }
	%>
	</div>
	<br>
	<%
	if(question.getQuestionNumber()>1)
	{
	%>
	<div class="btcontainerprev">
		<button class="buttonprev"><a href="/question?survey=<%=survey.getId()%>&q=<%=question.getQuestionNumber()-1%>">Previous</a></button>
	</div>
	<%
	}
	if(question.getQuestionNumber()<totalqs)
	{
	%>
	<div class="btcontainernext">
		<button class="buttonnext" type="submit">Next</button>
	</div>
	<%
	}
	if(question.getQuestionNumber()==totalqs)
	{
	%>
	<div class="btcontainernext">
		<button class="buttonnext"><a href="/survey_completed">Submit</a></button>
	</div>
	<% 
	}
	%>
	<input type="hidden" name="surveyId" value="<%=sid%>">
	<input type="hidden" name="questionNo" value="<%=qnum%>">
	
	
	<!-- 
	-----------------User id is temporary given----------------	
	 -->
	<input type="hidden" name="userId" value="20">
	</form>
	<br>
	<br>
</body>
</html>
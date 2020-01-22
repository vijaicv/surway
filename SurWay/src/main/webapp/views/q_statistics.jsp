<%@page import="java.util.Map"%>
<%@page import="com.bedrock2.surway.models.Survey"%>
<%@page import="com.bedrock2.surway.models.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/statistics.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">
<title>Advanced Report</title>
</head>
<body>
	<h1>${survey.getTitle()}</h1>
	<% 
        Question[] questions = (Question[])request.getAttribute("questions"); 
		
    %>


	<%
    	
    	for(int j=0;j<questions.length;j++){
    		Question question = questions[j];
            String[] options = question.getOptions();
            int totalresponses=0;
            System.out.println(question.getQuestionString());
            %>

	<p><b><%=j%></b>. <%=question.getQuestionString()%></p>

	<ul>
		<% for(int i=0;i<options.length;i++){ %>
		<div style="width:<%=question.getIntOptionCount(i)%>%; background-color:#000000">
			<li><%=options[i]%>-<%=question.getIntOptionCount(i)%></li>
		</div>
		<%}%>
	</ul>
	<%}%>

</body>
</html>
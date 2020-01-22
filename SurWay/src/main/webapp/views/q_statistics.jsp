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
	<div id="maincard">
		<h1>${survey.getTitle()}</h1>
		<p>${survey.getDescription()}</p>
		<br /> <br />
		<%
			Question[] questions = (Question[]) request.getAttribute("questions");
		%>


		<%
			double totalresponses = 0;
			for (int j = 0; j < questions.length; j++) {
				Question question = questions[j];
				String[] options = question.getOptions();
				System.out.println(question.getQuestionString());
				totalresponses = question.getTotalResponses();
		%>

		<p>
			<b><%=j + 1%></b>.
			<%=question.getQuestionString()%></p>
		<div style="color: blue;">
			<b>(<%=totalresponses%>) Responses
			</b>
		</div>
		<ul>
			<%
				for (int i = 0; i < options.length; i++) {
			%>
			<%
				double percentage = 0;
						if (totalresponses != 0){
							percentage = (question.getIntOptionCount(i)/totalresponses)*100;
						}
			%>
			<div
				style="margin:10px;width:<%=percentage%>%; background-color:#69c8ff;border-radius:10px;padding:5px;">
				<li><%=options[i]%>-<%=percentage%>%</li>
			</div>
			<%
				}
			%>
		</ul>

		<br /> <br />
		<%
			}
		%>

	</div>
</body>
</html>
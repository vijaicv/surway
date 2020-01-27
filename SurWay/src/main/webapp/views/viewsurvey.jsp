<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.bedrock2.surway.models.Survey"%>
<%@page import="com.bedrock2.surway.models.Question"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/statistics.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">
<title>${surveyInfo.getTitle()}</title>
</head>
<body>
<div id="maincard">
		<h1>${surveyInfo.getTitle()}</h1>
		<p>${surveyInfo.getDescription()}</p>
		<br /> <br />
		<%
			Question[] questions = (Question[]) request.getAttribute("questions");
		%>


		<%
			double totalresponses = 0;
			for (int j = 0; j < questions.length; j++) {
				Question question = questions[j];
				String[] options = question.getOptions();
		%>

		<p>
			<b><%=j + 1%></b>.
			<b><%=question.getQuestionString()%></b></p>
		<ul>
			<%
				for (int i = 0; i < options.length; i++) {
			%>
			<div
				style="margin:10px;border-radius:10px;padding:5px;font-weight:bold;color:#6b6a6a">
				<li><%=options[i]%></li>
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
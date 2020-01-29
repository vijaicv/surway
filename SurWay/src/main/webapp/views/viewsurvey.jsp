<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bedrock2.surway.models.Survey"%>
<%@page import="com.bedrock2.surway.models.Question"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/viewsurvey.css">
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
			Survey survey = (Survey) request.getAttribute("surveyInfo");
			Boolean published = survey.isPublished();
		%>


		<%
			double totalresponses = 0;
			for (int j = 0; j < questions.length; j++) {
				Question question = questions[j];
				String[] options = question.getOptions();
				int type = question.getType();
		%>


		<p>
		<form action="/survey/edit" method="post" >
			<b><%=j + 1%></b>. <b><%=question.getQuestionString()%></b>
			<input type="hidden" value=<%=question.getId() %> name="questionId"/>
			<input type="hidden" value="${surveyInfo.getId()}" name="surveyId"/>
			<button class="editButton" type="submit" style=<%=published?"display:none":"" %>>edit</button>
		</form>
		</p>
		<ul>


			<%if(type==1||type==2){%>
			<%for (int i = 0; i < options.length; i++) {%>
			<div
				style="margin: 10px; border-radius: 10px; padding: 5px; font-weight: bold; color: #6b6a6a">
				<li><%=options[i]%></li>
			</div>
			<%}%>
			<%}%>


			<%if(type==4){%>
			<select>
				<%for (int i = 0; i < options.length; i++) {%>
					<option><%=options[i]%></option>
				<%}%>
			</select>
			<%}%>
			
			<%if(type==3){%>
			<div>Descriptive answer..........</div>
			<%}%>

		</ul>

		<br />
		<%
			}
		%>
		<form action="/survey/publish" method="post">
			<input type="hidden" value="${surveyInfo.getId()}" name="surveyId">
			<button class="publishButton" type="submit" style=<%=published?"display:none":"" %>>publish</button>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bedrock2.surway.models.Survey"%>

<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Page</title>

<link rel="stylesheet" type="text/css" href="/css/dashboard.css">

 <script type="text/javascript" src="/js/delete.js"></script>
</head>
<body>
	<div class="div1">
		<img src="/images/dashboardicon.png" height="6%" width="6%">
		<h1>Dashboard</h1>
		<hr>
	</div>
	<div class="draft">
		<div class="drafth3">
			<h3>Drafts</h3>
		</div>
		<hr>
	</div>
	<%
                  List<Survey> drafts = (List<Survey>)request.getAttribute("drafts");
				  List<Survey> published = (List<Survey>)request.getAttribute("published");
	%>
	<div class="outerbox">
		<%for (int k = 0; k < drafts.size(); k++) {%>
		<%  Survey survey = drafts.get(k);
          System.out.println(survey.getTitle()); %>

		<div class="box">
			<div class="title"><%= survey.getTitle() %></div>
			<br> <br>
			<div class="description"><%= survey.getDescription() %></div>

			<div class="ul">
				<hr>
				<div class="innericons" id="hover1">
					<ul>
						<li><img src="/images/Edit-icon.png" style="width: 30px;">
						</li>
						<li style="font-size: 18px;"><a href="/survey/view?id=<%= survey.getId() %>">Edit</a></li>

					</ul>

					<div class="innericons2" id="hover1">
						<ul>
							<li><img src="/images/delete-icon.png" style="width: 30px;">
							</li>
							
    <form action="/survey/delete" onclick="return myfunc()" method= "post">
    <input type ="hidden" value ="<%= survey.getId()%>" name ="surveyId">
							<li style="font-size: 18px;"><button type="submit" >Delete</button></li>
</form>
						</ul>
					</div>

				<!--  	<div class="innericons3" id="hover1">
						<ul>
							<li><img src="/images/eye-icon.png" style="width: 30px;">
							</li>
							<li style="font-size: 18px;"><a href="/survey/view?id=<%= survey.getId() %>">View</a></li>

						</ul>
					</div>-->

				</div>

			</div>
		</div>
		<%
			}
		%>
	</div>

	<div class="publish">

		<div class="publishh3">
			<h3>Published</h3>
		</div>
		<hr></div>
		<div class = "secondouterbox">
		<%for (int k = 0; k < published.size(); k++) {%>
		<%  Survey survey = published.get(k);
          System.out.println(survey.getTitle()); %>
	
	<div class="publishbox">
		<div class="title"><%= survey.getTitle() %></div>
		<br>
		<br>
		<div class="description"><%= survey.getDescription() %></div>

		<div class="publishicon">
			<hr>
			<ul class="publishul">
				<li><img src="/images/eye-icon.png" style="width: 30px;">
				</li>
				<li style="font-size: 18px;"><a href="/statistics?survey=<%= survey.getId() %>">View</a></li>

			</ul>
		</div>
	
	</div>
	<%
			}
		%>
		</div>

	<div class="button" id="buttonid">
		<a href="/survey/createnew"><span>Create New</span> </a>
	</div>


</body>
</html>
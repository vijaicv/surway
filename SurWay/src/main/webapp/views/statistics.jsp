<%@page import="java.util.Map"%>
<%@page import="com.bedrock2.surway.models.Survey"%>
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
<link rel="stylesheet" href="/css/statistics.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">
<title>Survey Report</title>
</head>

<body>
	<% 
        		Survey stats =(Survey) request.getAttribute("surveyInfo");
        		double totalCount = stats.getMaleCount()+stats.getFemaleCount()+stats.getOtherCount();
            %>

	<div id="maincard">
		<h1 id="title"><%=stats.getTitle() %></h1>
		<p id="description">${surveyInfo.getDescription()}</p>
		<a href="/survey/view?id=<%=stats.getId() %>">View Survey</a>
		<p class="label">
			1. Total no of responses : <b id="total">${surveyInfo.getMaleCount()+surveyInfo.getFemaleCount()+surveyInfo.getOtherCount()}</b>
		</p>
		<div class="divider"></div>
		<p class="label">2. Gender :</p>
		<div id="pichart">
			<canvas id="piChart" width="400" height="400"
				style="border: 1px solid #d3d3d3;"></canvas>
			<div id="legend" width="400px"></div>
		</div>

		<div class="divider"></div>
		<p class="label">3. Advanced :</p>
		<p>View statistics for individual questions</p>
		<a href="/QStatistics?s=<%=stats.getId()%>">View Statistics</a>

		<script type="text/javascript" src="/js/statistics.js"></script>
		<script type="text/javascript">
            
        	let data = new Map([
        		["Male",<% out.print(stats.getMaleCount()/totalCount); %>],
        		["Female",<% out.print(stats.getFemaleCount()/totalCount); %>],
        		["Other",<% out.print(stats.getOtherCount()/totalCount); %>]
            ])
            
        	drawPiChart("piChart","legend",data)
        	
        </script>
	</div>
</body>
</html>
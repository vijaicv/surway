<%@page import="java.util.Map"%>
<%@page import="com.bedrock2.surway.models.SurveyStat"%>
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
    <link rel="stylesheet" href="CSS/statistics.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap" rel="stylesheet">
    <title>Survey Report</title>
</head>

<body>
    <div id="maincard">
        <h1 id="title">${survey.getTitle()}</h1>
        <p id="description">${survey.getDescription()}</p>
        <a href="/survey">View Survey</a>
        <p class="label">1. Total no of responses : <b id="total">${stats.getTotalResponses()}</b></p>
        <div class="divider"></div>
        <p class="label">2. Gender : </p>
        <div id="pichart">
            <canvas id="piChart" width="400" height="400" style="border:1px solid #d3d3d3;"></canvas>
            <div id="legend" width="400px"></div>
        </div>

        <div class="divider"></div>
        <p class="label">2. Age : </p>
        <div id="graph">
            <canvas id="ageGraph" width="400" height="400" style="border:1px solid #d3d3d3;"></canvas>
        </div>

        <div class="divider"></div>
        <p class="label">3. Advanced : </p>
        <p>View statistics for individual questions</p>
        <a href="/q_stats">View Statistics</a>
        
        <script type="text/javascript" src="JS/statistics.js"></script>
        <script type="text/javascript">
        	<% 
        		SurveyStat stats =(SurveyStat) request.getAttribute("stats");
        		double totalCount = stats.getMaleCount()+stats.getFemaleCount()+stats.getOtherCount();
        	%>
        	let data = new Map([
        		["Male",<% out.print(stats.getMaleCount()/totalCount); %>],
        		["Female",<% out.print(stats.getFemaleCount()/totalCount); %>],
        		["Other",<% out.print(stats.getOtherCount()/totalCount); %>]
        	])
        	drawPiChart("piChart","legend",data)
        	
        	<%
        		 String ageArray = "[";
        		 for(Map.Entry<Integer,Integer> entry : stats.getAgeCount().entrySet()){
        			 ageArray=ageArray+"["+entry.getKey()+","+entry.getValue()+"],";
        		 }
        		 ageArray=ageArray+"]";
        	%>
        	let ageData = new Map(<% out.print(ageArray); %>)
        	drawGraph("ageGraph",ageData);
        </script>
    </div>
</body>
</html>
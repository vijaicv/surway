<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create SurWay</title>
<link rel="stylesheet" type="text/css" href="CSS/createsurway.css">
</head>
<body>
    <h1>Employee Feedback Survey</h1>
    <p id= "description">Survey to find out the employee Feedback on current work atmosphere</p>
    <div class="mainbox">
        <div id = "typecontainer">
            <b><label>Type :-</label></b>
            <select id="questiontype_container">
                <option value = "mcq">MCQ</option>
                <option value = "muiltipleanswers">Multiple Answer</option>
                <option value = "descriptive">Descriptive</option>
                <option value = "dropdown">Dropdown</option>
            </select><br><br>
            <input type = "radio" name="isMandatory" value="true"><b>Mandatory</b><br><br><br><br>
            <textarea rows = "7" cols = "125"></textarea>   
             
        </div>
    </div>


</body>
</html>
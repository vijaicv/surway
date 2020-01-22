<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create SurWay</title>
<link rel="stylesheet" type="text/css" href="css/createsurway.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">

<script>

	var count = 1
	function addingOption(){
		if(count == 1){
			console.log("Im in 1")
			document.getElementById("additionalOption1").style.display = "block";
			document.getElementById("additionalOption2").style.display = "none";
			document.getElementById("additionalOption3").style.display = "none";
			count++;

		}
		else if(count == 2){
			console.log("im in 2")
			document.getElementById("additionalOption1").style.display = "block";
			document.getElementById("additionalOption2").style.display = "block";
			document.getElementById("additionalOption3").style.display = "none";
			count++;

		}
		else if(count == 3){
			console.log("im in 3")
			document.getElementById("additionalOption1").style.display = "block";
			document.getElementById("additionalOption2").style.display = "block";
			document.getElementById("additionalOption3").style.display = "block";
			count++;

		}
		else if(count > 3){
			alert("Maximum option of 5 has reached..Please try Dropdown type for more options")
		}
	}
	
	function selectingOptionType(selectedValue){
		console.log("This is from script"+selectedValue)
		if(selectedValue == "multipleanswers"){
			document.getElementById('MCQSection').style.display = "none";	
			document.getElementById('multipleAnswers').style.display = "block";	
			document.getElementById('descriptive').style.display = "none";	
			document.getElementById('dropdownAnswer').style.display = "none";	


		}
		else if(selectedValue == "dropdown"){
			document.getElementById('MCQSection').style.display = "none";	
			document.getElementById('multipleAnswers').style.display = "none";	
			document.getElementById('descriptive').style.display = "none";	
			document.getElementById('dropdownAnswer').style.display = "block";
		}
		else if(selectedValue == "descriptive"){
			document.getElementById('MCQSection').style.display = "none";	
			document.getElementById('multipleAnswers').style.display = "none";	
			document.getElementById('descriptive').style.display = "block";	
			document.getElementById('dropdownAnswer').style.display = "none";		}
		else if(selectedValue == "mcq") {
			document.getElementById('MCQSection').style.display = "block";	
			document.getElementById('multipleAnswers').style.display = "none";	
			document.getElementById('descriptive').style.display = "none";	
			document.getElementById('dropdownAnswer').style.display = "none";
		}
		
		
	}
</script>


</head>
<body>
    <h1>Employee Feedback Survey</h1>
    <p id= "description">Survey to find out the employee Feedback on current work atmosphere</p>
    <form action="add_questions">
    	 <div class="mainbox">
        	<div id = "typecontainer">
           		 <b><label>Type :-</label></b>
            	<select id="questiontype_container" onchange="selectingOptionType(this.value)">
                	<option value = "mcq">MCQ</option>
                	<option value = "multipleanswers">Multiple Answer</option>
                	<option value = "descriptive">Descriptive</option>
                	<option value = "dropdown">Dropdown</option>
            	</select><br><br>
            	<input type = "radio" name="isMandatory" value="true"><b>Mandatory</b><br><br><br><br>
            	<textarea rows = "7" cols = "125" placeholder="Type your Question here."></textarea><br><br>
            	<div id= "MCQSection" style= "display: block">
           			<input type ="radio">&nbsp&nbsp<input type= "text" name="optionOne">
            		<input type ="radio">&nbsp&nbsp<input type= "text" name="optionTwo"><br><br>
            		<div id="additionalOption1" style= "display: none"><input type ="radio">&nbsp&nbsp<input type= "text" name="optionThree"></div>
            		<div id="additionalOption2" style= "display: none"><input type ="radio">&nbsp&nbsp<input type= "text" name="optionFour"><br><br></div>
            		<div id="additionalOption3" style= "display: none"><input type ="radio">&nbsp&nbsp<input type= "text" name="optionFive"><br></div>
            		<center><button type= "button" onclick= "addingOption()">Add Option</button></center>
            	</div>
				<div id="multipleAnswers" style = "display: none">
					<input type ="radio">&nbsp&nbsp<input type= "text" name="optionOne">
            		<input type ="radio">&nbsp&nbsp<input type= "text" name="optionTwo"><br><br>
            		<div id="additionalOption1" style= "display: none"><input type ="radio">&nbsp&nbsp<input type= "text" name="optionThree"></div>
            		<div id="additionalOption2" style= "display: none"><input type ="radio">&nbsp&nbsp<input type= "text" name="optionFour"><br><br></div>
            		<div id="additionalOption3" style= "display: none"><input type ="radio">&nbsp&nbsp<input type= "text" name="optionFive"><br></div>
            		<center><button type= "button" onclick= "addingOption()">Add Option</button></center>
				</div>
				<div id= "descriptive" style="display: none">
					<p style = "color: tomato;">Your expected responses for this question will be a normal paragraph with a maximum limit of 20000 charecters.</p>
				</div>
				<div id= "dropdownAnswer" style="display: none">
					<p style="color: red;">Dear User, Please list your options as a comma seperated list of values. for eg: you need to enter as tomato,orange,apple for the three option namely tomato, orange and apple</p>	
					<textarea rows="2" cols="125" name= "dropdownOptions"></textarea>		
				</div>
				<input id = "buttonNext" type="submit" name="next" value= "Next">    
        	</div>
      	</div>  
    </form>
   		


</body>
</html>
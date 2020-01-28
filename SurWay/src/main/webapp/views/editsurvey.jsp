<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bedrock2.surway.models.Survey" %>
<%@ page import="com.bedrock2.surway.models.Question" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Survey</title>
<link rel="stylesheet" type="text/css" href="/css/createsurway.css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans|Source+Sans+Pro&display=swap"
	rel="stylesheet">
	
	
</head>

<% 

Survey survey = (Survey) request.getAttribute("surveyInfo"); 
Question question = (Question) request.getAttribute("question"); 	

%>

<%
int type=question.getType();
String[] options = question.getOptions();
int optlen=options.length;         		
%>

<body onload="disableRadio()">
	<script>
	function checkEmpty(form) {
		var controls = form.elements;
		for (var i=0, iLen=controls.length; i<iLen; i++) {
			controls[i].disabled = controls[i].value == '';
		}
	}
	
	function selectingOptionType(selectedValue){
		console.log("This is from script"+selectedValue)
		if(selectedValue == "2"){
			console.log("This is from script"+selectedValue)

			document.getElementById('MCQSection').style.display = "none";	
			document.getElementById('multipleAnswers').style.display = "block";	
			document.getElementById('descriptive').style.display = "none";	
			document.getElementById('dropdownAnswer').style.display = "none";	


		}
		else if(selectedValue == "4"){
			console.log("This is from script"+selectedValue)

			document.getElementById('MCQSection').style.display = "none";	
			document.getElementById('multipleAnswers').style.display = "none";	
			document.getElementById('descriptive').style.display = "none";	
			document.getElementById('dropdownAnswer').style.display = "block";
		}
		else if(selectedValue == "3"){
			console.log("This is from script"+selectedValue)

			document.getElementById('MCQSection').style.display = "none";	
			document.getElementById('multipleAnswers').style.display = "none";	
			document.getElementById('descriptive').style.display = "block";	
			document.getElementById('dropdownAnswer').style.display = "none";		}
		else if(selectedValue == "1") {
			console.log("This is from script"+selectedValue)

			document.getElementById('MCQSection').style.display = "block";	
			document.getElementById('multipleAnswers').style.display = "none";	
			document.getElementById('descriptive').style.display = "none";	
			document.getElementById('dropdownAnswer').style.display = "none";
		}


	}
	</script>
    <h1><%= survey.getTitle() %></h1>
    <p id= "description"><%= survey.getDescription() %></p>
    <form action="/question/update" onsubmit= "checkEmpty(this)" method= "post">
    	 <div class="mainbox">
        	<div id = "typecontainer">
           		 <b><label>Type :-</label></b>
            	<select id="questiontype_container" onchange="selectingOptionType(this.value)" name="type">
                	<option value = "1" <%if(type==1)out.print("selected=\"selected\""); %>>MCQ</option>
                	<option value = "2" <%if(type==2)out.print("selected=\"selected\""); %>>Multiple Answer</option>
                	<option value = "3" <%if(type==3)out.print("selected=\"selected\""); %>>Descriptive</option>
                	<option value = "4" <%if(type==4)out.print("selected=\"selected\""); %>>Dropdown</option>
            	</select><br><br>
            	<input type="hidden" name="surveyId" value=<%=survey.getId() %>>
            	<input type="hidden" name="questionId" value=<%=question.getId() %>>
            	<input type = "checkbox" name="mandatory" value="true" <%if(question.getMandatory())out.print("checked"); %>><b>Mandatory</b><br><br><br><br>
            	<label>Q<%=question.getQuestionNumber() %></label>
            	
            	
            	<input type="hidden" name="questionId" value=<%=question.getId() %>>
            	<textarea rows = "7" cols = "125" placeholder="Type your Question here." name="question" required="required"><%=question.getQuestionString() %></textarea><br><br>
            	<div id= "MCQSection" style= <%if(type==1)out.print("display:block");else out.print("display:none");%>>
           			<input id="myRadio" type ="radio" >&nbsp&nbsp<input type= "text" name="optionOne" <%=type==1?"value="+options[0]:"" %> >
            		<input type ="radio" id="myRadio" >&nbsp&nbsp<input type= "text" name="optionTwo" <%=type==1?"value="+options[1]:"" %> ><br><br>
            		<div id="additionalOption1" ><input type ="radio" id="myRadio">&nbsp&nbsp<input type= "text" name="optionThree" <%=type==1&&optlen>=3?"value="+options[2]:"" %> ></div>
            		<div id="additionalOption2" ><input type ="radio" id="myRadio">&nbsp&nbsp<input type= "text" name="optionFour" <%=type==1&&optlen>=4?"value="+options[3]:"" %> ><br><br></div>
            		<div id="additionalOption3" ><input type ="radio" id="myRadio">&nbsp&nbsp<input type= "text" name="optionFive" <%=type==1&&optlen==5?"value="+options[4]:null %> ><br></div>
   
            	</div>
				<div id="multipleAnswers" style = <%if(type==2)out.print("display:block");else out.print("display:none");%>>
					<input type ="radio" id="myRadio" >&nbsp&nbsp<input type= "text" name="optionOne" <%=type==2?"value="+options[0]:"" %> >
            		<input type ="radio" id="myRadio" >&nbsp&nbsp<input type= "text" name="optionTwo" <%=type==2?"value="+options[1]:"" %> ><br><br>
            		<div id="additionalOption1" ><input type ="radio" id="myRadio" >&nbsp&nbsp<input type= "text" name="optionThree" <%=type==2&&optlen>=3?"value="+options[2]:"" %>  ></div>
            		<div id="additionalOption2" ><input type ="radio" id="myRadio">&nbsp&nbsp<input type= "text" name="optionFour" <%=type==2&&optlen>=4?"value="+options[3]:"" %>  ><br><br></div>
            		<div id="additionalOption3" ><input type ="radio" id="myRadio">&nbsp&nbsp<input type= "text" name="optionFive" <%=type==2&&optlen>=5?"value="+options[4]:"" %>  ><br></div>
				</div>
				<div id= "descriptive" style= <%if(type==3)out.print("display:block");else out.print("display:none");	%>>
					<p style = "color: tomato;">Your expected responses for this question will be a normal paragraph with a maximum limit of 20000 charecters.</p>
				</div>
				<div id= "dropdownAnswer" style= <%if(type==4)out.print("display:block");else out.print("display:none");%>>
					<p style="color: tomato;">Dear User, Please list your options as a comma seperated list of values. for eg: you need to enter as tomato,orange,apple for the three option namely tomato, orange and apple</p>	
					<textarea rows="2" cols="125" name= "dropdownOptions"><%=question.getOptionsString() %></textarea>		
				</div>
				<input id = "buttonNext" type="submit" name="next" value= "Update">    
        	</div>
      	</div>  
    </form>
   		


</body>
</html>
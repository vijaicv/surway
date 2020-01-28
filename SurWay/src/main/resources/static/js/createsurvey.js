
function disableRadio(){
	document.getElementsByClassName("myRadio").disabled = true;
}
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

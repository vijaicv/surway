/**
 *Java script for user response page validation
 */

function ResponseValidation()
 {
	var formValid = false;
    var radios = document.getElementsByName("radio");
    
    var i = 0;
    while (!formValid && i < radios.length) {
        if (radios[i].checked) formValid = true;
        i++;        
    }

    if (!formValid)
    	{
    	alert("Must check some option!");
    	//window.location.reload();
    	//window.location='/question?survey='+surveyid+'&q='+qnum+';
    	}
  	
    return formValid;
}

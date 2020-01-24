function loginVerification() {
	var email=document.forms["loginform"]["email"];
	var password=document.forms["loginform"]["pwd"];
	if(email.value==""){
		alert("Please enter a valid e-mail address.");
		return false;
	}
	var emailSize=email.value.length;
	emailSize=emailSize-9;
	if(emailSize>20){
		alert("mail id should be less than 20 characters");
		return false;
	}
	var mailformat = /^([a-zA-Z0-9_\-\.]+)@g10x.com$/;
	if(!(email.value.match(mailformat)))
	{
	alert("Please enter a valid e-mail address.");
	return false;
	}
	else if(password.value.length<6 || password.value.length>=30){  
		alert("Password must be between 6 to 30 characters long.");  
		return false;  
	}  
	return true;
}
function signupVerification(){
	var userName=document.forms["signupform"]["uname"];
	var email=document.forms["signupform"]["email"];
	var password=document.forms["signupform"]["pwd"];
	var confirmPassword=document.forms["signupform"]["confirmpwd"];
	var department=document.forms["signupform"]["department"];
	if(userName.value==null || userName.value==""){
		alert("Enter the user name");
		return false;
	}
	if(userName.value.length>20){
		alert("Name should be less than 20 characters");
	}
	var letters = /^[A-Za-z]+$/;
    if((!userName.value.match(letters)))
    {
    alert('Enter only characters');
    return false;
    }
    if(email.value==""){
		alert("Please enter a valid e-mail address.");
		return false;
	}
    var emailSize=email.value.length;
	emailSize=emailSize-9;
	if(emailSize>20){
		alert("mail id should be less than 20 characters");
		return false;
	}
    var mailformat = /^([a-zA-Z0-9_\-\.]+)@g10x.com$/;
	if(!(email.value.match(mailformat)))
	{
	alert("Please enter a valid e-mail address.");
	return false;
	}
	else if(password.value.length<6 || password.value.length>=30){  
		alert("Password must be between 6 to 30 characters long.");  
		return false;  
	}
	else if(confirmPassword.value.length<6 || password.value.length>=30){  
		alert("Password must be between 6 to 30 characters long.");  
		return false;  
	}
	else if(password.value!=confirmPassword.value){
		alert("password mismstch");
		return false;
	}
    if (department.selectedIndex<2)                  
    { 
        alert("Select a your course."); 
        department.focus(); 
        return false; 
    } 
	return true;
}
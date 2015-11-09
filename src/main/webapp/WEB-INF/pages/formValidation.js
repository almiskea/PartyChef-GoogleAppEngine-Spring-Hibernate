function formValidation()  
{  
	var uid = document.registration.username;  
	var passid = document.registration.password;  
	var uname = document.registration.name;  
	var uadd = document.registration.address;  
	var ucountry = document.registration.country;  
	var uzip = document.registration.zip;  
	var uemail = document.registration.email;  
	var umsex = document.registration.msex;  
	var ufsex = document.registration.fsex; 
	if(userid_validation(uid,5,12))  
	{  
		if(passid_validation(passid,7,12))  
		{  
			if(allLetter(uname))  
			{  
				   
					  
						if(allnumeric(uzip))   
						{  
							if(ValidateEmail(uemail))  
							{  
								if(validsex(umsex,ufsex))  
								{
									
								}  
							}   
						}  
					   
				  
			}  
		}	  
	}  
	return false;  
} 

function userid_validation(uid,mx,my)  
{  
	var uid_len = uid.value.length;  
	var message = document.getElementById("muserid");
		
	if (uid_len == 0 || uid_len >= my || uid_len < mx)  
	{  
		
		//alert("User Id should not be empty / length be between "+mx+" to "+my);
		message.innerHTML = "User Id should not be empty / length be between "+mx+" to "+my;		
		uid.focus();  
		return false;  
	}else{
		message.innerHTML ="";
	}  
	return true;  
}  
function passid_validation(passid,mx,my)  
{  
	var passid_len = passid.value.length;
	var message = document.getElementById("mpassid");	
	if (passid_len == 0 ||passid_len >= my || passid_len < mx)  
	{  
		message.innerHTML = "Password should not be empty / length be between "+mx+" to "+my;  
		passid.focus();  
		return false;  
	}else{
		message.innerHTML = "";
	}  
	return true;  
}  
function allLetter(uname)  
{   
	var message = document.getElementById("musername");
	var letters = /^[A-Za-z]+$/;  
	if(uname.value.match(letters))  
	{  
		message.innerHTML = "";
		return true;  
	}  
	else  
	{  
		message.innerHTML = 'Username must have alphabet characters only';  
		uname.focus();  
		return false;  
	}  
}  
 
function allnumeric(uzip)  
{   
	var numbers = /^[0-9]+$/; 
	var message = document.getElementById("mzip");
	
	if(uzip.value.match(numbers))  
	{  
		message.innerHTML = "";
		return true;  
	}  
	else  
	{  
		message.innerHTML ='ZIP code must have numeric characters only';  
		uzip.focus();  
		return false;  
	}  
}  
function ValidateEmail(uemail)  
{  
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var message = document.getElementById("memail");
	
	if(uemail.value.match(mailformat))  
	{  
		message.innerHTML = "";
		return true;  
	}  
	else  
	{  
		message.innerHTML = "You have entered an invalid email address!";  
		uemail.focus();  
		return false;  
	}  
} 
function validsex(umsex,ufsex)  
{  
	x=0;  
	var message = document.getElementById("mgender");
	if(umsex.checked)   
	{  
		message.innerHTML = "";
		x++;  
	} if(ufsex.checked)  
	{  
		message.innerHTML = "";
		x++;   
	}  
	if(x==0)  
	{  
		message.innerHTML = 'Select Male/Female';  
		umsex.focus();  
		return false;  
	}  
	  
	  
	return true;  
	 
}  
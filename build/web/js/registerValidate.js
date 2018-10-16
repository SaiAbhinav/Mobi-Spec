/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validate() {
    var email = document.forms["registrationForm"]["email"].value;
    var username = document.forms["registrationForm"]["uname"].value;
    var password = document.forms["registrationForm"]["psw"].value;
    var confirmpassword = document.forms["registrationForm"]["confpsw"].value;
    var gender = document.forms["registrationForm"]["gender"].value;    
    var address = document.forms["registrationForm"]["address"].value;
    var nation = document.forms["registrationForm"]["nation"].value;

    var prefs = document.getElementsByName('pref');                
    var sel = "";
    for(var i=0; i<prefs.length; i++) {
        if(prefs[i].type=='checkbox' && prefs[i].checked == true) {
            sel = sel + prefs[i].value + ", ";
        }
    }       

    if(email != "") {
        if(username != "") {
            if(password != "") {
                if(confirmpassword == password) {
                    if(gender != "") {                        
                        if(address != "") {
                            if(sel != "") {
                                if(nation != "") {
                                    alert(email + "\n" + username + "\n" + password + "\n" + confirmpassword + "\n"+ gender + "\n" + age + "\n" + address + "\n" + sel + "\n" + nation);
                                    return true;
                                }else {
                                    alert("select a nation");                                                    
                                    return false;
                                }
                            }else {
                                alert("Please choose some preferences");
                                return false;
                            }                                            
                        }else {
                            alert("address cannot be empty");
                            return false;
                        }                        
                    }else {
                        alert("please choose a gender");
                        return false;
                    }
                }else {
                    alert("passwords did not match");
                    return false;
                }
            }else {
                alert("password cannot be empty");
                return false;
            }
        }else {
            alert("username cannot be empty");
            return false;
        }
    }else {
        alert("email cannot be empty");                    
        return false;
    }
}
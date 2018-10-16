/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validate() {
    var username = document.forms["loginForm"]["uname"].value;
    var password = document.forms["loginForm"]["psw"].value;

    if(username == "anil" && password == "anil") {
        alert("success");
        return true;
    }else {
        alert("error");
        return false;
    }
}
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function playAudio(x) {
	var aud_div = document.getElementById("myAudio");
	var vid_div = document.getElementById("myVideo");
	aud_div.src = "../assests/audio/" + x;
	vid_div.style.display = "none";
	aud_div.style.display = "";
	vid_div.pause();
	aud_div.play();
}
function playVideo(x) {			
	var aud_div = document.getElementById("myAudio");
	var vid_div = document.getElementById("myVideo");
	vid_div.src = "../assests/video/" + x;
	aud_div.style.display = "none";			
	vid_div.style.display = "";
	aud_div.pause();
	vid_div.play();
}
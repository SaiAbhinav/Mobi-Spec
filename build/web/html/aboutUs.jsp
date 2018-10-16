<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <title>About Us</title>
  <meta name="author" content="sanjay">		
  <link rel="stylesheet" type="text/css" href="../css/aboutUs.css">
  <script src="../js/aboutUs.js"></script>	
 </head>	
 <body>
 <center>
  <table cellspacing="60" style="text-align:center;">
   <tr>
    <td>
     <img src="../assests/images/developers/abhinav.jpg" alt="Abhinav" width="200" height="200" usemap="#abhinav-map" />
     <h3>SAI ABHINAV</h3>				
     <map name="abhinav-map">				
      <area shape="rect" coords="0,0,200,100" alt="abhinav-audio" nohref="nohref" title="Abhinav Audio" onclick="playAudio('lol.mp3')">
      <area shape="rect" coords="0,100,200,200" alt="abhinav-video" nohref="nohref" title="Abhinav Video" onclick="playVideo('lol.MP4')">
     </map>
    </td>			
    <td>
     <img src="../assests/images/developers/anil.jpg" alt="Anil" width="200" height="200" usemap="#anil-map" />
     <h3>ANIL KUMAR</h3>	
     <map name="anil-map">				
      <area shape="rect" coords="0,0,200,100" alt="anil-audio" nohref="nohref" title="Anil Audio" onclick="playAudio('lol.mp3')">
      <area shape="rect" coords="0,100,200,200" alt="anil-video" nohref="nohref" title="Anil Video" onclick="playVideo('lol1.mp4')">
     </map>						
    </td>			
    <td>
     <img src="../assests/images/developers/sanjay.JPG" alt="Sanjay" width="200" height="200" usemap="#sanjay-map" />
     <h3>SANJAY</h3>	
     <map name="sanjay-map">				
      <area shape="rect" coords="0,0,200,100" alt="sanjay-audio" nohref="nohref" title="Sanjay Audio" onclick="playAudio('lol.mp3')">
      <area shape="rect" coords="0,100,200,200" alt="sanjay-video" nohref="nohref" title="Sanjay Video" onclick="playVideo('lol1.mp4')">
     </map>
    </td>			
   </tr>
   <tr>
    <td colspan="3">
     <audio controls id="myAudio" style="display:none;">														
      Your browser does not support the audio element.
     </audio>
     <video controls id="myVideo" width="600" style="display:none;">											
      Your browser does not support HTML5 video.
     </video>
    </td>
   </tr>
  </table>	        
 </center>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <meta http-equiv="Expires" content="0"/>
  <meta http-equiv="Cache-Control" content ="no-cache"/>
  <meta http-equiv="Cache-Control" content ="no-store, must-revalidate, max-age=0"/>
  <meta http-equiv="Cache-Control" content ="post-check=0, pre-check=0"/>
  <meta http-equiv="Pragma" content="no-cache"/>
  <style >
  @font-face {
	font-family: 'FontAwesome';
	src: url('../../assets/fonts/fontawesome-webfont.eot?v=4.7.0');
	src: url('../../assets/fonts/fontawesome-webfont.eot?#iefix&v=4.7.0')
		format('embedded-opentype'),
		url('../../assets/fonts/fontawesome-webfont.woff2?v=4.7.0') format('woff2'),
		url('../../assets/fonts/fontawesome-webfont.woff?v=4.7.0') format('woff'),
		url('../../assets/fonts/fontawesome-webfont.ttf?v=4.7.0') format('truetype'),
		url('../../assets/fonts/fontawesome-webfont.svg?v=4.7.0#fontawesomeregular')
		format('svg');
	font-weight: normal;
	font-style: normal;
}
  
  .button-rdp-play {
    height: 50px;
    width: 50px;
    background-color:none;
	}
	.fa{
		display: inline-block;
		font: normal normal normal 14px/1 FontAwesome;
	  	font-size: 3em;
	  	text-rendering: auto;
	  	-webkit-font-smoothing: antialiased;
	  	-moz-osx-font-smoothing: grayscale;
	}
	.fa-play:before{
		content:"\f01d";
	}
	</style>
  <title>Flash RDP Client</title>
  <script type="text/javascript" src="webclient.js"></script>
  <script type="text/javascript" src="swfobject.js"></script>
  <script type="text/javascript">
    var FlashId = "FlashRDP";

    function Init()
    {
      document.getElementById("Information").innerHTML = "Loading Flash...";
      
      RDPWebClient.embedSWF ("RDPClientUI.swf", FlashId);
      //RDPWebClient.embedSWF ("WebContent/includes/RDP/RDPClientUI.swf", FlashId); c'est l'un ou l'autre..
    }
    
    var fFlashLoaded = false;
    var FlashVersion = "";
    
    function getFlashProperty(id, name)
    {
      var value = "";
      var flash = RDPWebClient.getFlashById(id);
      if (flash)
      {
        value = flash.getProperty(name);
      }
      return value;
    }
    
    /*
     * RDP client event handlers.
     * They will be called when the flash movie is ready and some event occurs.
     * Note: the function name must be the "flash_id" + "event name".
     */
    function RDPWebEventLoaded(flashId)
    {
      /* The movie loading is complete, the flash client is ready. */
      fFlashLoaded = true;
      FlashVersion = getFlashProperty(flashId, "version");
      document.getElementById("Information").innerHTML = " " + FlashVersion;
    }
    function RDPWebEventConnected(flashId)
    {
      /* RDP connection has been established */
      document.getElementById("Information").innerHTML =
          " " + FlashVersion + ". Connected to " + getFlashProperty(flashId, "serverAddress");
    }
    function RDPWebEventServerRedirect(flashId)
    {
      /* RDP connection has been established */
      document.getElementById("Information").innerHTML =
          " " + FlashVersion + ". Redirection by " + getFlashProperty(flashId, "serverAddress");
    }
    function RDPWebEventDisconnected(flashId)
    {
      /* RDP connection has been lost */
      alert("Disconnect reason:\n" + getFlashProperty(flashId, "lastError"));
      document.InputForm.connectionButton.value = "Connect";
      document.InputForm.onsubmit=function() {return Connect();}
      document.getElementById("Information").innerHTML = "Version: " + FlashVersion;
    }
    
    /* 
     * Examples how to call a flash method from HTML.
     */
    function Connect()
    {
      if (fFlashLoaded != true)
      {
          return false;
      }
      
      /* Do something with the input form:
       *
       * to hide:      document.getElementById("InputForm").style.display = 'none';
       * to redisplay: document.getElementById("InputForm").style.display = 'block';
       *
       * Just rename the button and attach another submit action.
       */
      document.InputForm.connectionButton.value = "Disconnect";
      document.InputForm.onsubmit=function() {return Disconnect();}
      
      var flash = RDPWebClient.getFlashById(FlashId);
      if (flash)
      {
        /* Setup the client parameters. */
        flash.setProperty("serverPort", "3389");
        flash.setProperty("serverAddress", document.InputForm.serverAddress.value);
        flash.setProperty("logonUsername", document.InputForm.logonUsername.value);
        flash.setProperty("logonPassword", document.InputForm.logonPassword.value);
        
        if (document.InputForm.desktopSize.value == "800")
        {
            flash.setProperty("displayWidth", "800");
            flash.setProperty("displayHeight", "600");
        }
        else if (document.InputForm.desktopSize.value == "1024")
        {
            flash.setProperty("displayWidth", "1024");
            flash.setProperty("displayHeight", "768");
        }
        else if (document.InputForm.desktopSize.value == "1280")
        {
            flash.setProperty("displayWidth", "1280");
            flash.setProperty("displayHeight", "1024");
        }
      
        flash.setProperty("keyboardLayout", document.InputForm.keyboardLayout.value);

        document.getElementById("Information").innerHTML =
            "Version: " + FlashVersion +". Connecting to " + getFlashProperty(FlashId, "serverAddress") + "...";
        
        /* Establish the connection. */
        flash.connect();
      }
      
      /* If false is returned, the form will not be submitted and we stay on the same page. */
      return false;
    }
    
    function Disconnect()
    {
      var flash = RDPWebClient.getFlashById(FlashId);
      if (flash)
      {
        flash.disconnect();
      }
      
      /* Restore the "Connect" form. */
      document.InputForm.connectionButton.value = "Connect";
      document.InputForm.onsubmit=function() {return Connect();}
      
      /* If false is returned, the form will not be submitted and we stay on the same page. */
      return false;
    }
    function sendCAD()
    {
      var flash = RDPWebClient.getFlashById(FlashId);
      if (flash)
      {
        flash.keyboardSendCAD();
      }
      
      /* If false is returned, the form will not be submitted and we stay on the same page. */
      return false;
    }
    function sendScancodes()
    {
      var flash = RDPWebClient.getFlashById(FlashId);
      if (flash)
      {
        flash.keyboardSendScancodes('1f 9f 2e ae 1e 9e 31 b1');
      }
      
      /* If false is returned, the form will not be submitted and we stay on the same page. */
      return false;
    }
    function applyKeyboardLayout()
    {
      var flash = RDPWebClient.getFlashById(FlashId);
      if (flash)
      {
        flash.setProperty("keyboardLayout", document.InputForm.keyboardLayout.value);
      }
      
      /* If false is returned, the form will not be submitted and we stay on the same page. */
      return false;
    }
  </script>
</head>

<body onload="Init()">
	<button type="button" class="button-rdp-play" onclick="window.open('includes/RDP/web/Client.jsp', '_blank', 'location=yes,height=500,width=700,scrollbars=yes,status=yes');">
		<i class="fa fa-play"></i>
	</button>
<!--   <h2 text-align=center>RDP Web Client </h2> -->
  
<!--   <form name="InputForm" onsubmit="return Connect()"> -->
<!--     <p> -->
<!--     Machine: <input font-weight=bold type=text size=20 name=serverAddress value=""> <Br> <Br> -->
<!--     Nom d'utilisateur: <input font-weight=bold type=text size=20 name=logonUsername value=""> <Br> <Br> -->
<!--     Mot de passe: <input font-weight=bold type=password size=20 name=logonPassword value=""><Br> <Br> -->
<!--     </p> -->
<!--     <p> -->
<!--     Taille du bureau: <select name=desktopSize> -->
<!--       <option value="800">800x600</option> -->
<!--       <option value="1024">1024x768</option> -->
<!--       <option value="1280">1280x1024</option> -->
<!--     </select> -->
<!--     <p hidden> -->
<!--        <select name=keyboardLayout> -->
<!--       <option value="en">EN</option> -->
<!--       <option value="de">DE</option> -->
<!--     </select> -->
<!--     <input name=layoutButton type=button value="Change keyboard layout" onClick="return applyKeyboardLayout()"> -->
<!--     <input name=cadButton type=button value="Ctrl-Alt-Del" onClick="return sendCAD()"> -->
<!--     <input name=scanButton type=button value="Scancodes test" onClick="return sendScancodes()"> -->
<!--     </p> -->
<!--     <p> -->
<!--     <input name=connectionButton type=submit value="Connection"> -->
<!--     </p> -->
<!--   </form> -->
  
<!--   <div id="FlashRDPContainer"> -->
<!--     <div id="FlashRDP"> -->
<!--     </div> -->
<!--   </div> -->
  
<!--   <div id="Information"></div> -->
      
<!--   <iframe style="height:0px;width:0px;visibility:hidden" src="about:blank"> -->
<!--      this frame prevents back forward cache in Safari -->
<!--   </iframe> -->
</body>
<head><meta http-equiv="Pragma" content="no-cache"/></head>
</html>

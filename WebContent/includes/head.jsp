<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
::::::::::   :::    :::  :::     :::  ::::::::::  
:+:      :+:  :+:     :+:+:     :+:   :+:     :+: 
+:+      +:+   +:+     +:+     +:+    +:+     +:+ 
:#:     :#:     :#:   :#:#:   :#:     :#:#:#:#:   
+#++#++#+        +#+ +#+ +#+ +#+      +#+     +#+ 
#+#    #+#        #+:+#   #+:+#       #+#     #+# 
###     ###        ###     ###        #########   

© 2017
Groupe ESEO 

AMMENOUCHE Amine
COCHEREL Morgan
JIMENEZ Arthur
MEOT Louis
MEUNIER Romain
PAJOTIN Maxime
PERRIN Stephen
STEIER Pascal
 -->
 <% 
 String path= "";
 if(request.getSession().getAttribute("path") !=null){ 
	 path = (String)request.getSession().getAttribute("path");
	}
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Icons -->
<link rel="shortcut icon" href="<%=path %>assets/img/favicons/favicon-32x32.png">

<!-- Stylesheets -->
<link rel="stylesheet" href="<%=path %>assets/css/fonts_google.css">

  <!-- Page JS Plugins CSS -->
 <link rel="stylesheet" href="<%=path %>assets/js/plugins/select2/select2.min.css">
 <link rel="stylesheet" href="<%=path %>assets/js/plugins/select2/select2-bootstrap.min.css">
 <link rel="stylesheet" href="<%=path %>assets/js/plugins/ion-rangeslider/css/ion.rangeSlider.min.css">
 <link rel="stylesheet" href="<%=path %>assets/js/plugins/ion-rangeslider/css/ion.rangeSlider.skinHTML5.min.css">
 <link rel="stylesheet" href="<%=path %>assets/js/plugins/dropzonejs/dropzone.min.css">
 <link rel="stylesheet" href="<%=path %>assets/js/plugins/bootstrap-treeview/bootstrap-treeview.min.css">
 <link rel="stylesheet" href="<%=path %>assets/js/plugins/sweetalert2/sweetalert2.min.css">
   
<!-- Bootstrap  -->
<link rel="stylesheet" href="<%=path %>assets/css/bootstrap.min.css">
<link rel="stylesheet" id="css-main" href="<%=path %>assets/css/oneui.css">

<!-- Styles  -->
<link rel="stylesheet" id="css-main" href="<%=path %>assets/css/styles.css">

<!-- Responsive  -->
<link rel="stylesheet" id="css-main" href="<%=path %>assets/css/responsive.css">
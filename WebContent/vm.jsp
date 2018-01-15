<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ListIterator"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%> 
<%@ page import="rwb.java.vb.bo.MachineBO"%>
<%@ page import="rwb.java.divers.HashmapBO"%>
<%@ page import="rwb.java.divers.Tools"%> 
<%@ page import="rwb.java.proxy.Proxy"%>

<%
	Proxy prox = null;
	MachineBO machine = null;
	HashMap<String, Object> mapMachine = null;
	HashMap<String, Object> mapServer = null;
	HashmapBO mapBO = new HashmapBO();
	String server = "";
	String vmName = "";
	Boolean error = false;
	String msg ="";

	
	if (request.getParameterMap().containsKey("idVm") & request.getParameterMap().containsKey("srvId")) {

		server = request.getParameter("srvId");
		vmName = request.getParameter("idVm");
		
		prox = new Proxy(request.getParameter("srvId"), request.getParameter("idVm"), (String)request.getSession().getAttribute("login-id"),(String)request.getSession().getAttribute("login-rights"));
		if(prox.checkRight()){
			prox.connectionBDD();
			prox.initAllInfos();
			request.getSession().setAttribute("proxy", prox);

			mapMachine = (HashMap<String,Object>) prox.getMapMachine();
			mapServer = (HashMap<String,Object>) prox.getMapServer();
			mapBO = prox.getMapBO();

			request.getSession().setAttribute("serverId", prox.getSrvId());
			request.getSession().setAttribute("stateMachine", prox.getMachine().getState());
			request.getSession().setAttribute("mapMachine", mapBO);
			request.getSession().setAttribute("mapServer", mapServer);
		}else{
			error=true;
			msg = "[Error] You don't have permission on this machine!";
			
		}
	

	}else{
		error=true;
		msg = "[Oops] Something wrong happen ...";
	}
%>

<%@ include file="/includes/action/checkSession.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RWB : VM [<%=mapBO.getName()%>]
</title>
<!-- MetaData and css import -->
<%@ include file="/includes/head.jsp"%>
</head>
<body onload="Init()">
	<div id="page-container"
		class="sidebar-l side-scroll header-navbar-fixed">
		<%@ include file="/includes/sideBar.jsp"%>
		<%@ include file="/includes/header.jsp"%>
		<%@ include file="/includes/menuBar/menuVM.jsp"%>
		<form class="js-value-form">
			<input type="hidden" name="vm-page-srv"
				value="<%=server%>"> <input
				type="hidden" name="vm-page-vm"
				value="<%=vmName%>">
		</form>
		<!-- Main Container -->
		<main id="main-container">
		<div class="loader"></div>
		<div class="logo-background"></div>
		<div id="details" class="content" style="padding-top: 100px;">
			<div class="row">
				<!-- Column 1/3 -->
				<div class="col-sm-3">
					<!-- General block -->
					<div class="block " id="general-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-close"></i>
									</button>
								</li>
							</ul>
							<h3 class="block-title">
								<img height="20" src="assets/img/icon-rwb/White/general.svg">&nbsp;GENERAL
							</h3>
						</div>
						<div class="block-content">
							<img
								src="assets/img/icon-os-vb/<%out.print(Tools.getOsIcon(mapBO.getOs()));%>"
								style="float: right;"
								onerror="this.src='assets/img/icon-os/unknown.svg';" />
							<p>
								Name : <b><%=mapBO.getName()%></b> <br> OS : <b><%=mapBO.getOs()%></b><br>
								State : <b id="vm-state-machine"></b>

							</p>
						</div>
					</div>

					<!-- System block -->
					<div class="block " id="system-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-close"></i>
									</button>
								</li>
							</ul>
							<h3 class="block-title">
								<img height="20" src="assets/img/icon-rwb/White/motherboard.svg">&nbsp;SYSTEM
							</h3>
						</div>
						<div class="block-content">
							<p>
								Memory: <b><%=mapBO.getRam()%></b>&nbsp;Mo<br> Processor :
								<b><%=mapBO.getNbCPU()%></b><br> Ressources : <b><%=mapBO.getAllocatedRessouces()%></b>&nbsp;%<br>
							</p>
						</div>
					</div>

					<!-- Display block -->
					<div class="block " id="display-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-close"></i>
									</button>
								</li>
							</ul>
							<h3 class="block-title">
								<img height="20" src="assets/img/icon-rwb/White/display.svg">&nbsp;Display
							</h3>
						</div>
						<div class="block-content">
							<p>
								VRAM : <b><%=mapBO.getvRAM()%></b> Mo<br> Screen count : <b>
									<%=mapBO.getMonitorCount()%></b><br> 2D acceleration : <i
									class="fa <%=mapBO.getAcceleration2dICO()%>" aria-hidden="true"></i><br>
								3D acceleration : <i
									class="fa <%=mapBO.getAcceleration3dICO()%>" aria-hidden="true"></i><br>
								Remote display : <i
									class="fa <%out.print((error ? " " : mapBO.getIsRemoteServerEnabledICO() ));%>"
									aria-hidden="true"></i><br>

							</p>
						</div>
					</div>

				</div>
				<!-- End col 1/2 -->

				<!-- Col 2/3-->
				<div class="col-sm-6">
					<%if(error) {%>
					<div class="alert alert-danger"> 
						<h3 class="font-w300 push-15">Warning</h3>
						<p><%=msg %></p>
					</div>
					<%} %>
					<!-- Storage block -->
					<div class="block " id="storage-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-close"></i>
									</button>
								</li>
							</ul>
							<h3 class="block-title">
								<img height="20" src="assets/img/icon-rwb/White/storage.svg">&nbsp;STORAGE
							</h3>
						</div>
						<div class="block-content">
							<div class="treeview">
								<ul class="list-group">
									<%
										ListIterator<String[]> it = mapBO.getStorageToString().listIterator();
										while (it.hasNext()) {
											String[] item = it.next();
									%>
									<li class="list-group-item node-" data-nodeid="1"
										style="color: undefined; background-color: undefined;"><span
										class="indent"></span> <%
 	if ((String) item[3] == "DVD") {
 %> <span
										class="icon node-icon si si-disc text-city"></span> <%
 	} else {
 %>
										<span class="icon node-icon fa fa-hdd-o text-city"></span> <%
 	}
 		out.print(item[0] + "&nbsp;" + item[1] + "&nbsp;" + item[2] + "&nbsp;" + item[3]
 				+ "&nbsp;<a href=\"#\" data-toggle=\"popover\" data-placement=\"top\" data-original-title=\"Emplacement :\" data-content=\""
 				+ item[4] + "\">" + item[5] + "</a>&nbsp;" + item[6] + "<br>");
 %>
									</li>
									<%
										}
									%>
								</ul>
							</div>
						</div>
					</div>

					<!-- Advanced setting-->
					<div class="block " id="network-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-close"></i>
									</button>
								</li>
							</ul>
							<h3 class="block-title">
								<img height="20" src="assets/img/icon-rwb/White/network.svg">&nbsp;NETWORK
							</h3>
						</div>
						<div class="block-content">
							<div class="treeview">
								<ul class="list-group">
									<%
										ListIterator<String> net = mapBO.getNetworkAdapter().listIterator();
										while (net.hasNext()) {
											String item = net.next();
									%>
									<li class="list-group-item node-" data-nodeid="1"
										style="color: undefined; background-color: undefined;"><span
										class="indent"></span> <span
										class="icon node-icon fa fa-share-alt text-city"></span> 
										<% out.print(item); %>
									</li>
									<%
										}
									%>
								</ul>
							</div>
						</div>
					</div>
					
				
				</div>
				<!-- End of col 2/2-->


				<!-- Preview block -->
				<div class="col-sm-3">
					<div class="preview-block block " id="preview-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button class="white" id="btn-preview-refresh" type="button"
										data-toggle="block-option">
										<i class="si si-refresh"></i>
									</button>
								</li>
								<li class="dropdown">
									<button class="white" type="button" data-toggle="dropdown"
										aria-expanded="false">
										<i class="si si-settings"></i>
									</button>
									<ul class="dropdown-menu dropdown-menu-right">
										<li class="dropdown-header">Refresh interval</li>
										<li id="li-change-interval-5"><a
											id="btn-change-interval-5" class="btn-change-interval">5s</a>
										</li>
										<li id="li-change-interval-10" class="active-interval"><a
											id="btn-change-interval-10" class="btn-change-interval">10s</a>
										</li>
										<li id="li-change-interval-20"><a
											id="btn-change-interval-20" class="btn-change-interval">20s</a>
										</li>
										<li class="divider"></li>
										<li id="li-change-interval-0"><a
											id="btn-change-interval-0" class="btn-change-interval">Disabled</a>
										</li>
									</ul>
								</li>
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-close"></i>
									</button>
								</li>

							</ul>
							<h3 class="block-title hidden-md">
								<img height="20" src="assets/img/icon-rwb/White/preview.svg">&nbsp;PREVIEW
							</h3>
						</div>
						<div class="block-content" style="padding-bottom: 20px;">
							<div id="js-preview" class="vm-preview">
								<img id="js-preview-img" src="assets/img/photos/nosignal.jpg"
									width="100%"
									onerror="this.src='assets/img/photos/nosignal.jpg';" />

							</div>
						</div>
					</div>



					<!-- share folder block -->
					<div class="block " id="shareFolder-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-close"></i>
									</button>
								</li>
							</ul>
							<h3 class="block-title">
								<img height="20"
									src="assets/img/icon-rwb/White/sharedFolder.svg">&nbsp;SHARE
							</h3>
						</div>
						<div class="block-content">
							<p>
								Clipboard :
								<button class="btn-clear" data-toggle="tooltip"
									data-placement="bottom" type="button"
									data-original-title="<%=mapBO.getShareClipboard()%>">
									<i class="fa fa-user" aria-hidden="true"></i> <i
										class="fa <%=mapBO.getShareClipboardArrow()%>"
										aria-hidden="true"></i> <i class="fa fa-desktop"
										aria-hidden="true"></i>
								</button>
								<br> Drag & Drop :
								<button class="btn-clear" data-toggle="tooltip"
									data-placement="bottom" type="button"
									data-original-title="<%=mapBO.getShareDragDrop()%>">
									<i class="fa fa-user" aria-hidden="true"></i> <i
										class="fa <%=mapBO.getShareDragDropArrow()%>"
										aria-hidden="true"></i> <i class="fa fa-desktop"
										aria-hidden="true"></i>
								</button>
								<br>


							</p>
						</div>
					</div>

					<!-- usb block -->
					<div class="block " id="bootOrder-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-close"></i>
									</button>
								</li>
							</ul>
							<h3 class="block-title">
								<img height="20" src="assets/img/icon-rwb/White/BootOrder.svg">&nbsp;Boot
								order
							</h3>
						</div>
						<div class="block-content">
							<div class="treeview">
								<ul class="list-group">
									<%
										ListIterator<String> it2 = mapBO.getBootOrderToString().listIterator();
										while (it2.hasNext()) {
											String item = it2.next();
									%>
									<li class="list-group-item node-" data-nodeid="1"
										style="color: undefined; background-color: undefined;"><span
										class="indent"></span> <span
										class="icon node-icon fa fa-bolt text-city"></span> <%
 	out.print(item + "<br>");
 %>
									</li>
									<%
										}
									%>
								</ul>
							</div>
						</div>


					</div>

				</div>

			</div>
		</div>
		<div id="console" class="content"
			style="display: none; padding-top: 100px;">
			<div class="row">
				<!-- RDP -->
				<div class="col-lg-10 col-lg-offset-1">
					<div class="block" id="rdp-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button type="button" data-toggle="dropdown" style="color: white;"
										aria-expanded="false" onclick="return sendCAD()">
										<i class="fa fa-bolt"></i>
									</button>
								</li>
								<li>
									<button type="button" data-toggle="dropdown" style="color: white;"
										aria-expanded="false" onclick="return Disconnect()">
										<i class="fa fa-stop-circle-o "></i>
									</button>
								</li>
								<li class="dropdown">
									<button type="button" data-toggle="dropdown" style="color: white;"
										aria-expanded="false">
										<i class="fa fa-keyboard-o"></i>
									</button>
									<ul class="dropdown-menu dropdown-menu-right">
										<li class="dropdown-header">Keyboard</li>
										<li><a tabindex="-1" id="btn-resolution-en" onClick="return applyKeyboardLayout('en')">English</a></li>
										<li><a tabindex="-1" id="btn-resolution-de" onClick="return applyKeyboardLayout('de')">Deutch</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<button type="button" data-toggle="dropdown" style="color: white;"
										aria-expanded="false">
										<i class="fa fa-desktop fa-white"></i>
									</button>
									<ul class="dropdown-menu dropdown-menu-right">
										<li class="dropdown-header">Resolution</li>
										<li><a tabindex="-1" id="btn-resolution-800" onclick="changeResolution('800')">800x600</a></li>
										<li><a tabindex="-1" id="btn-resolution-1024" onclick="changeResolution('1024')">1024x768</a></li>
										<li><a tabindex="-1" id="btn-resolution-1280" onclick="changeResolution('1280')">1280x1024</a></li>
									</ul>
								</li>
								<li>
									<button style="color: white;" type="button"
										data-toggle="block-option" data-action="fullscreen_toggle">
										<i class="si si-size-fullscreen "></i>
									</button>
								</li>
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-arrow-up"></i>
									</button>
								</li>
							</ul>

							<h3 class="block-title">RDP</h3>
						</div>
						<div class="block-content">
							<div class="iframe-rwb" >
								
								<button id="btn-connect" name=connectionButton type=button onclick="return Connect()">
									<i class="fa fa-play" style="font-size: 6em;"></i>
								</button>
								
								<div id="FlashRDPContainer" class="iframe-rdp">
									<div id="FlashRDP"></div>
								</div>


								<iframe style="height: 0px; width: 0px; visibility: hidden"
									src="about:blank"> this frame prevents back forward
									cache in Safari </iframe>
							</div>

						</div>
					</div>
				</div>
				<!-- SSH Block 
				<div class="col-lg-6">
					<div class="block" id="ssh-block">
						<div class="block-header bg-custom text-white">
							<ul class="block-options">
								<li>
									<button style="color: white;" type="button"
										data-toggle="block-option" data-action="fullscreen_toggle">
										<i class="si si-size-fullscreen "></i>
									</button>
								</li>
								<li>
									<button type="button" data-toggle="block-option"
										data-action="content_toggle">
										<i class="si si-arrow-up"></i>
									</button>
								</li>
							</ul>
							<h3 class="block-title">SSH</h3>
						</div>
						<div class="block-content">
							<p>"Incrément 3"</p>

						</div>
					</div>
				</div>-->

			</div>
		</div>
		<div id="snapshot" class="content"
			style="display: none; padding-top: 100px;">
			<div class="row">
				<div class="col-lg-12">
					<div class="col-md-10 col-md-offset-1">
						<div class="block" id="block-snapshot">
							<div class="block-header  bg-custom text-white">
								<div class="block-options-simple block-options-simple-left">
									<button class="btn btn-snapshot" type="button"
										id="btn-take-snap"
										data-toggle="tooltip" title=""
										data-original-title="Take a snapshot">
										<i class="fa fa-camera"></i>
									</button>
									<button class="btn btn-snapshot" type="button"
										id="btn-restore-snap"
										data-toggle="tooltip" title=""
										data-original-title="Restore a snapshot">
										<i class="fa fa-undo"></i>
									</button> 
									<button class="btn btn-snapshot" type="button"
										id="btn-delete-snap"
										data-toggle="tooltip" title=""
										data-original-title="Delete a  snapshot">
										<i class="fa fa-times"></i>
									</button>
								</div>
								<h3 class="block-title">Snapshots</h3>
							</div>
							<div class="block-content">
								<div class="js-tree-snapshot treeview">
									<ul class="list-group"> </ul> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
	</div>
	<%if(!error){ %>
	<%@ include file="/includes/footer.jsp"%>
	<%@ include file="includes/modals/StopMachine-modal.jsp"%>
	<%@ include file="includes/modals/DeleteMachine-modal.jsp"%>
	<%@ include file="includes/modals/Configure-modal.jsp"%>
   
	
	<script src="assets/js/js-vm.js"></script>
	
	<script src="assets/js/js-sharedFolders.js"></script>
	<script type="text/javascript" src="includes/RDP/webclient.js"></script>
	<script type="text/javascript" src="includes/RDP/swfobject.js"></script>
	<script type="text/javascript">

		function Init() {
	
			RDPWebClient.embedSWF("includes/RDP/RDPClientUI.swf", FlashId);
		}
	
		var fFlashLoaded = false;
		var FlashVersion = "";
		var FlashId = "FlashRDP";
		var resolution = "800";
		
		function displayRDP(){
			document.getElementById("FlashRDPContainer").style.display = 'block';
			document.getElementById("btn-connect").style.display = 'none';
		}
		
		function hideRDP(){
			document.getElementById("FlashRDPContainer").style.display = 'none';
			document.getElementById("btn-connect").style.display = 'block';
			document.getElementById("btn-connect").onclick = function() {
				return Connect();
			}
			Init();
		}
		
		function changeResolution(input){
			var flash = RDPWebClient.getFlashById(FlashId);
			if (input == "800") {
				flash.setProperty("displayWidth", "800");
				flash.setProperty("displayHeight", "600");
			} else if (input == "1024") {
				flash.setProperty("displayWidth", "1024");
				flash.setProperty("displayHeight", "768");
			} else if (input == "1280") {
				flash.setProperty("displayWidth", "1280");
				flash.setProperty("displayHeight", "1024");
			}
		}


		function getFlashProperty(id, name) {
			var value = "";
			var flash = RDPWebClient.getFlashById(id);
			if (flash) {
				value = flash.getProperty(name);
			}
			return value;
		}

		/*
		 * RDP client event handlers.
		 * They will be called when the flash movie is ready and some event occurs.
		 * Note: the function name must be the "flash_id" + "event name".
		 */
		function RDPWebEventLoaded(flashId) {
			/* The movie loading is complete, the flash client is ready. */
			fFlashLoaded = true;
			FlashVersion = getFlashProperty(flashId, "version");
		}
		function RDPWebEventConnected(flashId) {
			/* RDP connection has been established */
		}
		function RDPWebEventServerRedirect(flashId) {
			/* RDP connection has been established */
		}
		function RDPWebEventDisconnected(flashId) {
			/* RDP connection has been lost */
			alert("Disconnect reason:\n"
					+ getFlashProperty(flashId, "lastError"));
		}

		/* 
		 * Examples how to call a flash method from HTML.
		 */
		function Connect() {
			if (fFlashLoaded != true) {
				return false;
			}

			/* Do something with the input form:
			 *
			 * to hide:      document.getElementById("InputForm").style.display = 'none';
			 * to redisplay: document.getElementById("InputForm").style.display = 'block';
			 *
			 * Just rename the button and attach another submit action.
			 */
// 			document.InputForm.connectionButton.value = "Disconnect";
// 			document.InputForm.onsubmit = function() {
// 				return Disconnect();
// 			}

			var flash = RDPWebClient.getFlashById(FlashId);
			if (flash) {
				/* Setup the client parameters. */
			    flash.setProperty("serverPort", "2200");
				flash.setProperty("serverAddress","192.168.4.237");
				flash.setProperty("logonUsername",
						"");
				flash.setProperty("logonPassword",
						"");

				flash.setProperty("displayWidth", "800");
				flash.setProperty("displayHeight", "600");


				flash.setProperty("keyboardLayout","en");

				/* Establish the connection. */
				flash.connect();
			}
			displayRDP();

			/* If false is returned, the form will not be submitted and we stay on the same page. */
			return false;
		}

		function Disconnect() {
			var flash = RDPWebClient.getFlashById(FlashId);
			if (flash) {
				flash.disconnect();
			}
			hideRDP();
			/* If false is returned, the form will not be submitted and we stay on the same page. */
			return false;
		}
		function sendCAD() {
			var flash = RDPWebClient.getFlashById(FlashId);
			if (flash) {
				flash.keyboardSendCAD();
			}

			/* If false is returned, the form will not be submitted and we stay on the same page. */
			return false;
		}
		
		function applyKeyboardLayout(input) {
			var flash = RDPWebClient.getFlashById(FlashId);
			if (flash) {
				flash.setProperty("keyboardLayout",
						input);
			}

			return false;
		}
	</script>

<%} %>
</body>
</html>
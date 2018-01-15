<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="rwb.java.divers.Tools"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="rwb.java.proxy.Proxy"%>
<%@ page import="rwb.java.server.bo.ServeurBO"%>
<%@ page import="rwb.java.vb.bo.MachineBO"%>
<%@ include file="/includes/action/checkSession.jsp"%>

<%
	Proxy prox = null;
	HashMap<String, Object> mapServer = new HashMap<>();
	ServeurBO server = new ServeurBO();
	Boolean error = false;
	if (request.getParameterMap().containsKey("srvId")) {

		prox = new Proxy(request.getParameter("srvId"), "");
		prox.connectionBDD();
		prox.initSrvInfos();
		request.getSession().setAttribute("proxy", prox);

		mapServer = (HashMap<String,Object>) prox.getMapServer();
		server = prox.getSrv();

	}else{error=true;}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RWB : Server</title>
<!-- MetaData and css import -->
<%@ include file="/includes/head.jsp"%>
</head>
<body>
	<div id="page-container"
		class="sidebar-l  side-scroll header-navbar-fixed">

		<%@ include file="/includes/sideBar.jsp"%>
		<%@ include file="/includes/header.jsp"%>
		
		<form class="js-value-form">
			<input type="hidden" name="vm-page-srv"
				value="<%=request.getParameter("srvId")%>">
		</form>
		<!-- Main Container -->
		<main id="main-container">
		<div class="loader"></div>

			<div class="content bg-image overflow-hidden" style="padding-top:90px; background-image: url('assets/img/photos/server.jpeg');">
				<div class="push-50-t push-15">
					<h1 class="h2 text-white animated zoomIn">
						Server : <%=server.getName()%>
					</h1>
					<h2 class="h5 text-white-op animated zoomIn">Server monitoring</h2>

			</div>
		</div>

		<div class="content">

			<div class="block">
				<ul class="nav nav-tabs nav-tabs-alt nav-justified bg-grey">
					<li class="active"><a href="#srv-summary" class="custom-tab"
						data-toggle="tab" aria-expanded="false">Summary</a></li>
					<li class=""><a href="#srv-vm" class="custom-tab"
						data-toggle="tab" aria-expanded="false">Virtual machines</a></li>
					<li class=""><a href="#srv-networks" class="custom-tab"
						data-toggle="tab" aria-expanded="false">Network</a></li>
					<li class=""><a href="#srv-settings" class="custom-tab"
						data-toggle="tab" aria-expanded="false">Settings</a></li>
					<li class=""><a href="#srv-tasks" class="custom-tab"
						data-toggle="tab" aria-expanded="false">Tasks</a></li>
					<li class=""><a href="#srv-permissions" class="custom-tab"
						data-toggle="tab" aria-expanded="false">Permission</a></li>
				</ul>
				<div class="block-content tab-content bg-grey">

					<div class="tab-pane fade push-30-t push-50 active in"
						id="srv-summary">
						<div class="row">
							<div class="col-md-6">
								<!-- General block -->
								<div class="block " id="general-block-host">

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
										OS : <b><%=mapServer.get("OperatingSystem").toString()%></b> <br>
										OS Version : <b><%=mapServer.get("OSVersion").toString()%></b><br>
										VirtualBox Version : <b><%=mapServer.get("VboxVersion").toString()%></b><br>
										Base Memory: <b><%=mapServer.get("MemorySize").toString()%>
										</b>MB / Available : <b><%=mapServer.get("MemoryAvailable").toString()%>
										</b>MB <br> Disponibility : 
										<div class="progress">
                                       		 <div class="progress-bar progress-bar-success" role="progressbar"  
                                       		 	style="width:<%=(((long) mapServer.get("MemoryAvailable")) * 100 / ((long) mapServer.get("MemorySize")))%>%">
                                       		 	<%=(((long) mapServer.get("MemoryAvailable")) * 100 / ((long) mapServer.get("MemorySize")))%>%</div>
                                   		</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<!-- General block -->
								<div class="block " id="processor-block-host">
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
											<img height="20" src="assets/img/icon-rwb/White/general.svg">&nbsp;PROCESSORS
										</h3>
									</div>
									<div class="block-content">

										Processor Count : <b><%=mapServer.get("ProcessorCount").toString()%></b>
										<br> Online processor : <b><%=mapServer.get("ProcessorOnlineCount").toString()%></b>
										<br> Disponibility :
								
										<div class="progress">
                                       		 <div class="progress-bar progress-bar-success" role="progressbar"  
                                       		 	style="width:<%=(((long) mapServer.get("ProcessorOnlineCount")) * 100 / ((long) mapServer.get("ProcessorCount")))%>%">
                                       		 	<%=(((long) mapServer.get("ProcessorOnlineCount")) * 100 / ((long) mapServer.get("ProcessorCount")))%>%</div>
                                   		</div>
										<br>
										<p></p>
										Core per processor : <b><%=mapServer.get("ProcessorCoreCount").toString()%></b>
										<br> Core per processor online : <b><%=mapServer.get("ProcessorOnlineCoreCount").toString()%></b>
										<br> Disponibility : 
										<div class="progress">
                                       		 <div class="progress-bar progress-bar-success" role="progressbar"  
                                       		 	style="width:<%=(((long) mapServer.get("ProcessorOnlineCoreCount")) * 100 / ((long) mapServer.get("ProcessorCoreCount")))%>%">
                                       		 	<%=(((long) mapServer.get("ProcessorOnlineCoreCount")) * 100 / ((long) mapServer.get("ProcessorCoreCount")))%>%</div>
                                   		</div> 
										<p></p>
										<%
											if ((boolean) mapServer.get("LongMode")) {
												out.print("Long Mode : <b>64-bits</b> <br>");
											} else {
												out.print("Long Mode : <b>32-bits</b> <br>");
											}
											out.print("hardware virtualization : ");
											if ((boolean) mapServer.get("HWVirtEx")) {
												out.print("<span class=\"icon node-icon fa fa-check green\"></span><br>");
											} else {
												out.print("<span class=\"icon node-icon fa fa-times red\"></span><br>");
											}
											out.print("Nested Paging : ");
											if ((boolean) mapServer.get("NestedPaging")) {
												out.print("<span class=\"icon node-icon fa fa-check green\"></span><br>");
											} else {
												out.print("<span class=\"icon node-icon fa fa-times red\"></span><br>");
											}
											out.print("PAE : ");
											if ((boolean) mapServer.get("PAE")) {
												out.print("<span class=\"icon node-icon fa fa-check green\"></span><br>");
											} else {
												out.print("<span class=\"icon node-icon fa fa-times red\"></span><br>");
											}
										%>
										<p></p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<!-- General block -->
								<div class="block " id="network-block-host">
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
											<img height="20" src="assets/img/icon-rwb/White/general.svg">&nbsp;NETWORKS
										</h3>
									</div>
									<div class="block-content">
										<p>
											Domain Name : <b><%=mapServer.get("DomainName").toString()%></b>
											<br>
											<%
												HashMap<String, Object> mapNetwork = (HashMap<String, Object>) mapServer.get("Network");
												Iterator<Entry<String, Object>> it2 = mapNetwork.entrySet().iterator();
												int i = 0;
												while (it2.hasNext()) {
													i++;
													Entry<String, Object> pair = it2.next();
													HashMap<String, Object> network = (HashMap<String, Object>) pair.getValue();
											%>
											<span class="icon node-icon fa fa-exchange orange"></span>
											<%
												out.print("Network " + i + " (<b>" + network.get("ShortName") + "</b>)<br>");
													out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IPv4 Address:   " + network.get("IPv4Adress") + " / "
															+ network.get("NetworkMask") + "<br>");
													if (0 != (long) network.get("IPV6NetworkMaskPrefixLength")) {
														out.print("<span class=\"indent\"></span>");
														out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IPv6 Address:   " + network.get("IPv6Adress") + " / "
																+ network.get("IPV6NetworkMaskPrefixLength") + "<br>");
													}
													it2.remove();
												}
											%>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<!-- General block -->
								<div class="block " id="dvd-block-host">
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
											<img height="20" src="assets/img/icon-rwb/White/general.svg">&nbsp;DVD
										</h3>
									</div>
									<div class="block-content">
										<%
											HashMap<String, Object> mapDvds = (HashMap<String, Object>) mapServer.get("DVDDrives");
											Iterator<Entry<String, Object>> itDvds = mapDvds.entrySet().iterator();
											while (itDvds.hasNext()) {
												Entry<String, Object> pair = itDvds.next();
												HashMap<String, Object> mapDvd = (HashMap<String, Object>) pair.getValue();
										%>
										<span class="icon node-icon fa fa-connectdevelop orange"></span>
										<%
											out.print(pair.getKey() + "<br>");
												out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + mapDvd.get("Description") + " (<b>"
														+ mapDvd.get("Name") + "</b>)<br>");
												itDvds.remove();
											}
										%>
										<p></p>
									</div>
								</div>
							</div>

						</div>


					</div>
					<div class="tab-pane fade push-30-t push-50 " id="srv-networks">
						<div class="block">
							<ul class="nav nav-tabs nav-justified" data-toggle="tabs">
								<li class="active"><a href="#cfg-server-network-NAT">NAT</a>
								</li>
								<li class=""><a href="#cfg-server-network-HostOnly">Host-Only</a>
								</li>
								<li class=""><a href="#cfg-server-network-Internal">Internal</a>
								</li>
							</ul>

							<div class="block-content tab-content">
								<div class="tab-pane active" id="cfg-server-network-NAT">
									<div class="col-sm-7 col-sm-offset-2">
										<!-- Network NAT content -->
										<div class="form-group">
											<b>Select NAT network:</b> <BR> <select
												id="NATNetworkServer" class="listboxNetworkServer"
												name="internalNetworks" size="4" multiple>
												<%
													List<String> internals = (List<String>) mapServer.get("NATNetworks");
													if (internals.isEmpty()) {
												%><option>No NAT<%
													}
													for (String s : internals) {
												%>
												
												<option value="<%=s%>">
													<%=s%>
													<%
														}
													%>
												
											</select>
										</div>
									</div>
									<div class="col-sm-1">
										<p></p>
										<button id="btn-create-NATNetwork-server" type="button"
											class="btn btn-default" data-toggle="modal"
											data-target="#create-NATNetwork-server-modal">
											<i class="fa fa-plus"></i>
										</button>
										
										<button id="btn-modif-NATNetwork-server" type="button"
											data-toggle="modal"
											data-target="#modif-NATNetwork-server-modal"
											class="btn btn-default" disabled>
											<i class="fa fa-cog"></i>
										</button>
										<button id="btn-delete-NATNetwork-server" type="button"
											class="btn btn-default" disabled>
											<i class="fa fa-minus" ></i>
										</button>
									</div>
								</div>

								<!-- Network HostOnly content -->

								<div class="tab-pane " id="cfg-server-network-HostOnly">
									<div class="col-sm-7 col-sm-offset-2">
										<div class="form-group">
											<b>Select Host Only network:</b> <BR> <select
												id="HostOnlyNetworkServer" class="listboxNetworkServer"
												name="internalNetworks" size="4" multiple>

												<%
													HashMap<String, Object> host = (HashMap<String, Object>) mapServer.get("HostOnlyNetworks");
													if ((int) host.get("NbHostOnly") == 0) {
												%><option>No hostOnly
													networks<%
													} else {
														for (int f = 1; f <= (int) host.get("NbHostOnly"); f++) {
															HashMap<String, Object> network = (HashMap<String, Object>) host.get(String.valueOf(f));
												%>
												
												<option value="<%=network.get("Name")%>">
													<%=network.get("ShortName")%>
													<%
														}
														}
													%>
												
											</select>
										</div>
									</div>
									<div class="col-sm-1">
										<p></p>
										<button id="btn-create-HostOnlyNetwork-server" type="button"
											class="btn btn-default">
											<i class="fa fa-plus"></i>
										</button>
										<button id="btn-modif-HostOnlyNetwork-server" type="button"
											data-toggle="modal"
											data-target="#modif-HostOnlyNetwork-server-modal"
											class="btn btn-default" disabled>
											<i class="fa fa-cog"></i>
										</button>
										<button id="btn-delete-HostOnlyNetwork-server" type="button"
											class="btn btn-default">
											<i class="fa fa-minus" disabled></i>
										</button>
									</div>
								</div>
								<!-- Internal part -->
								<div class="tab-pane " id="cfg-server-network-Internal">
								<div class="col-sm-7 col-sm-offset-2">
									<div class="form-group">
										<b>Select internal network:</b> <BR> <select
											class="listboxNetworkServer" name="internalNetworks" size="4"
											multiple>
											<%
												List<String> internal = (List<String>) mapServer.get("InternalNetworks");
												if (internal.isEmpty()) {
											%><option>No internal
												network<%
												}
												for (String f : internal) {
											%>
											
											<option value="<%=f%>">
												<%=f%>
												<%
													}
												%>
											
										</select>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End of Network -->
					<div class="tab-pane fade push-30-t push-50 active" id="srv-vm">

						<div class="block">
							<div class="block-header">
								<h3 class="block-title">List of virtual machines</h3>
							</div>
							<div class="block-content">
							<%if(request.getSession().getAttribute("login-rights") != null){
								if("admin".equals(request.getSession().getAttribute("login-rights"))){
							%>
								<table class="table table-bordered table-striped js-dataTable-full">
									<thead>
										<tr>
											<th class="text-center"><i
												class="fa fa-sort-numeric-asc" aria-hidden="true"></i></th>
											<th class="text-center"><i class="fa fa-picture-o"
												aria-hidden="true"></i></th>
											<th>Name</th>
											<th>OS</th>
											<th class="hidden-xs" style="width: 15%;">State</th>

										</tr>
									</thead>
									<tbody>
										<%
											int idxMachine = 1;
											for (MachineBO m : prox.getListMachine()) {
										%>
										<tr>
											<td class="text-center"><%=idxMachine%></td>
											<td class="text-center"> 
													<img src="assets/img/icon-os-vb/<%out.print(Tools.getOsIcon(m.getOsType()));%>" 
														class="vm-sidebar-ico"
														onerror="this.src='assets/img/icon-os/unknown.svg';" /> 
											</td>
											<td class="font-w600">
												<a href="vm.jsp?srvId=<%=prox.getSrvId() %>&idVm=<%=m.getName()%>" >
													<%=m.getName()%>
												</a>
											</td>
											<td class="hidden-xs"><%=m.getOsType()%></td>
											<td class="hidden-xs"><%=m.getState()%></td>

										</tr>
										<%
											idxMachine++;
											}
										%>
									</tbody>
								</table>
								<%}else{out.print("you don't have permission to access this content.");}} %>
							</div>
						</div>

					</div>
					<div class="tab-pane fade push-30-t push-50 active"
						id="srv-settings">settings</div>
					<div class="tab-pane fade push-30-t push-50 active" id="srv-tasks">

						tasks</div>
					<div class="tab-pane fade push-30-t push-50 active"
						id="srv-permissions">Permissions</div>

				</div>
			</div>

		</div>
		</main>
		<div id="footer_RWB" class="footer navbar-fixed-bottom">
			<div class="pulldown push-30-t text-center animated fadeInUp">
				<small class="text-muted">&copy; Remote Web Box 0.2</small>
			</div>
		</div>
	</div>

	<!-- Modal modif HostOnlyNetwork -->
	<div class="modal modal-stack-1"
		id="modif-HostOnlyNetwork-server-modal" tabindex="-1" role="dialog"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-stack-position ">
			<div class="modal-content modal-stack-height ">
				<div class="block block-themed block-transparent remove-margin-b">
					<div class="block-header bg-custom text-white">
						<ul class="block-options">
							<li>
								<button data-dismiss="modal" type="button">
									<i class="si si-close"></i>
								</button>
							</li>
						</ul>
						<h3 class="block-title">
							<i class="fa fa-plus-square-o" aria-hidden="true"></i>&nbsp;Modif
							Host-Only Network
						</h3>
					</div>
					<div class="block-content tab-content">
						<div class="loader-block"></div>

						<div class="js-wizard-simple block">
							<ul class="nav nav-tabs nav-justified">
								<li class="active"><a href="#adapter" data-toggle="tab"
									aria-expanded="false">Adapter</a></li>
								<li><a href="#dhcp" data-toggle="tab" aria-expanded="true">DHCP
										server</a></li>
							</ul>
							<form class="js-form-modif-hostOnly">
								<div class="block-content tab-content">
									<div class="tab-pane push-30-t push-50 active" id="adapter">
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<label for="cfgsrv-hostOnly-ipv4">IPv4 address</label> <input
													class="form-control" type="text" id="cfgsrv-hostOnly-ipv4"
													name="cfgsrv-hostOnly-ipv4">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<label for="cfgsrv-hostOnly-ipv4Mask">IPv4 network
													mask</label> <input class="form-control" type="text"
													id="cfgsrv-hostOnly-ipv4Mask"
													name="cfgsrv-hostOnly-ipv4Mask">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<label for="cfgsrv-hostOnly-ipv6">IPv6 address</label> <input
													class="form-control" type="text" id="cfgsrv-hostOnly-ipv6"
													name="cfgsrv-hostOnly-ipv6">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<label for="cfgsrv-hostOnly-ipv6MaskLength">IPv6
													network mask lengths</label> <input class="form-control"
													type="text" id="cfgsrv-hostOnly-ipv6MaskLength"
													name="cfgsrv-hostOnly-ipv6MaskLength">
											</div>
										</div>

									</div>
									<div class="tab-pane push-30-t push-50" id="dhcp">
										<div class="form-group">
											<div class="col-xs-12">
												<div class="form-material form-material-primary">
													<div class="col-xs-6 col-xs-offset-3">
														<label class="css-input css-checkbox css-checkbox-primary">
															<input id="cfgsrv-hostOnly-dhcp-enable"
															name="cfgsrv-hostOnly-dhcp-enable" type="checkbox"
															value="true"><span></span> Enable server
														</label><br>
													</div>
												</div>

											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<label for="cfgsrv-hostOnly-dhcp-address">Server
													address</label> <input class="form-control" type="text"
													id="cfgsrv-hostOnly-dhcp-address"
													name="cfgsrv-hostOnly-dhcp-address">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<label for="cfgsrv-hostOnly-dhcp-mask">Server mask</label> <input
													class="form-control" type="text"
													id="cfgsrv-hostOnly-dhcp-mask"
													name="cfgsrv-hostOnly-dhcp-mask">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<label for="cfgsrv-hostOnly-dhcp-lowerAdd">Lower
													address bound</label> <input class="form-control" type="text"
													id="cfgsrv-hostOnly-dhcp-lowerAdd"
													name="cfgsrv-hostOnly-dhcp-lowerAdd">
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<label for="cfgsrv-hostOnly-dhcp-upperAdd">Upper
													address bound</label> <input class="form-control" type="text"
													id="cfgsrv-hostOnly-dhcp-upperAdd"
													name="cfgsrv-hostOnly-dhcp-upperAdd">
											</div>
										</div>

									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-sm btn-default" type="button"
							data-dismiss="modal">Cancel</button>
						<button id="btn-save-mofi-hostOnly" class="btn btn-sm btn-primary"
							type="submit">
							<i class="fa fa-check"></i> Ok
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal create NATNetwork -->
	<div class="modal modal-stack-1" id="create-NATNetwork-server-modal" tabindex="-1" role="dialog"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-stack-position ">
			<div class="modal-content modal-stack-height ">
				<div class="block block-themed block-transparent remove-margin-b">
					<div class="block-header bg-custom text-white">
						<ul class="block-options">
							<li>
								<button data-dismiss="modal" type="button"> <i class="si si-close"></i> </button>
							</li>
						</ul>
						<h3 class="block-title">
							<i class="fa fa-plus-square-o" aria-hidden="true"></i>&nbsp;Create NAT Network
						</h3>
					</div>

					<div class="js-wizard-simple block">
						<form class="js-form-create-NAT">
							<div class="block-content tab-content">
								<div class="form-group">
									<div class="col-sm-8 col-sm-offset-2">
										<label for="cfgsrv-NATNetworkcreate-name">Enter Network Name</label> 
										<input class="form-control" type="text" id="cfgsrv-NATNetworkcreate-name"
											name=cfgsrv-NATNetworkcreate-name >
									</div>
								</div>
							</div>
						</form>
					</div>
									
					<div class="modal-footer">
						<button class="btn btn-sm btn-default" type="button"
							data-dismiss="modal">Cancel</button>
						<button id="btn-create-nat" class="btn btn-sm btn-primary" type="submit">
							<i class="fa fa-check"></i> Ok
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal modif NATNetwork -->
	<div class="modal modal-stack-1"
		id="modif-NATNetwork-server-modal" tabindex="-1" role="dialog"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-stack-position ">
			<div class="modal-content modal-stack-height ">
				<div class="block block-themed block-transparent remove-margin-b">
					<div class="block-header bg-custom text-white">
						<ul class="block-options">
							<li>
								<button data-dismiss="modal" type="button">
									<i class="si si-close"></i>
								</button>
							</li>
						</ul>
						<h3 class="block-title">
							<i class="fa fa-plus-square-o" aria-hidden="true"></i>&nbsp;Modif
							NAT Network
						</h3>
					</div>
					<div class="block-content tab-content">
						

						<div class="js-wizard-simple block">
							<form class="js-form-modif-NAT">
								<div class="block-content tab-content">
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-nat-name">Network Name</label> <input
												class="form-control" type="text" id="cfgsrv-NATNetwork-name"
												name=cfgsrv-nat-name>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-NATNetwork-CIDR">Network CIDR
												</label> <input class="form-control" type="text"
												id="cfgsrv-NATNetwork-CIDR"
												name="cfgsrv-NATNetwork-CIDR">
										</div>
									</div>
									<p></p>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2" style="margin-top:10px">
											<label for="cfgsrv-NATNetwork-DHCP">Network Options:</label> 
											<input id="cfgsrv-NATNetwork-DHCP" name="cfgsrv-NATNetwork-DHCP" type="checkbox" value="true" style="margin-left: 15px;"> Supports DHCP
										</div>
										<div class="col-sm-8 col-sm-offset-5" style="margin-top:5px">
											<input id="cfgsrv-NATNetwork-supportIPv6" name="cfgsrv-NATNetwork-supportIPv6" type="checkbox" value="true"> Supports IPv6
										</div>
										<div class="col-sm-8 col-sm-offset-5" style="margin-top:10px" >
											<input id="cfgsrv-NATNetwork-IPv6Route" name="cfgsrv-NATNetwork-IPv6Route" type="checkbox" value="true"> Advertise Default IPv6 Route
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-5" style="margin-top:10px">
											<button id="btn-portForwarding-nat" class="btn btn-sm btn-primary" type="submit">
												Ports Forwarding
											</button>
										</div>
									</div>

								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-sm btn-default" type="button"
							data-dismiss="modal">Cancel</button>
						<button id="btn-save-mofi-nat" class="btn btn-sm btn-primary"
							type="submit">
							<i class="fa fa-check"></i> Ok
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/includes/footer.jsp"%>
	<script src="assets/js/js-server.js"></script>
</body>
</html>
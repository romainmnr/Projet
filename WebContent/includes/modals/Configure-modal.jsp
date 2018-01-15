<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="rwb.java.divers.HashmapBO"%>
<%@ page import="java.util.ListIterator"%>
<%@ page import="rwb.java.divers.Tools"%>
<%
	HashmapBO mapCfg = null;
	HashMap<String, Object> mapSrv = new HashMap<>();
	String stateMachine = "";
	String serverId = "";
	HashMap<String, Object> NATNetworks = new HashMap<>();
	HashMap<String, Object> HostOnlyNetworks = new HashMap<>();
	HashMap<String, Object> InternalNetworks = new HashMap<>();
	HashMap<String, Object> BridgedNetwork = new HashMap<>();
	List<String> InternalNetwork = null;
	if (request.getSession().getAttribute("mapMachine") != null) {
		mapCfg = (HashmapBO) request.getSession().getAttribute("mapMachine");
	}
	if (request.getSession().getAttribute("serverId") != null) {
		serverId = (String) request.getSession().getAttribute("serverId");
	}
	if (request.getSession().getAttribute("stateMachine") != null) {
		stateMachine = (String) request.getSession().getAttribute("stateMachine");
	}
	if (request.getSession().getAttribute("mapServer") != null) {
		mapSrv = (HashMap<String, Object>) request.getSession().getAttribute("mapServer");
		NATNetworks = (HashMap<String, Object>) mapSrv.get("NAT");
		HostOnlyNetworks = (HashMap<String, Object>) mapSrv.get("HostOnly");
		BridgedNetwork = (HashMap<String, Object>) mapSrv.get("BridgedNetwork");
		InternalNetwork = (List<String>) mapSrv.get("InternalNetworks");
	}
%>
<div class="modal" id="configureMachine-modal" tabindex="-1"
	role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="block block-themed block-transparent remove-margin-b">
				<div class="block-header bg-primary">
					<ul class="block-options">
						<li>
							<button data-dismiss="modal" type="button">
								<i class="si si-close"></i>
							</button>
						</li>
					</ul>
					<h3 class="block-title">
						<i class="fa fa-cogs" aria-hidden="true"></i>&nbsp;Settings
					</h3>
				</div>
				<div class="block-content">
					<%
						if (!stateMachine.equals("PoweredOff")) {
					%>
					<div class="alert alert-warning alert-dismissable">
						<p>This machine is running, please turn it off before changing
							settings</p>
					</div>
					<%
						}
					%>
					<div class="js-wizard-simple block border-box">

						<ul class="nav nav-tabs nav-justified">

							<!-- List of tab for configure modal -->
							<li class="active"><a href="#cfg-general" data-toggle="tab"
								aria-expanded="true"> <img height="30"
									src="assets/img/icon-rwb/general.svg"><br>General
							</a></li>
							<li><a href="#cfg-system" data-toggle="tab"
								aria-expanded="false"> <img height="30"
									src="assets/img/icon-rwb/motherboard.svg"><br>System
							</a></li>
							<li><a href="#cfg-display" data-toggle="tab"
								aria-expanded="false"> <img height="30"
									src="assets/img/icon-rwb/display.svg"><br>Display
							</a></li>
							<li><a href="#cfg-storage" data-toggle="tab"
								aria-expanded="false"> <img height="30"
									src="assets/img/icon-rwb/storage.svg"><br>Storage
							</a></li>
							<li><a href="#cfg-audio" data-toggle="tab"
								aria-expanded="false"> <img height="30"
									src="assets/img/icon-rwb/audio.svg"><br>Audio
							</a></li>
							<li><a href="#cfg-network" data-toggle="tab"
								aria-expanded="false"> <img height="30"
									src="assets/img/icon-rwb/network.svg"><br>Network
							</a></li>
							<li><a href="#cfg-ports" data-toggle="tab"
								aria-expanded="false"> <img height="30"
									src="assets/img/icon-rwb/usb.svg"><br>Ports
							</a></li>
							<li><a href="#cfg-shareFolders" data-toggle="tab"
								aria-expanded="false"> <img height="30"
									src="assets/img/icon-rwb/sharedFolder.svg"><br>Share
							</a></li>
						</ul>

						<form id="cfg-vm-form" class="form-horizontal">
							<input type="hidden" name="cfg-machine-srvid"
								id="cfg-machine-srvid" value="<%=serverId%>"> <input
								type="hidden" name="cfg-machine-vmid" id="cfg-machine-vmid"
								value="<%=mapCfg.getName()%>">
							<div class="block-content tab-content">

								<!--General Tab-->
								<div class="tab-pane push-30-t push-50 border-box active"
									id="cfg-general">

									<!-- General content -->
									<div class="block">
										<ul class="nav nav-tabs nav-justified" data-toggle="tabs">
											<li class="active"><a href="#cfg-general-basic">Basic</a>
											</li>
											<li class=""><a href="#cfg-general-advanced">
													Advanced</a></li>
										</ul>

										<div class="block-content tab-content">
											<div class="tab-pane active" id="cfg-general-basic">

												<div class="form-group">
													<div class="col-sm-8 col-sm-offset-2">
														<div class="form-material form-material-primary">
															<label for="cfg-general-basic-name">Name</label> <input
																class="form-control" type="text"
																name="cfg-general-basic-name"
																value="<%=mapCfg.getName()%>">
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-8 col-sm-offset-2">
														<div class="form-material form-material-primary">
															<label for="cfg-general-basic-type-os">Type</label> <select
																class=" form-control" id="cfg-general-basic-type-os"
																name="cfg-general-basic-type-os" size="1"
																style="width: 100%;" onChange="setListOsCfg();">
																<option value="">[<%=Tools.getOsType(mapCfg.getOs())%>]
																</option>
																<%
																	for (Map.Entry<String, HashMap<String, String>> e : Tools.getOS().entrySet()) {
																%>
																<option value="<%out.print(e.getKey());%>">
																	<%
																		out.print(e.getKey());
																	%>
																</option>
																<%
																	}
																%>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-8 col-sm-offset-2">
														<div class="form-material form-material-primary">
															<label for="cfg-general-basic-os">Version</label> <select
																class=" form-control" id="cfg-general-basic-os"
																name="cfg-general-basic-os" style="width: 100%;"
																size="1">
																<option value="<%=mapCfg.getOs()%>">[<%=mapCfg.getOs()%>]
																</option>
																<%
																	for (Map.Entry<String, HashMap<String, String>> t : Tools.getOS().entrySet()) {
																		HashMap<String, String> type = t.getValue();
																		for (Map.Entry<String, String> os : type.entrySet()) {
																%>
																<option class="cfg-<%out.print(t.getKey());%>"
																	value="<%out.print(os.getKey());%>">
																	<%
																		out.print(os.getKey());
																	%>
																</option>
																<%
																	}
																	}
																%>
															</select>
														</div>
													</div>
												</div>
											</div>
											<!-- End of basic -->

											<div class="tab-pane" id="cfg-general-advanced">

												<div class="form-group">
													<div class="col-sm-8 col-sm-offset-2">
														<div class="form-material form-material-primary">
															<label for="cfg-general-advanced-snapshotFld">Snapshot
																folder</label> <input class="form-control" type="text"
																name="cfg-general-advanced-snapshotFld"
																value="<%=mapCfg.getSnapshotFolder()%>">
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-8 col-sm-offset-2">
														<div class="form-material form-material-primary">
															<label for="cfg-general-advanced-clipboard">Clipboard</label>
															<select class="js-select2 form-control"
																id="cfg-general-advanced-clipboard"
																name="cfg-general-advanced-clipboard" size="1"
																style="width: 100%;">
																<option value="">[<%=mapCfg.getShareClipboard()%>]
																</option>
																<option value="Disabled">Disabled</option>
																<option value="GuestToHost">Guest to Host</option>
																<option value="HostToGuest">Host to Guest</option>
																<option value="Bidirectional">Bidirectional</option>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-8 col-sm-offset-2">

														<div class="form-material form-material-primary">
															<label for="cfg-general-advanced-dragndrop">Drag
																& Drop</label> <select class="js-select2 form-control"
																id="cfg-general-advanced-dragndrop"
																name="cfg-general-advanced-dragndrop" size="1"
																style="width: 100%;">
																<option value="">[<%=mapCfg.getShareDragDrop()%>]
																</option>
																<option value="Disabled">Disabled</option>
																<option value="GuestToHost">Guest to Host</option>
																<option value="HostToGuest">Host to Guest</option>
																<option value="Bidirectional">Bidirectional</option>
															</select>

														</div>
													</div>
												</div>

											</div>
										</div>

									</div>
									<!-- End block -->

								</div>
								<!-- End of General -->

								<!--System Tab-->
								<div
									class="tab-pane push-30-t push-50 border-box col-md-10 col-md-offset-1"
									id="cfg-system">

									<div class="block">
										<ul class="nav nav-tabs nav-justified" data-toggle="tabs">
											<li class="active"><a href="#cfg-system-motherboard">Motherboard</a>
											</li>
											<li class=""><a href="#cfg-system-processor">Processor</a>
											</li>
											<li class=""><a href="#cfg-system-acceleration">Acceleration</a>
											</li>
										</ul>
										<!-- System content -->
										<div class="block-content tab-content">
											<div class="tab-pane active" id="cfg-system-motherboard">

												<div class="form-group">
													<label class="col-md-1 control-label ">RAM (Mo)</label>
													<div class="col-sm-11 ">
														<input class="js-rangeslider" type="text"
															id="cfg-system-motherboard-ram"
															name="cfg-system-motherboard-ram" data-grid="true"
															data-min="128"
															data-max="<%out.print(Integer.parseInt(mapSrv.get("MemorySize").toString()));%>"
															value="<%out.print(Integer.parseInt(mapCfg.getRam()));%>"
															data-step="8">
													</div>
												</div>
												<!-- 
				                                <div class="form-group">
		                                            <div class="col-xs-12">
		                                                <div class="form-material form-material-primary">
		                                                	<label for="cfg-system-motherboard-bootorder-1">Boot order</label>
		                                                	<div class="col-xs-6 col-xs-offset-3" > 	
		                                               			 <%ListIterator<String> itBO = mapCfg.getBootOrderToString().listIterator();
			while (itBO.hasNext()) {
				String item = itBO.next();%>
																<label class="css-input css-checkbox css-checkbox-primary">
																	<input type="checkbox" <%out.print((!item.equals("Null") ? "checked" : ""));%>><span></span> <%out.print(item + "<br>");%>
																</label><br>
																
																 <%}%>
																</div> 
		                                                </div>
		                                            </div>
		                                        </div>
		                                         -->
												<div class="form-group">
													<div class="col-sm-12">
														<div class="form-material form-material-primary">
															<label for="cfg-system-motherboard-chipset">Chipset</label>
															<select class="js-select2 form-control"
																id="cfg-system-motherboard-chipset"
																name="cfg-system-motherboard-chipset" size="1"
																style="width: 100%;">
																<option value="">[<%=mapCfg.getChipsetType()%>]
																</option>
																<option value="PIIX3">PIIX3</option>
																<option value="ICH9">ICH9</option>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-12">
														<div class="form-material form-material-primary">
															<label for="cfg-system-motherboard-pointerSystem">Pointing
																device</label> <select class="js-select2 form-control"
																id="cfg-system-motherboard-pointerSystem"
																name="cfg-system-motherboard-pointerSystem" size="1"
																style="width: 100%;">
																<option value="">[<%=mapCfg.getPointerSystem()%>]
																</option>
																<option value="PS2Mouse">PS/2 mousse</option>
																<option value="USBTablet">USB Tablet</option>
																<option value="USBMultiTouch">USB multi-Touch
																	Tablet</option>
															</select>
														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-xs-12">
														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-3">
																<label
																	class="css-input css-checkbox css-checkbox-primary">
																	<input name="cfg-system-motherboard-activateioapic"
																	type="checkbox" value="true"
																	<%out.print((mapCfg.getActivateIoAPIC().equals("true") ? "checked" : ""));%>><span></span>
																	Enable I/O APIC
																</label><br>
															</div>
															<div class="col-xs-6 col-xs-offset-3">
																<label
																	class="css-input css-checkbox css-checkbox-primary">
																	<input name="cfg-system-motherboard-internalclockutc"
																	type="checkbox" value="true"
																	<%out.print((mapCfg.getInternalClockUTC().equals("true") ? "checked" : ""));%>><span></span>
																	Hardware clock in UTC time
																</label><br>
															</div>
														</div>
													</div>
												</div>

											</div>
											<!-- End of #cfg-system-motherboard -->

											<div class="tab-pane" id="cfg-system-processor">
												<div class="form-group">
													<div class="col-sm-12 ">
														<input class="js-rangeslider" type="text"
															id="cfg-system-processor-nbcpu"
															name="cfg-system-processor-nbcpu" data-grid="true"
															data-min="1"
															data-max="<%out.print(Integer.parseInt(mapSrv.get("ProcessorCount").toString()));%> "
															value="<%out.print(Integer.parseInt(mapCfg.getNbCPU()));%> "
															data-step="1">
													</div>
													<label class="col-md-7 control-label ">Processor(s)</label>
												</div>
												<div class="form-group">
													<div class="col-sm-12 ">
														<input class="js-rangeslider" type="text"
															id="cfg-system-processor-allocatedressources"
															name="cfg-system-processor-allocatedressources"
															data-grid="true" data-min="1" data-max="100"
															value="<%out.print(Integer.parseInt(mapCfg.getAllocatedRessouces()));%>"
															data-step="1">
													</div>
													<label class="col-md-7 control-label ">Allocated
														ressources (%)</label>
												</div>
											</div>
											<!-- End of #cfg-system-processor -->

											<div class="tab-pane" id="cfg-system-acceleration">Not
												available for now !</div>
											<!-- End of #cfg-system-acceleration -->

										</div>
										<!-- End of tab-content -->

									</div>
									<!-- End block -->

								</div>
								<!-- End of System -->

								<!-- Display block -->
								<div class="tab-pane push-30-t push-50 border-box "
									id="cfg-display">
									<div class="block">
										<ul class="nav nav-tabs nav-justified" data-toggle="tabs">
											<li class="active"><a href="#cfg-display-generalDisplay">Screen</a>
											</li>
											<li class=""><a href="#cfg-display-remoteServer">Remote
													display</a></li>

										</ul>
										<!-- General display content -->
										<div class="block-content tab-content">
											<div class="tab-pane active" id="cfg-display-generalDisplay">

												<div class="form-group">
													<label class="col-md-2 control-label ">Video memory
														(Mo)</label>
													<div class="col-sm-10 ">
														<input class="js-rangeslider" type="text"
															name="cfg-display-generalDisplay-vram" data-grid="true"
															data-min="1" data-max="128"
															value="<%out.print(Integer.parseInt(mapCfg.getvRAM()));%>"
															data-step="8">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label ">Monitor
														count</label>
													<div class="col-sm-10 ">
														<input class="js-rangeslider" type="text"
															name="cfg-display-generalDisplay-monitorCount"
															data-grid="true" data-min="1" data-max="8"
															value="<%out.print(Integer.parseInt(mapCfg.getMonitorCount()));%>"
															data-step="1">
													</div>
												</div>

												<div class="form-group">
													<div class="col-xs-12">
														<label class="control-label ">Acceleration</label><br>
														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-3">
																<label
																	class="css-input css-checkbox css-checkbox-primary">
																	<input name="cfg-display-generalDisplay-3DAcceleration"
																	type="checkbox" value="true"
																	<%out.print((mapCfg.getAcceleration3d().equals("true") ? "checked" : ""));%>><span></span>
																	3D acceleration
																</label><br>
															</div>
															<div class="col-xs-6 col-xs-offset-3">
																<label
																	class="css-input css-checkbox css-checkbox-primary">
																	<input name="cfg-display-generalDisplay-2DAcceleration"
																	type="checkbox" value="true"
																	<%out.print((mapCfg.getAcceleration2d().equals("true") ? "checked" : ""));%>><span></span>
																	2D acceleration
																</label><br>
															</div>
														</div>
													</div>
												</div>

											</div>
											<!-- End of #cfg-display-remoteServer-->

											<div class="tab-pane" id="cfg-display-remoteServer">
												<div class="form-group">
													<div class="col-xs-12">
														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-3">
																<label
																	class="css-input css-checkbox css-checkbox-primary">
																	<input name="cfg-display-remoteServer-enable"
																	type="checkbox" value="true"
																	<%out.print((mapCfg.getAcceleration3d().equals("true") ? "checked" : ""));%>><span></span>
																	Enable server
																</label><br>
															</div>
														</div>

													</div>
												</div>
												Not available !

											</div>
											<!-- End of #cfg-display-remoteServer -->

										</div>
										<!-- End of tab-content -->

									</div>
									<!-- End block -->

								</div>
								<!-- End of Display -->

								<!-- Storage block -->
								<div class="tab-pane push-30-t push-50 " id="cfg-storage">
									<div class="col-md-7 ">
										<div class="loader-storage"></div>
										<div class="btn-group">
											<button class="btn btn-clear dropdown-toggle" type="button"
												data-toggle="dropdown" aria-expanded="false">
												<i class="fa fa-plus"></i>
											</button>
											<ul class="dropdown-menu">
												<li class="dropdown-header">Connector type</li>
												<li><a id="new-controller-ide">IDE</a></li>
												<li><a id="new-controller-sata">SATA</a></li>
												<li><a id="new-controller-usb">USB</a></li>
												<li><a id="new-controller-floppy">Floppy</a></li>
												<li><a id="new-controller-sas">SAS</a></li>
												<li><a id="new-controller-scsi">SCSI</a></li>

											</ul>
										</div>
										<div
											class="js-tree-storage treeview border-box treeview-min-height"></div>
									</div>
									<div class="col-md-5">
										<div id="storage-infos"></div>

									</div>


								</div>
								<!-- End of Storage -->

								<!-- Audio block -->
								<div class="tab-pane push-30-t push-50 " id="cfg-audio">
									Not available for now !</div>
								<!-- End of Audio -->

								<!-- Network block -->
								<div class="tab-pane push-30-t push-50 border-box"
									id="cfg-network" style="margin-top: 0px !important">
									<div class="block">
										<ul class="nav nav-tabs nav-justified" data-toggle="tabs">
											<li class="active">
												<a href="#cfg-network-adapter0">Adapter 1</a>
											</li>
											<li class="">
												<a href="#cfg-network-adapter1">Adapter 2</a>
											</li>
											<li class="">
												<a href="#cfg-network-adapter2">Adapter 3</a>
											</li>
											<li class="">
												<a href="#cfg-network-adapter3">Adapter 4</a>
											</li>
										</ul>
										<!-- #cfg-network-adapter1  content -->
										<div class="block-content tab-content">
											<%for (int i = 0; i < 4; i++) {%>
											<div class="tab-pane <%if (i == 0) {out.print("active");}%>" id="cfg-network-adapter<%=i%>">
												<div class="form-group">
													<div class="col-xs-12">
														<div class="form-material form-material-primary">
															<div class="col-xs-6 ">
																<label class="css-input css-checkbox css-checkbox-primary"> Enabled 
																	<input name="cfg-network-adapter<%=i%>-enable" type="checkbox" value="true"><span></span>
																</label><br>
															</div>
														</div>
													</div>
													<div class="col-sm-10 ">
														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-1"> 
																<label class="css-input"> Attached to 
																	<select name="cfg-network-adapter<%=i%>-selectModeNetwork"
																	 id="cfg-network-adapter<%=i%>-selectModeNetwork"
																	onchange="toggle_visibility('cfg-network-adapter<%=i%>-selectModeNetwork',<%=i%>);">
																		<option value="Null">Not attached</option> 
																		<option value="NAT">NAT</option> 
																		<option value="NATNetwork">NAT Network</option>
																		<option value="Bridged">Bridged adapter</option>
																		<option value="Internal">Internal network</option>
																		<option value="HostOnly">Host-Only adapter</option>
																		<option value="Generic">Generic driver</option>
																	</select> <span></span> 
																</label><br>
															</div>
														</div>
													</div>
													<div class="col-sm-10 ">
														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-1">
																<label class="css-input"> Name 
																	<select name="cfg-network-adapter<%=i%>-nameNetwork" class="form-control" style="width: 100%;" id="cfg-network-adapter<%=i%>-nameNetwork">
																		<option class="NAT<%=i%>" value=""></option>
																		<% if(!NATNetworks.isEmpty()){
																			for(Map.Entry<String,Object> element : NATNetworks.entrySet()){
																				HashMap<String,Object> network = (HashMap<String,Object>) element.getValue();%>
																				<option class="NATNetworks<%=i%>" value="<%=network.get("Name")%>"><%=network.get("Name")%></option>
																			<%}
																		}
																		if(!InternalNetwork.isEmpty()){
																			for(String element : InternalNetwork){%>
																				<option class="InternalNetworks<%=i%>" value="<%=element%>"><%=element%></option>
																			<%}
																		}
																		if(!BridgedNetwork.isEmpty()){
																			for(Map.Entry<String,Object> element : BridgedNetwork.entrySet()){%>
																				<option class="Bridged<%=i%>" value="<%=element.getValue()%>"><%=element.getValue()%></option>
																			<%}
																		}
																		if(!HostOnlyNetworks.isEmpty()){
																			for(Map.Entry<String,Object> element2 : HostOnlyNetworks.entrySet()){
																				if (element2.getKey() != "NbHostOnly"){
																					HashMap<String,Object> network = (HashMap<String,Object>) element2.getValue();%>
																					<option class="HostOnlyNetworks<%=i%>" value="<%=network.get("Name")%>"><%=network.get("ShortName")%></option>
																		
																				<%}
																		    }
																		}%>
																	</select> <span></span>
																</label><br>
															</div>
														</div>
													</div>
													<div class="col-sm-10 ">
														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-1">
																<a href="#" onclick="toggle_visibility('advanced-network-settings',<%=i%>);">Advanced</a>
															</div>
														</div>
													</div>
													<div id="advanced-network-settings<%=i%>" class="col-sm-10 col-sm-offset-1" style="display: none">

														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-1">
																<label class="css-input"> Adapter type </label> 
																<select name="cfg-network-adapter<%=i%>-adapterType" class="form-control"
																	style="width: 100%;"
																	id="cfg-network-adapter<%=i%>-adapterType">
																	<option value="Am79C970A">PCnet-PCI II
																		(Am79C970A)</option>
																	<option value="Am79C973">PCnet-Fast III
																		(Am79C973)</option>
																	<option value="I82540EM">Intel PRO/1000 MT
																		Desktop (I82540EM)</option>
																	<option value="I82543GC">Intel PRO/1000 T
																		Server (I82543GC)</option>
																	<option value="I82545EM">Intel PRO/1000 MT
																		Server (I82545EM)</option>
																	<option value="Virtio">Paravirtualized Network
																		(virtio-net)</option>
																</select> <span></span>

															</div>

														</div>
														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-1">
																<label
																	class="css-input css-checkbox css-checkbox-primary">Promiscous
																	mode</label> <select name="cfg-network-adapter<%=i%>-promiscousMode" class="form-control" style="width: 100%;"
																	id="cfg-network-adapter<%=i%>-promiscousMode">
																	<option value="Deny">Deny</option>
																	<option value="AllowNetwork">Allow VMs</option>
																	<option value="AllowAll">Allow all</option>
																</select>
															</div>

														</div>


														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-1">
																<div class="col-xs-10" style="padding:0;">
																	<label class="css-input css-checkbox css-checkbox-primary"> MAC Address </label> 
																	<input id="cfg-network-adapter<%=i%>-MAC" class="form-control" type="text" name="cfg-network-adapter<%=i%>-MAC"> 
																</div>
																<div class="col-xs-2" style="top:35px;">
																	 <button class="btn no-border" type="button" id="button-refresh-MAC-<%=i%>"><i id="icon-refresh-MAC-<%=i%>" class="fa fa-refresh"></i></button> 
																</div>
															</div>
														</div>
														<div class="form-material form-material-primary"
															id="genericProperties">
															<div class="col-xs-6 col-xs-offset-1" id="cfg-network-adapter<%=i%>-genericProperties-label">
																<label
																	class="css-input css-checkbox css-checkbox-primary">Generic
																	properties </label> <input class="form-control" type="text"
																	name="cfg-network-adapter<%=i%>-genericProperties"
																	value="Not Available yet"> <span></span>
															</div>
														</div>
														<div class="form-material form-material-primary">
															<div class="col-xs-6 col-xs-offset-1">
																<label
																	class="css-input css-checkbox css-checkbox-primary">
																	Cable connected <input class="form-control"
																	name="cfg-network-adapter<%=i%>-cableConnected"
																	type="checkbox" value="true"><span></span>
																</label><br>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- End of #cfg-network1-->
											<%
												}
											%>
										</div>

										<!-- End of tab-content -->

									</div>
									<!-- End block -->

								</div>
								<!-- End of Network -->

								<!-- Ports block -->
								<div class="tab-pane push-30-t push-50 " id="cfg-ports">
									Not available for now !</div>
								<!-- End of Ports -->

								<!-- share block -->
								<div class="tab-pane " id="cfg-shareFolders">
									<div class="block">


										<div class="block-content">

											<div class="col-md-12">
												<div data-toggle="slimscroll" data-always-visible="true">
													<table class="table table-hover">
														<thead>
															<tr>
																<th class="text-center" style="width: 50px;">Name</th>
																<th>Path</th>
																<th class="hidden-xs" style="width: 15%;">Auto-mount</th>
																<th class="text-center" style="width: 100px;">Access</th>
																<th class="text-center" style="width: 100px;">Actions</th>
															</tr>
														</thead>
														<tbody id="table-shareFolders">
															<%
																if (mapCfg.getSharedFolder() == null) {
															%>
															<tr>
																<td class="text-center"></td>
																<td class="text-center">No Shared folder</td>
															</tr>
															<%
																} else {
																	HashMap<String, Object> sharedFolders = (HashMap<String, Object>) mapCfg.getSharedFolder();
																	for (int i=0;i< Integer.valueOf((int) sharedFolders.get("NbSharedFolders"));i++) {
																		HashMap<String, Object> folder = (HashMap<String, Object>) sharedFolders.get(String.valueOf(i));
															%>
															<tr>
																<td class="text-center"><%=folder.get("name")%></td>
																<td><%=folder.get("path")%></td>
																<%
																	if ((boolean) folder.get("automount")) {
																%>
																<td class="hidden-xs"><span
																	class="label label-success">Enabled</span></td>
																<%
																	} else {
																%>
																<td class="hidden-xs"><span
																	class="label label-danger">Disabled</span></td>
																<%
																	}
																%>
																<%
																	if ((boolean) folder.get("writable")) {
																%>
																<td class="text-center">Full</td>
																<%
																	} else {
																%>
																<td class="text-center">Read Only</td>
																<%
																	}
																%>
																<td class="text-center">
																	<div class="btn-group">
																		<div id="<%=folder.get("name")%>" class="btn-delete-sharedFolder">
																			<button type="button" data-toggle="modal"
																				class="btn btn-default">
																				<i class="fa fa-minus"></i>
																			</button>
																		</div>
																	</div>
																</td>
															</tr>
															<%
																}
																}
															%>
														</tbody>
													</table>
												</div>
												<div class="col-md-4 col-md-offset-4">
													<button class="btn btn-block btn-danger push-10"
														data-toggle="modal" data-target="#sharedFolder-modal"
														type="button">
														<i class="fa  fa-plus-square-o pull-left"></i> Create
														shared folder
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- End of share -->


							</div>
							<div
								class="block-content block-content-mini block-content-full border-t">
								<div class="row">
									<div class="col-xs-6">
										<button class="btn btn-default" type="button"
											data-dismiss="modal">Cancel</button>
									</div>
									<div class="col-xs-6 text-right">
										<button id="btn-save-cfg-vm" class=" btn btn-primary"
											type="submit">
											<i class="fa fa-check"></i>Save
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="modal modal-stack-1" id="sharedFolder-modal" tabindex="-1"
	role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-stack-position ">
		<div class="modal-content modal-stack-height ">
			<div class="block block-themed block-transparent remove-margin-b">
				<div class="block-header bg-success">
					<ul class="block-options">
						<li>
							<button data-dismiss="modal" type="button">
								<i class="si si-close"></i>
							</button>
						</li>
					</ul>
					<h3 class="block-title">
						<i class="fa fa-plus-square-o" aria-hidden="true"></i>&nbsp;Add
						shared folder
					</h3>
				</div>
				<div class="block-content tab-content">
					<form class="js-form-sharedFolder">
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-2">
								<div class="form-material form-material-primary">
									<label for="cfg-general-basic-name">Name of folder</label> <input
										class="form-control" name="nameFolder" type="text">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-2">
								<div class="form-material form-material-primary">
									<label class="css-input css-checkbox css-checkbox-primary">
										Read-only &nbsp;<input name="readOnly" type="checkbox"
										value="true"><span></span>
									</label><br>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-2">
								<div class="form-material form-material-primary">
									<label class="css-input css-checkbox css-checkbox-primary">
										Auto-mount &nbsp;<input name="autoMount" type="checkbox"
										value="true"><span></span>
									</label><br>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-sm btn-default" type="button"
						data-dismiss="modal">Cancel</button>
					<button id="btn-create-shared-folder" class="btn btn-sm btn-danger">
						<i class="fa fa-check"></i> Create
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal modal-stack-1" id="createHDD-modal" tabindex="-1"
	role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-stack-position ">
		<div class="modal-content modal-stack-height ">
			<div class="block block-themed block-transparent remove-margin-b">
				<div class="block-header bg-success">
					<ul class="block-options">
						<li>
							<button data-dismiss="modal" type="button">
								<i class="si si-close"></i>
							</button>
						</li>
					</ul>
					<h3 class="block-title">
						<i class="fa fa-plus-square-o" aria-hidden="true"></i>&nbsp;Create
						hard disk
					</h3>
				</div>
				<div class="block-content tab-content">
					<form id="js-form-createHDD">
						<div class="col-md-12">
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-2">
									<div class="form-material">
										<input class="form-control" type="text" name="createHDD-name"
											placeholder="Name" required value="Hdd-1"> <label
											for="createHDD-name">Name</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-1 control-label">HDD (Go)</label>
								<div class="col-sm-11 ">
									<input class="js-rangeslider" type="text" id="createHDD-size"
										name="createHDD-size" data-grid="true" data-min="1"
										data-max="100" value="24" data-step="1">
								</div>
							</div>
							<div class="form-group">
								<label class="col-ms-2">&nbsp;Format</label><br>
								<div class="col-md-6 col-md-offset-3 text-center">
									<label class="radio-inline" for="example-inline-radio1">
										<input type="radio" id="createHDD-format"
										name="createHDD-format" value="vdi" checked> .vdi
									</label> <label class="radio-inline" for="example-inline-radio2">
										<input type="radio" id="createHDD-format"
										name="createHDD-format" value="vmdk"> vmdk
									</label>
								</div>

							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-sm btn-default" type="button"
						data-dismiss="modal">Cancel</button>
					<button id="btn-createHDD" class="btn btn-sm btn-danger">
						<i class="fa fa-check"></i> Create
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function setListOsCfg() {
		var osType = document.getElementById('cfg-general-basic-type-os').value;
		$('.cfg-Windows').hide();
		$('.cfg-Linux').hide();
		$('.cfg-Mac').hide();
		$('.cfg-Other').hide();
		switch (osType) {
		case "Windows":
			$('.cfg-Windows').show();
			break;
		case "Linux":
			$('.cfg-Linux').show();
			break;
		case "Mac OS X":
			$('.cfg-Mac').show();
			break;
		case "Other":
			$('.cfg-Other').show();
			break;

		default:
			break;

		}

	}
	setListOsCfg();
	
	function init(){	
		for(var i=0;i<4;i++){
			$('.NATNetworks'+i.toString()).hide();
			$('.InternalNetworks'+i.toString()).hide();
			$('.Bridged'+i.toString()).hide();
			$('.NAT'+i.toString()).hide();
			$('.HostOnlyNetworks'+i.toString()).hide();
			$('#cfg-network-adapter'+i.toString()+'-nameNetwork').prop("disabled", false);
			$('#cfg-network-adapter'+i.toString()+'-promiscousMode').prop("disabled", false);
			$('#cfg-network-adapter'+i.toString()+'-genericProperties-label').hide();
		}
	}

	
function toggle_visibility(selection,i) {
	if(selection =='advanced-network-settings'){
		if(document.getElementById(selection+i.toString()).style.display == 'block'){
			document.getElementById(selection+i.toString()).style.display = 'none';
		}else{
			document.getElementById(selection+i.toString()).style.display = 'block';
		}
	}else{
		init();
		var element = document.getElementById(selection);
		var currentSelection = element.options[element.selectedIndex].value;
		if ((currentSelection == 'Null')||(currentSelection == 'NAT')) {
			//Cas de not attached ou d'un NAT simple
			$('.NAT'+i.toString()).show();
			$('#cfg-network-adapter'+i.toString()+'-nameNetwork').prop("disabled", true);
			$('#cfg-network-adapter'+i.toString()+'-promiscousMode').prop("disabled", true);
		}else if(currentSelection == 'NATNetwork'){
			//Cas d'un NAT Network
			$('.NATNetworks'+i.toString()).show();
		}else if(currentSelection == 'Bridged'){
			//Cas d'un Bridge Network
			$('.Bridged'+i.toString()).show();
		}else if(currentSelection == 'Internal'){
			//Cas d'un internal Network
			$('.InternalNetworks'+i.toString()).show();
		}else if(currentSelection == 'HostOnly'){
			//Cas d'un hiostOnly Network
			$('.HostOnlyNetworks'+i.toString()).show();
		}else{
			//Cas du generic
			$('#cfg-network-adapter'+i.toString()+'-nameNetwork').prop("disabled", true);
			$('#cfg-network-adapter'+i.toString()+'-promiscousMode').prop("disabled", true);
			$('#cfg-network-adapter'+i.toString()+'-genericProperties-label').show();
		}
	}
}		

function initialiseValueNetwork(){
	$.ajax({
		url: 'Session',
		type: 'POST', 
		dataType:'json',
		data: $('.js-value-form').serialize() + "&param=mapMachine",
		success: function (data) { 
			if (data.header.status == '200'){
				$.each(data.data,function(key,val){
					var i = key.substring(7);
					
					if(val.enabled == "true"){
						$('[name=cfg-network-adapter'+i.toString()+'-enable]').prop('checked', true);
					}
					$('#cfg-network-adapter'+i.toString()+'-selectModeNetwork option[value='+val.attachmentType+']').attr('selected','selected');
					toggle_visibility('cfg-network-adapter'+i.toString()+'-selectModeNetwork',i.toString());
					
					if(val.attachmentType != "NAT" && val.attachmentType != "Null"){ 
						$('#cfg-network-adapter'+i.toString()+'-nameNetwork option[value='+val.connectedTo+']').attr('selected','selected');
						$('#cfg-network-adapter'+i.toString()+'-promiscousMode option[value='+val.promiscuousMode+']').attr('selected','selected');

					}
					$('#cfg-network-adapter'+i.toString()+'-adapterType option[value='+val.adapterType+']').attr('selected','selected');
					$('[name=cfg-network-adapter'+i.toString()+'-MAC]').val(val.MACAdress);
					if(val.cableConnected){
						$('[name=cfg-network-adapter'+i.toString()+'-cableConnected]').prop('checked', true);
					}
				
				});
			}else{
				alert('Error1 : '+' ['+data.header.status+'] getNetworks');
			}
	       	
		},
		error: function (jqXHR, textStatus, errorThrown) { 
			alert('Error2 : '+ jqXHR.status+' ['+errorThrown+'] getNetworks');
		}
	});
}


	init();
	initialiseValueNetwork();




</script>


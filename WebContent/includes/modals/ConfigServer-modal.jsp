<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="rwb.java.divers.HashmapBO"%>
<%@ page import="rwb.java.divers.Tools" %>
<%@ page import="rwb.java.proxy.Proxy"%>
<%


HashMap<String, Object> mapSrv = null;
String stateMachine = "";
String serverId ="";

if(request.getSession().getAttribute("proxy") !=null){ 
	
	mapSrv = (HashMap<String, Object>)((Proxy)request.getSession().getAttribute("proxy")).getMapServer();
	serverId = ((Proxy)request.getSession().getAttribute("proxy")).getSrvId();
}
%>
<div class="modal" id="configureServer-modal" tabindex="-1" role="dialog"
	aria-hidden="true" style="display: none;">
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
					<h3 class="block-title"><i class="fa fa-cogs" aria-hidden="true"></i>&nbsp;Settings</h3>
				</div>
				<div class="block-content">
					<div class="js-wizard-simple block border-box">
						<ul class="nav nav-tabs nav-justified">
							
							<!-- List of tab for configure modal -->
							<li class="active">
								<a href="#cfg-general-server" data-toggle="tab" aria-expanded="true">
									 <img height="30" src="assets/img/icon-rwb/general.svg"><br>General
								</a>
							</li>
							<li >
								<a href="#cfg-network-server" data-toggle="tab" aria-expanded="false">
									 <img height="30" src="assets/img/icon-rwb/network.svg"><br>Network
								</a>
							</li>
							<li >
								<a href="#cfg-media-manager" data-toggle="tab" aria-expanded="false">
									 <img height="30" src="assets/img/icon-rwb/storage.svg"><br>Media
								</a>
							</li>
						</ul>
						
						<form class="form-horizontal" action="#" method="post">
							<div class="block-content tab-content">
							
								<!--General Tab-->
								<div class="tab-pane push-30-t push-50 border-box active" id="cfg-general-server">
								
									<!-- General content -->
									<div class="block">
										<div class="block-content ">
											<div class="tab-pane active" id="cfg-general-basic">						
												<div class="form-group">
													<div class="col-sm-8 col-sm-offset-2">
														<label for="cfg-general-basic-name">Default Machine Folder:</label> 
														<input class="form-control" type="text" name="cfg-general-basic-name" value="test">
													</div>
												</div>
											</div><!-- End of basic -->
											
										</div>
										
									</div><!-- End block -->
									
								</div><!-- End of General -->
								
								<!--Network Tab-->
								<div class="tab-pane push-30-t push-50 border-box col-md-10 col-md-offset-1" id="cfg-network-server">
									
									
									<div class="block">
										<ul class="nav nav-tabs nav-justified" data-toggle="tabs">
											<li class="active"> 
												<a href="#cfg-server-network-NAT">NAT</a>
											</li>
											<li class="">
												<a href="#cfg-server-network-HostOnly">Host-Only</a>
											</li>
											<li class="">
												<a href="#cfg-server-network-Internal">Internal</a>
											</li>
										</ul>
										
										<div class="block-content tab-content">
											<div class="tab-pane active" id="cfg-server-network-NAT">
												<div class="col-sm-11">
												<!-- Network NAT content -->
					                                <div class="form-group">
					                                    <b>Select NAT network:</b> <BR>
					                                    <select id="NATNetworkServer" class="listboxNetworkServer" name="internalNetworks" size="4" multiple >
					                                  	<%List<String> internals = (List<String>) mapSrv.get("NATNetworks"); 
					                                  	if(internals.isEmpty()){
					                                  		%><option> No NAT<%
					                                  	}
					                                  	for(String s:internals){%>
															<option value="<%=s%>"> <%=s%>
														<%} %>
														</select>
					                                </div>
				                                </div>
				                                <div class="col-sm-1">
				                                	<p></p>
				                                	<button type="button"   class="btn btn-default"><i class="fa fa-plus"></i></button>
													<button type="button"   class="btn btn-default"><i class="fa fa-cog"></i></button>
					                                <button type="button"   class="btn btn-default"><i class="fa fa-minus"></i></button>
				                                </div>
											</div>
										
											<!-- Network HostOnly content -->
											
											<div class="tab-pane " id="cfg-server-network-HostOnly">
												<div class="col-sm-11">
					                                <div class="form-group">
					                                    <b>Select Host Only network:</b> <BR>
				                                        <select id="HostOnlyNetworkServer" class="listboxNetworkServer" name="internalNetworks" size="4" multiple >
					                                  	
					                                  	<% HashMap<String,Object> host = (HashMap<String,Object>) mapSrv.get("HostOnlyNetworks"); 
					                                  	if((int) host.get("NbHostOnly") == 0){
					                                  		%><option> No hostOnly networks<%
					                                  	}else{
					                                  		for(int f=1;f<=(int) host.get("NbHostOnly");f++){
					                                  			HashMap<String,Object> network = (HashMap<String,Object>) host.get(String.valueOf(f));%>
																<option value="<%=network.get("Name")%>"> <%=network.get("ShortName")%>
															<%}
														} %>
														</select>
					                                </div>
					                            </div>
					                            <div class="col-sm-1">
				                                	<p></p>
				                                	<button id="btn-create-HostOnlyNetwork-server" type="button" class="btn btn-default"><i class="fa fa-plus"></i></button>
													<button id="btn-modif-HostOnlyNetwork-server" type="button" data-toggle="modal" data-target="#modif-HostOnlyNetwork-server-modal" class="btn btn-default" disabled><i class="fa fa-cog"></i></button>
					                                <button id="btn-delete-HostOnlyNetwork-server" type="button"  class="btn btn-default"><i class="fa fa-minus"></i></button>
				                                </div>
											</div>
											<!-- Internal part -->
											<div class="tab-pane " id="cfg-server-network-Internal">
					                                <div class="form-group">
					                                    <b>Select internal network:</b> <BR>
					                                    <select class="listboxNetworkServer" name="internalNetworks" size="4" multiple >
					                                  	<%List<String> internal = (List<String>) mapSrv.get("InternalNetworks"); 
					                                  	if(internal.isEmpty()){
					                                  		%><option> No internal network<%
					                                  	}
					                                  	for(String f:internal){%>
															<option value="<%=f%>"> <%=f%>
														<%} %>
														</select>
					                                </div>
					                            </div>
					                   
											</div>
										</div>
									</div><!-- End block -->
									
								</div><!-- End of System -->
								
								<!-- Display block -->
								<div class="tab-pane push-30-t push-50 " id="cfg-display">
						
								</div><!-- End of Display -->
							
							
							</div>
							<div class="block-content block-content-mini block-content-full border-t">
								<div class="row">
									<div class="col-xs-6">
										<button class="btn btn-default" type="button" data-dismiss="modal">Cancel</button>
									</div>
									<div class="col-xs-6 text-right">
										<button class=" btn btn-primary" type="submit"><i class="fa fa-check"></i>Save</button>
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

<!-- Modal modif HostOnlyNetwork -->
<div class="modal modal-stack-1" id="modif-HostOnlyNetwork-server-modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
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
						<i class="fa fa-plus-square-o" aria-hidden="true"></i>&nbsp;Modif Host-Only Network
					</h3>
				</div>
				<div class="block-content tab-content">
					<div class="loader-block"></div>
			 
					<div class="js-wizard-simple block">
						<ul class="nav nav-tabs nav-justified">
							<li class="active">
								<a href="#adapter" data-toggle="tab" aria-expanded="false">Adapter</a>
							</li>
							<li >
								<a href="#dhcp" data-toggle="tab" aria-expanded="true">DHCP server</a>
							</li> 
						</ul>
						<form class=" js-form-modif-hostOnly" >
							<div class="block-content tab-content">
								<div class="tab-pane push-30-t push-50 active" id="adapter">
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-hostOnly-ipv4">IPv4 address</label>
											<input class="form-control" type="text" id="cfgsrv-hostOnly-ipv4" name="cfgsrv-hostOnly-ipv4" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-hostOnly-ipv4Mask">IPv4 network mask</label>
											<input class="form-control" type="text" id="cfgsrv-hostOnly-ipv4Mask" name="cfgsrv-hostOnly-ipv4Mask" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-hostOnly-ipv6">IPv6 address</label>
											<input class="form-control" type="text" id="cfgsrv-hostOnly-ipv6" name="cfgsrv-hostOnly-ipv6" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-hostOnly-ipv6MaskLength">IPv6 network mask lengths</label>
											<input class="form-control" type="text" id="cfgsrv-hostOnly-ipv6MaskLength" name="cfgsrv-hostOnly-ipv6MaskLength" >
										</div>
									</div>
								
								</div>
								<div class="tab-pane push-30-t push-50" id="dhcp">
									<div class="form-group">
										<div class="col-xs-12">
											<div class="form-material form-material-primary">
												<div class="col-xs-6 col-xs-offset-3">
													<label class="css-input css-checkbox css-checkbox-primary">
														<input id="cfgsrv-hostOnly-dhcp-enable" name="cfgsrv-hostOnly-dhcp-enable" type="checkbox" value="true" ><span></span>
														Enable server
													</label><br>
												</div>
											</div>

										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-hostOnly-dhcp-address">Server address</label>
											<input class="form-control" type="text" id="cfgsrv-hostOnly-dhcp-address" name="cfgsrv-hostOnly-dhcp-address" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-hostOnly-dhcp-mask">Server mask</label>
											<input class="form-control" type="text" id="cfgsrv-hostOnly-dhcp-mask" name="cfgsrv-hostOnly-dhcp-mask" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-hostOnly-dhcp-lowerAdd">Lower address bound</label>
											<input class="form-control" type="text" id="cfgsrv-hostOnly-dhcp-lowerAdd" name="cfgsrv-hostOnly-dhcp-lowerAdd" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-8 col-sm-offset-2">
											<label for="cfgsrv-hostOnly-dhcp-upperAdd">Upper address bound</label>
											<input class="form-control" type="text" id="cfgsrv-hostOnly-dhcp-upperAdd" name="cfgsrv-hostOnly-dhcp-upperAdd" >
										</div>
									</div>
								
								</div>
					
							</div> 
						</form>
					</div>
					
				</div>
				<div class="modal-footer">
					<button class="btn btn-sm btn-default" type="button" data-dismiss="modal">Cancel</button>
					<button id="btn-save-mofi-hostOnly" class="btn btn-sm btn-primary" type="submit">
						<i class="fa fa-check"></i> Ok
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
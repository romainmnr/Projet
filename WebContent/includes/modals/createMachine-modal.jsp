<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="rwb.java.divers.Tools" %>
<%@ page import="rwb.java.server.bo.ServeurBO" %>
<%@ page import="rwb.java.proxy.Proxy"%>
<%

List<ServeurBO> listSrvCreateMachine = null;
HashMap<String,Object> mapSrvCreateMachine = new HashMap<String,Object>();

if(request.getSession().getAttribute("proxy") !=null){ 
	
	listSrvCreateMachine = ((Proxy)request.getSession().getAttribute("proxy")).getListServeur();
	
}
%>
<div class="modal" id="createMachine-modal" tabindex="-1" role="dialog"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
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
					<h3 class="block-title" id="newMachine-modal-title">Create a new virtual machine</h3>
				</div>
				<div class="block-content">
				<div class="loader-createMachine"></div>
					<div class="col-lg-12">
						<div class="js-wizard-classic-validation block border-box">

							<ul class="nav nav-tabs nav-justified">
								<li class="active">
									<a href="#general" data-toggle="tab" aria-expanded="false">1. General</a>
								</li>
								<li class="">
									<a href="#processors" data-toggle="tab" aria-expanded="true">2. Processor</a>
								</li>
								<li>
									<a href="#hdd" data-toggle="tab">3. HDD</a>
								</li>
							</ul>

							<form class="js-form-create-machine form-horizontal" id="create-vm-form">

								<div class="block-content block-content-mini block-content-full border-b hidden-xs">
									<div class="wizard-progress progress active remove-margin-b">
                                        <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0"></div>
                                    </div>
								</div>

								<div class="block-content tab-content">
									<div class="tab-pane fade fade-up push-30-t push-50 active in" id="general">
										 <div class="form-group">
                                            <div class="col-sm-8 col-sm-offset-2">
                                                <div class="form-material">
													<select class="form-control" id="vm-server" name="vm-server" style="width: 100%;" required>
														<option></option>
														<%for(ServeurBO s : listSrvCreateMachine){ %>
														<option value="<% out.print(s.getId());%>"><% out.print(s.getName()); %></option>
														<% } %>
													</select>
													<label for="vm-server">Server</label> 
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<div class="form-material"> 
													<input class="form-control" type="text" name="vm-name" placeholder="Windows 10" required>
													<label for="vm-name">Name</label> 
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<div class="form-material"> 
													<select class=" form-control" id="vm-type-os" name="vm-type-os" size="1" style="width: 100%;" onChange="setListOs();">
														<option></option>
													<%for(Map.Entry<String,HashMap<String,String>> e : Tools.getOS().entrySet()){ %> 
														<option value="<% out.print(e.getKey()); %>"><% out.print(e.getKey()); %></option>
													<% } %>
													</select>
													<label for="vm-type-os">Type</label> 
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-8 col-sm-offset-2">
												<div class="form-material"> 
													<select class=" form-control" id="vm-os" name="vm-os" size="1" style="width: 100%;"required>
														<option></option>
														<%for(Map.Entry<String,HashMap<String,String>> t : Tools.getOS().entrySet()){ 
															HashMap<String,String> type = t.getValue();
															for(Map.Entry<String,String> os : type.entrySet()){ %> 
																<option class="<%out.print(t.getKey()); %>" value="<% out.print(os.getKey()); %>"><% out.print(os.getKey()); %></option>
													<% } }%>
													</select>
													<label for="vm-os">Version</label> 
												</div>
											</div>
										</div> 
										<div class="form-group">
											<div class="icon-os col-sm-8 col-sm-offset-2">
												<div class="form-material">
												
													
												</div>
											</div>
										</div>
									</div>

									<div class="tab-pane fade fade-up push-30-t push-50 " id="processors">
										
										<div class="form-group">
		                                    <label class="col-md-1 control-label ">RAM (Mo)</label>
		                                    <div class="col-sm-11 ">
		                                        <input class="js-rangeslider" type="text" id="vm-ram" name="vm-ram" data-grid="true" 
		                                        data-min="128" data-max="4"  
		                                        value="1096" data-step="8">
		                                    </div>
		                                </div>

		                                <div class="form-group">
		                                    <label class="col-md-1 control-label ">CPU</label>
		                                    <div class="col-sm-11">
		                                        <input class="js-rangeslider" type="text" id="vm-cpu" name="vm-cpu"   data-min="1"
		                                         data-max="4"
		                                         value="1" data-step="1">
		                                    </div>
		                                </div>
		                                

									</div>
									<div class="tab-pane fade fade-up push-30-t push-50" id="hdd">
										
										<div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="form-material form-material-primary">
                                                	<div class="col-xs-6 col-xs-offset-3" > 
														<label class="css-input css-checkbox css-checkbox-primary">
															<input id="vm-hdd-enable"  name="vm-hdd-enable" type="checkbox" value="true" onchange="enableHDD();" checked><span></span> Create a virtual hard disk now 
														</label><br> 
													</div>  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 border-box">
	                                        <div class="form-group">
			                                    <label class="col-md-1 control-label">HDD (Go)</label>
			                                    <div class="col-sm-11 ">
			                                        <input class="js-rangeslider" type="text" id="vm-hdd-size" name="vm-hdd-size" data-grid="true" 
			                                        data-min="1" data-max="100" value="24" data-step="1">
			                                    </div>
			                                </div>
											<div class="form-group">  
												   <label class="col-ms-2">&nbsp;Format</label><br>
												   <div class="col-md-6 col-md-offset-3 text-center">
													   <label class="radio-inline" for="example-inline-radio1">
															<input type="radio" id="vm-hdd-format" name="vm-hdd-format" value="vdi" checked> .vdi
														</label>
														<label class="radio-inline" for="example-inline-radio2">
															<input type="radio" id="vm-hdd-format" name="vm-hdd-format" value="vmdk"> vmdk
														</label>
												   </div>
													
											
							
											</div>
										</div>

									</div>
								</div>

								<div class="block-content block-content-mini block-content-full border-t">
									<div class="row">
										<div class="col-xs-6">
											<button id="modal-previous-btn"class="wizard-prev btn btn-default" type="button">
												<i class="fa fa-arrow-left"></i>Previous
											</button>
										</div>
										<div class="col-xs-6 text-right">
											<button id="modal-next-btn" class="wizard-next btn btn-default" type="button">
												Next <i class="fa fa-arrow-right"></i>
											</button>
											<button id="btn-create-machine"class="wizard-finish btn btn-primary" type="submit"
												style="display: none;">
												<i class="fa fa-check"></i>Create
											</button>
										</div>
									</div>
								</div>

							</form>
						</div>
					</div>

				</div>
			</div>
			<div class="modal-footer">
			
			</div>
		</div>
	</div>
</div>
  
<script>

function setListOs(){
	var osType= document.getElementById('vm-type-os').value;
	$('.windows').hide();
	$('.Linux').hide();
	$('.Mac').hide();
	$('.Other').hide();
	switch(osType){
	case "Windows":
		$('.Windows').show();
		break;
	case "Linux":
		$('.Linux').show();
		break;
	case "Mac OS X":
		$('.Mac').show();
		break;
	case "Other":
		$('.Other').show();
		break;
		
	default :
		break;
	
	}
	
}
function enableHDD(){
	if ($("#vm-hdd-enable").prop("checked") == true) {
	
		$('input[id="vm-hdd-format"]').removeAttr("disabled");
		$(".js-irs-2").find("span.irs-disable-mask").remove();
		 $(".js-irs-2").removeClass("irs-disabled");
	}else{
		
		 $('input[id="vm-hdd-format"]').attr('disabled','disabled');
		 $(".js-irs-2").append("<span class=\"irs-disable-mask\"></span>");
		 $(".js-irs-2").addClass("irs-disabled");
	}
	
}

setListOs();
enableHDD();

</script>
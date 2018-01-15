<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String stopModal_srv = "";
String stopModal_vm = "";
if(request.getParameterMap().containsKey("idVm") & request.getParameterMap().containsKey("srvId")){ 
	stopModal_srv = request.getParameter("srvId");
	stopModal_vm = request.getParameter("idVm");
}
%>
<div class="modal fade" id="stopMachine-modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<form id="stop-machine-form">
				<div class="block block-themed block-transparent remove-margin-b">
					<div class="block-header bg-danger">
						<ul class="block-options">
							<li>
								<button data-dismiss="modal" type="button">
									<i class="si si-close"></i>
								</button>
							</li>
						</ul>
						<h3 class="block-title">Shut Down</h3>
					</div>
					<div class="block-content">
						<div class="form-group">
							<label class="col-xs-12">Shut down mode</label>
							<input type="hidden" name="stop-srv" value="<%= stopModal_srv %>">
							<input type="hidden" name="stop-vm" value="<%= stopModal_vm %>">
							<div class="col-xs-12">
								<div class="radio">
									<label for="std"> 
										<input type="radio" id="std" name="stopMode-vm" value="std" >
										<i class="fa fa-power-off" aria-hidden="true"></i>&nbsp;Shut down
									</label>
								</div>
								<div class="radio">
									<label for="forced"> 
										<input type="radio" id="forced" name="stopMode-vm" value="forced" checked>
										<i class="fa fa-bolt" aria-hidden="true"></i>&nbsp;Force shut down
									</label>
								</div>
							</div>
						</div>
				
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-sm btn-default" type="button" data-dismiss="modal">Cancel</button>
					<button id="btn-stop-machine" class="btn btn-sm btn-danger" type="submit">
						<i class="fa fa-check"></i> Ok
					</button>

				</div>
			</form>
		</div>
	</div>
</div>
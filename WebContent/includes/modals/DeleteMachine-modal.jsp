<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String deleteModal_srv = "";
String deleteModal_vm = "";
if(request.getParameterMap().containsKey("idVm") & request.getParameterMap().containsKey("srvId")){ 
	deleteModal_srv = request.getParameter("srvId");
	deleteModal_vm = request.getParameter("idVm");
}
%>
<div class="modal fade" id="deleteMachine-modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<form id="delete-vm-form">
				<div class="block block-themed block-transparent remove-margin-b">
					<div class="block-header bg-danger">
						<ul class="block-options">
							<li>
								<button data-dismiss="modal" type="button">
									<i class="si si-close"></i>
								</button>
							</li>
						</ul>
						<h3 class="block-title">Delete machine</h3>
					</div>
					<div class="block-content">
						<input type="hidden" name="delete-srv" value="<%= deleteModal_srv %>">
						<input type="hidden" name="delete-vm" value="<%= deleteModal_vm %>">
						<p>Êtes vous sur de vouloir supprimer cette machine ? </p>
						<div class="col-xs-12">
								<div class="radio">
									<label for="M-HDD"> 
										<input type="radio" id="M-HDD" name="delete-vm-mode" value="M-HDD" checked>
										&nbsp;Machine + HDD
									</label>
								</div>
								<div class="radio">
									<label for="M-HDD-ISO"> 
										<input type="radio" id="M-HDD-ISO" name="delete-vm-mode" value="M-HDD-ISO" >
										&nbsp;Machine + HDD + ISO
									</label>
								</div>
								<div class="radio">
									<label for="M"> 
										<input type="radio" id="M" name="delete-vm-mode" value="M" >
										&nbsp;Machine
									</label>
								</div>
					
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-sm btn-default" type="button" data-dismiss="modal">Cancel</button>
					<button id="btn-delete-machine" class="btn btn-sm btn-danger" type="submit">
						<i class="fa fa-check"></i>Confirm
					</button>

				</div>
			</form>
		</div>
	</div>
</div>
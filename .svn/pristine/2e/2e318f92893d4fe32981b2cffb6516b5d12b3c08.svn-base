<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path1 = "";

	if (request.getSession().getAttribute("path") != null) {
		path1 = (String) request.getSession().getAttribute("path");
	}
%>
<!-- Sidebar -->
<nav id="sidebar">


	<!-- Sidebar Content -->
	<div class="sidebar-content">
		<div class="loader-sidebar"></div>
		<!-- Side Header -->
		<div class="side-header side-content " id="sidebar-top">
			<a href="<%=path1%>index.jsp" style="padding-top: 20px;"><img
				id="logo-sidebar" alt="logo white"
				src="<%=path1%>assets/logo/RWB_title_white.svg" /></a>
			<button
				class="btn btn-link text-gray pull-right  hidden-lg btn-close-sidebar-md"
				type="button" data-toggle="layout" data-action="sidebar_close">
				<i class="fa fa-times"></i>
			</button>
			<div class="sidebar-header-menu">
				<button id="btn-refresh-sidbar" class="btn-sidebar-header "
					data-toggle="tooltip" data-placement="bottom" title=""
					type="button" data-original-title="Refresh sideBar">
					<i class="fa fa-refresh"></i>
				</button>
				<!-- <button
							onclick="window.open('includes/modals/GeneralSettings-modal.jsp', '_blank', 'location=yes,height=500,width=700,scrollbars=yes,status=yes');"
							class="btn-sidebar-header" data-toggle="tooltip"
							data-placement="bottom" title="" type="button"
							data-original-title="General settings">
							<i class="fa fa-cogs"></i>
						</button>-->
				<button class="btn-sidebar-header" data-toggle="tooltip"
					data-placement="bottom" title="" type="button"
					data-original-title="Forum"
					onclick="location.href='<%=path1%>Forum/Final.jsp'">
					<i class="fa fa-comments-o" aria-hidden="true"></i>
				</button>
				<button id="btn-lock-sidebar" class="btn-sidebar-header"
					data-toggle="tooltip" data-placement="bottom" title=""
					type="button" data-original-title="Fixed sideBar">
					<i class="fa fa-lock" aria-hidden="true"></i>
				</button>
				<button id="btn-lock-sidebar" class="btn-sidebar-header"
					data-toggle="tooltip" data-placement="bottom" title=""
					type="button" data-original-title="Contact"
					onclick="location.href='<%=path1%>contact.jsp'">
					<i class="fa fa-envelope white" aria-hidden="true"></i>
				</button>
			</div>
			<div class="sidebar-separator"></div>
			<div class="fixed-btn-sidebar">
				<a id="btn-sidebar-newMachine" data-toggle="modal"
					data-target="#choice-newMachine-modal" href="#"> <i
					class="fa fa-plus " aria-hidden="true"></i> <span
					id="server-sidebar-name">New machine</span>
				</a>
			</div>
			<%if(request.getSession().getAttribute("login-rights") != null){
				if("admin".equals(request.getSession().getAttribute("login-rights"))){
			%>
			<div class="fixed-btn-sidebar">
				<a id="btn-sidebar-newMachine" href="<%=path1%>userManager.jsp"> <i
					class="fa fa-users " aria-hidden="true"></i> <span
					id="server-sidebar-name">Users manager</span>
				</a>
			</div>
			<%}} %>
			<div class="sidebar-separator"></div>
		</div>
		<!-- END Side Header -->

		<!-- Side Content -->
		<div class="side-content" id="side-sontent-scroll">

			<ul id="ul-sidebar-content" class="nav-main">
				<div class="col-md-12"></div>
			</ul>

		</div>
		<!-- END Side Content -->
		<div class="sidebar-footer"></div>
	</div>
	<!-- Sidebar Content -->

</nav>
<!-- END Sidebar -->



<div class="modal fade in" id="choice-newMachine-modal" tabindex="-1"
	role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-sm modal-dialog ">
		<div class="modal-content">
			<div class="block block-themed block-transparent">
				<div class="block-header bg-custom">
					<ul class="block-options">
						<li>
							<button data-dismiss="modal" type="button">
								<i class="si si-close"></i>
							</button>
						</li>
					</ul>
					<h3 class="block-title">Create a new machine</h3>
				</div>
				<div class="block-content">
					<div class="row text-center">
						<div class="col-xs-6">
							<a class="block block-rounded" href="#">
								<div class="block-content text-white bg-default">
									<i class="fa fa-upload fa-2x" aria-hidden="true"></i>
									<div class="font-w600 push-15-t push-15">Import</div>
								</div>
							</a>
						</div>
						<div class="col-xs-6">
							<a class="block block-rounded" href="#" data-toggle="modal"
								data-target="#createMachine-modal">
								<div class="block-content text-white bg-modern">
									<i class="fa fa-plus fa-2x" aria-hidden="true"></i>
									<div class="font-w600 push-15-t push-15">Create</div>
								</div>
							</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

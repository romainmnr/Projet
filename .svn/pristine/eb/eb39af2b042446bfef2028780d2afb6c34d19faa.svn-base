<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rwb.java.bdd.bo.BddServeurBO"%>
<%@ page import="rwb.java.server.bo.ServeurBO"%>
<%@ page import="java.util.List"%>
<%@ page import="rwb.java.proxy.Proxy"%>
<%@ include file="/includes/action/checkSession.jsp"%>
<%@ page import="java.util.Enumeration" %>
<%
	Proxy prox = new Proxy();
	prox.connectionBDD();
	request.getSession().setAttribute("proxy", prox);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remote Web Box : Dashboard</title>
<!-- MetaData and css import -->
<%@ include file="/includes/head.jsp"%>

</head>
<body>
	<div id="page-container"
		class="sidebar-l  side-scroll header-navbar-fixed">

		<%@ include file="/includes/sideBar.jsp"%>
		<%@ include file="/includes/header.jsp"%>

		<!-- Main Container -->
		<main id="main-container">
		<div class="content bg-image overflow-hidden"
			style="background-image: url('assets/img/photos/photo10@2x.jpg'); padding-top: 100px">
			<div class="push-50-t push-15">
				<h1 class="h2 text-white animated zoomIn">Dashboard</h1>
				<h2 class="h5 text-white-op animated zoomIn">
					Welcome
					<%=request.getSession().getAttribute("login-username")%></h2>
			</div>
		</div>
		<div class="logo-background"></div>
		<div id="key-numbers-user" class="col-lg-12">
			<div class="block block-content">
				<div class="col-xs-6 col-sm-4 col-md-4 col-lg-4">
					<h5 id="nb-of-vm">0</h5>
					<h4>Virtual</h4>
					<h4>machine(s)</h4>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-4 col-lg-4">
					<h5>0</h5>
					<h4>Shared</h4>
					<h4>folder(s)</h4>
				</div>
				<div class=" col-sm-4 col-md-4 col-lg-4 hidden-xs">
					<h5>0</h5>
					<h4>Topic(s)</h4>
					<h4>in the forum</h4>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="content">
			<div class="row">

				<div class="col-md-12 col-md-offset-0 col-lg-6 col-lg-offset-0" style="margin-top: -30px;">

					<div class="block" id="vm-block">
						<div class="block-header text-white bg-custom">
							<div class="block-options">
								<li>
									<button id="btn-refresh-vm" type="button"
										data-toggle="block-option">
										<i class="si si-refresh"></i>
									</button>
								</li>
							</div>
							<h3 class="block-title">My virtuals machines</h3>
						</div>
						<div class="block-content">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="text-center"><i class="fa fa-sort-numeric-asc"
											aria-hidden="true"></i></th>
										<th><i class="fa fa-picture-o" aria-hidden="true"></i></th>
										<th>Name</th>
										<th>OS</th>

									</tr>
								</thead>
								<tbody id="table-vm-body">
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-md-12 col-md-offset-0 col-lg-6 col-lg-offset-0" style="margin-top: -30px;">

					<div class="block" id="srv-block">
						<div class="block-header text-white bg-custom">
							<div class="block-options">
								<li>
									<button id="btn-refresh-srv" type="button"
										data-toggle="block-option">
										<i class="si si-refresh"></i>
									</button>
								</li>
							</div>
							<h3 class="block-title">Servers</h3>
						</div>
						<div class="block-content">
							<table class="table table-hover">
								<thead>
									<a href="vm.jsp?srvId=<%=request.getParameter("srvId")%>&idVm=<%=request.getParameter("idVm")%>">
										<tr>
											<th class="text-center" style="width: 50px;">#</th>
											<th class="text-center">Name</th>
											<th id="hidden-sidebar-o" class="text-center" style="width: 30%;">IP</th>
											<th id="hidden-sidebar-o" class="text-center" style="width: 10%;">Port</th>
											<th class="text-center" style="width: 15%;">Use</th>
											<th class="text-center" style="width: 5%;">State</th>
											<th class="text-center" style="width: 5%;">Ping</th>
											<th id="hidden-sidebar-o" class="text-center" style="width: 5%;">Actions</th>
										</tr>
									</a>
								</thead>
								<tbody id="table-srv-body">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
			</div>
		</div>

		<div id="footer_RWB" class="footer navbar-fixed-bottom">
			<div class="pulldown push-30-t text-center animated fadeInUp">
				<small class="text-muted">&copy; Remote Web Box 0.3</small>
			</div>
		</div>
		</main>
	</div>
	<%@ include file="/includes/footer.jsp"%>
	<script type="text/javascript">
		function toogleState(id) {
			$.ajax({
				url : 'BddServlet',
				type : 'POST',
				data : {
					"fn" : "toogleServer",
					"srv" : id
				},
				success : function(data) {
					location.reload();
				},
				error : function(data) {
					alert("Unable to toggle server state");
				}
			});
		}
	</script>
	<script src="assets/js/js-index.js"></script>
</body>
</html>
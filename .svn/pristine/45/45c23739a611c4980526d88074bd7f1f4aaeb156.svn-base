<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rwb.java.bdd.bo.BddServeurBO"%>
<%@ page import="rwb.java.server.bo.ServeurBO"%>
<%@ page import="java.util.List"%>
<%@ page import="rwb.java.proxy.Proxy"%>
<%@ include file="/includes/action/checkSession.jsp"%>
<%
	Proxy prox = new Proxy();
	prox.connectionBDD();
	request.getSession().setAttribute("proxy", prox);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
<!-- MetaData and css import -->
<%@ include file="/includes/head.jsp"%>
</head>

<body>
	<%=request.getSession().getAttribute("login-username")%>
	<div id="page-container"
		class="sidebar-l  side-scroll header-navbar-fixed">

		<%@ include file="/includes/sideBar.jsp"%>
		<%@ include file="/includes/header.jsp"%>
		<!-- Main Container -->
		<main id="main-container">
		<div class="content bg-image overflow-hidden"
			style="background-image: url('assets/img/photos/server.jpeg');">
			<div class="push-50-t push-15">
				<h1 class="h2 text-white animated zoomIn">Profile</h1>
				<h2 class="h5 text-white-op animated zoomIn">
					Welcome
					<%=request.getSession().getAttribute("login-username")%></h2>
			</div>
		</div>
		<div class="logo-background"></div>
		<div id="footer_RWB" class="footer navbar-fixed-bottom">
			<div class="pulldown push-30-t text-center animated fadeInUp">
				<small class="text-muted">&copy; Remote Web Box 0.2</small>
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
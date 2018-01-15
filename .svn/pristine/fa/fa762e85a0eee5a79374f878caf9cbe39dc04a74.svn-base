<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String path3 = "";

	if (request.getSession().getAttribute("path") != null) {
		path3 = (String) request.getSession().getAttribute("path");
	}
%>
<!-- Header -->
<header id="header-navbar" class="content-mini content-mini-full header-1">
	<!-- Header 1 Navigation Left -->
	<div id="header-1">
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
			<ul class="nav-header pull-left">
				<li>
					<button type="submit" class="header-1-text" data-toggle="layout"
						data-action="sidebar_toggle" id="menu-btn">
						<i class="fa fa-align-left" aria-hidden="true"></i>&nbsp;&nbsp;<span
							id="menu-text-header">Menu</span>
					</button>
				</li>
			</ul>
		</div>

		<!-- END Header 1 Navigation Left -->

		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
			<a href="<%=path3%>index.jsp">
				<h5 id="title">Remote Web Box</h5>
			</a>
		</div>

		<!-- Header 1 Navigation Right -->
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
			<ul class="nav-header pull-right">
				<li><a href="<%=path3%>includes/action/endSession.jsp">
						<button type="submit" id="logout-btn" class="header-1-text">
							<i class="fa fa-sign-out fa-lg" aria-hidden="true"></i><span
								id="logout-text">Log out</span>
						</button>
				</a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- END Header 1 Navigation Right -->
</header>
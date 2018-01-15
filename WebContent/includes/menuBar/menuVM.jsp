<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header 2 Navigation Left -->
<%
	String srv = "";
	String vm = "";
	if (request.getParameterMap().containsKey("idVm") & request.getParameterMap().containsKey("srvId")) {
		srv = request.getParameter("srvId");
		vm = request.getParameter("idVm");
	}
%>
<header id="header-navbar" class="content-mini content-mini-full" style="margin-top: 60px;">
	<!-- Header 2 Navigation Left -->
	<div id="header-2">
		<div id="header-2-left-menuVM"
			class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			<ul class="nav-header pull-left">
				<li class="">
					<div class="dropdown">
						<button id="files" class="dropdown-toggle header-2-text"
							type="button" data-toggle="dropdown">
							File<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#" id="start-btn-dropdown"> <i
									class="fa fa-play green" aria-hidden="true"></i>&nbsp;&nbsp;Start
							</a></li>
							<li><a href="#"> <i class="fa fa-pause orange"
									aria-hidden="true"></i>&nbsp;&nbsp;Break
							</a></li>
							<li><a href="#"> <i class="fa fa-circle-o-notch blue"
									aria-hidden="true"></i>&nbsp;&nbsp;Restart
							</a></li>
							<li><a href="#" data-toggle="modal"
								data-target="#stopMachine-modal"><i class="fa fa-stop red"
									aria-hidden="true"></i>&nbsp;&nbsp;Stop</a></li>
							<li class="divider"></li>

							<li><a href="#" onClick="location.reload();"><i
									class="fa fa-refresh" aria-hidden="true"></i>&nbsp;&nbsp;Refresh</a></li>
							<li class="divider"></li>

							<li><a href="#" data-toggle="modal"
								data-target="#deleteMachine-modal"><i
									class="fa fa-trash-o red" aria-hidden="true"></i>&nbsp;&nbsp;Delete</a></li>
						</ul>
					</div>
				</li>
				<li class="">
					<button id="config-btn" type="submit" class="header-2-text"
						data-toggle="modal" data-target="#configureMachine-modal">Settings</button>
				</li>
				<li class="">
					<button id="start-btn" type="submit" class="header-2-text">Start</button>
				</li>
				<li class="">
					<button id="stop-btn" type="button" data-toggle="modal"
						data-target="#stopMachine-modal" class="header-2-text">Stop</button>
				</li>
			</ul>
		</div>
		<!-- Header 2 Navigation Right -->
		<div id="header-2-right-menuVM"
			class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			<ul class="nav-header pull-right">
				<li class="active"></li>
				<li id="detail-btn" class="active-vm-tab">
					<button class="header-2-text">Details</button>
				</li>
				<li id="console-btn" class="">
					<button class="header-2-text">Console</button>
				</li>
				<li id="snapshot-btn" class="">
					<button class="header-2-text">Snapshots</button>
				</li>
			</ul>
		</div>
	</div>
	<!-- END Header 2 Navigation Left -->
	<div class="clearfix"></div>
</header>

<!-- Responsive menuVM right  -->
<div id="page-footer" class="footer navbar-fixed-bottom bg-white"
	style="visibility: collapse;">
	<div id="">
		<ul class="nav-header">
			<li class="active"></li>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="text-align: center;">
				<li id="detail-btn" class="active-vm-tab">
					<button class="header-2-text">Details</button>
				</li>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="text-align: center;">
				<li id="console-btn" class="">
					<button class="header-2-text">Console</button>
				</li>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="text-align: center;">
				<li id="snapshot-btn" class="">
					<button class="header-2-text" style="padding: 0 0 0 0;">Snapchots</button>
				</li>
			</div>
			<div class="clearfix"></div>
		</ul>
	</div>
</div>

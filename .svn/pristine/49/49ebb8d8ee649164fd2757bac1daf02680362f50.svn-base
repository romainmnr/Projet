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
<header id="header-navbar" class="content-mini content-mini-full rr"
	style="margin-top: 58px;">
	<!-- Header 2 Navigation Left -->
	<div id="header-2">
		<div id="header-2-left-menuSRV" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
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
				<li class=" ">
					<button id="newMachine-btn" class="header-2-text"
						data-toggle="modal" data-target="#createMachine-modal"
						type="button">New machine</button>
				</li>
				<!--<li class=" ">
					<button id="config-btn" type="submit" class="header-2-text"
						data-toggle="modal" data-target="#configureServer-modal">Settings</button>
				</li>-->
			</ul>
		</div>
		<!-- END Header 2 Navigation Left -->
	</div>
</header>
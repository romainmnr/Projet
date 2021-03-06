<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>login page</title>
<!-- MetaData and css import -->
<%@ include file="/includes/head.jsp"%>
</head>
<body class="bg-image"
	style="background-image: url('assets/img/photos/photo7@2x.jpg');">
	<!-- Login Content -->
	<div class="pulldown">
		<div class="content overflow-hidden">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-3 col-md-6 col-md-offset-4 col-lg-4 col-lg-offset-7">
		
					<div class="bg-white-o push-50-t push-50 animated fadeIn" style="padding-bottom: 15px;">
						<!-- Login Title -->
						<div class="text-center">
							<img src="assets/logo/RWB_title_grey.svg" alt="logo_grey" id="logo_login" />
						</div>
						<!-- END Login Title -->
						<!-- Login Form -->
						<div style="margin: 5%;">
							<form id="login-form" class="js-validation-login form-horizontal push-30-t" >
								<div class="form-group">
									<div class="col-xs-8 col-lg-12">
										<div class="form-material form-material-primary">
											<input class="form-control" type="text" id="login-username"
												name="login-username" required> <label
												for="login-username">Username</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-8 col-lg-12">
										<div class="form-material form-material-primary ">
											<input class="form-control" type="password"
												id="login-password" name="login-password" required>
											<label for="login-password">Password</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-6">
										<label class="css-input switch switch-sm switch-primary">
											<input type="checkbox" id="login-remember-me"
											name="login-remember-me" value="yes"><span></span>
											Remember me?

										</label>
									</div>
								</div>
								<div class="form-group push-30-t">
									<div class="">
										<!--  <div class="col-md-8" id="forgot_pswd"><h6>Mot de passe oubli&eacute;</h6></div>-->

										<div class="col-xs-6 col-xs-offset-1 col-md-6 col-md-offset-3 text-center">
											<button class="btn" id="log_in_btn" >Log In</button>
										</div>

										<div class="clearfix"></div>
									</div>
								</div>
							</form>
						</div>
						<!-- END Login Form -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/core/jquery.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>
	<script src="assets/js/core/jquery.slimscroll.min.js"></script>
	<script src="assets/js/core/jquery.scrollLock.min.js"></script>
	<script src="assets/js/core/jquery.appear.min.js"></script>
	<script src="assets/js/core/jquery.countTo.min.js"></script>
	<script src="assets/js/core/jquery.placeholder.min.js"></script>
	<script src="assets/js/core/js.cookie.min.js"></script>
	<script src="assets/js/app.js"></script>
	<script src="assets/js/plugins/bootstrap-notify/bootstrap-notify.min.js"></script>
	<script>
	jQuery(function() {
		App.initHelpers(['notify' ]);
	}); 
	</script>
	<script src="assets/js/js-login.js"></script>
	<!-- END Login Content -->
</body>
</html>
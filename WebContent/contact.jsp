<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rwb.java.bdd.bo.BddServeurBO"%>
<%@ page import="rwb.java.server.bo.ServeurBO"%>
<%@ page import="java.util.List"%>

<%@ include file="/includes/action/checkSession.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remote Web Box : Contact</title>
<!-- MetaData and css import -->
<%@ include file="/includes/head.jsp"%>

</head>
<body>
	<div id="page-container"
		class="sidebar-l side-scroll header-navbar-fixed">
		<%@ include file="/includes/sideBar.jsp"%>
		<%@ include file="/includes/header.jsp"%>
		<!-- Main Container -->
		<main id="main-container"> <!-- Page Header -->
		<div class="content bg-gray-lighter">
			<div class="row items-push">
				<div class="col-sm-7">
					<h1 class="page-heading">
						Contacts <small>Remote Web Box Team</small>
					</h1>
				</div>
			</div>
		</div>
		<!-- END Page Header --> <!-- Page Content -->
		<div class="content">
			<div class="bg-image overflow-hidden"
				style="background-image: url('assets/img/photos/desk.png');">
				<div class="bg-black-op">
					<div class="content content-narrow">
						<div class="block block-transparent">
							<div class="block-content block-content-full">
								<h1
									class="h1 font-w300 text-white animated fadeInDown push-50-t push-5">Dashboard</h1>
								<h2 class="h4 font-w300 text-white-op animated fadeInUp">Welcome
									Administrator</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="contact" class="row">
				<div class="col-sm-6 col-md-4 col-lg-3">
					<!-- Contact -->
					<div class="block block-rounded">
						<div class="block-header">
							<div class="block-title">Amine Amenouche</div>
						</div>
						<div
							class="block-content block-content-full bg-primary text-center">
							<img class="img-avatar img-avatar-thumb"
								src="assets/img/avatars/amine.jpg" alt="">
							<div class="font-s13 push-10-t">IT Team Manager</div>
						</div>
						<div class="block-content">
							<div class="text-center push">
								<a href="https://www.linkedin.com/in/amine-ammenouche-255242a5/">
									<i class="fa fa-2x fa-fw fa-linkedin"></i>
								</a>
							</div>
							<table class="table table-borderless table-striped font-s13">
								<tbody>
									<tr>
										<td class="font-w600" style="width: 30%;">Category</td>
										<td>Work</td>
									</tr>
									<tr>
										<td class="font-w600">Email</td>
										<td>amine@rwb.fr</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END Contact -->

				</div>
				<div class="col-sm-6 col-md-4 col-lg-3">
					<!-- Contact -->
					<div class="block block-rounded">
						<div class="block-header">
							<div class="block-title">Morgan Cocherel</div>
						</div>
						<div
							class="block-content block-content-full bg-primary text-center">
							<img class="img-avatar img-avatar-thumb"
								src="assets/img/avatars/morgan.jpg" alt="">
							<div class="font-s13 push-10-t">Design Team Manager</div>
						</div>
						<div class="block-content">
							<div class="text-center push">
								<a href="https://www.linkedin.com/in/morgancocherel/"> <i
									class="fa fa-2x fa-fw fa-linkedin"></i>
								</a>
							</div>
							<table class="table table-borderless table-striped font-s13">
								<tbody>
									<tr>
										<td class="font-w600" style="width: 30%;">Category</td>
										<td>Work</td>
									</tr>
									<tr>
										<td class="font-w600">Email</td>
										<td>morgan@rwb.fr</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END Contact -->

				</div>
				<div class="col-sm-6 col-md-4 col-lg-3">
					<!-- Contact -->
					<div class="block block-rounded">
						<div class="block-header">
							<div class="block-title">Louis MEOT</div>
						</div>
						<div
							class="block-content block-content-full bg-primary text-center">
							<img class="img-avatar img-avatar-thumb"
								src="assets/img/avatars/louis.jpg" alt="">
							<div class="font-s13 push-10-t">Server Team Manager</div>
						</div>
						<div class="block-content">
							<div class="text-center push">
								<a href="https://www.linkedin.com/in/louis-meot-a583a9136/">
									<i class="fa fa-2x fa-fw fa-linkedin"></i>
								</a>
							</div>
							<table class="table table-borderless table-striped font-s13">
								<tbody>
									<tr>
										<td class="font-w600" style="width: 30%;">Category</td>
										<td>Work</td>
									</tr>
									<tr>
										<td class="font-w600">Email</td>
										<td>louis@rwb.fr</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END Contact -->

				</div>
				<div class="col-sm-6 col-md-4 col-lg-3">
					<!-- Contact -->
					<div class="block block-rounded">
						<div class="block-header">
							<div class="block-title">Romain Meunier</div>
						</div>
						<div
							class="block-content block-content-full bg-primary text-center">
							<img class="img-avatar img-avatar-thumb"
								src="assets/img/avatars/romain.jpg" alt="">
							<div class="font-s13 push-10-t">Quality Team Manager</div>
						</div>
						<div class="block-content">
							<div class="text-center push">
								<a href="https://www.linkedin.com/in/romainmnr/"> <i
									class="fa fa-2x fa-fw fa-linkedin"></i>
								</a>
							</div>
							<table class="table table-borderless table-striped font-s13">
								<tbody>
									<tr>
										<td class="font-w600" style="width: 30%;">Category</td>
										<td>Work</td>
									</tr>
									<tr>
										<td class="font-w600">Email</td>
										<td>romain@rwb.fr</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END Contact -->

				</div>

			</div>
			<div class="row">
				<div class="col-sm-6 col-md-4 col-lg-3">
					<!-- Contact -->
					<div class="block block-rounded">
						<div class="block-header">
							<div class="block-title">Maxime Pajotin</div>
						</div>
						<div
							class="block-content block-content-full bg-primary text-center">
							<img class="img-avatar img-avatar-thumb"
								src="assets/img/avatars/maxime.jpg" alt="">
							<div class="font-s13 push-10-t">Scrum Team Manager</div>
						</div>
						<div class="block-content">
							<div class="text-center push">
								<a href="https://www.linkedin.com/in/maxime-pajotin-295899113/">
									<i class="fa fa-2x fa-fw fa-linkedin"></i>
								</a>
							</div>
							<table class="table table-borderless table-striped font-s13">
								<tbody>
									<tr>
										<td class="font-w600" style="width: 30%;">Category</td>
										<td>Work</td>
									</tr>
									<tr>
										<td class="font-w600">Email</td>
										<td>maxime@rwb.fr</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END Contact -->

				</div>
				<div class="col-sm-6 col-md-4 col-lg-3">
					<!-- Contact -->
					<div class="block block-rounded">
						<div class="block-header">
							<div class="block-title">Stephen Perrin</div>
						</div>
						<div
							class="block-content block-content-full bg-primary text-center">
							<img class="img-avatar img-avatar-thumb"
								src="assets/img/avatars/stephen.jpg" alt="">
							<div class="font-s13 push-10-t">Security Team Manager</div>
						</div>
						<div class="block-content">
							<div class="text-center push">
								<a href="https://www.linkedin.com/in/stephen-perrin-101225108/">
									<i class="fa fa-2x fa-linkedin"></i>
								</a>
							</div>
							<table class="table table-borderless table-striped font-s13">
								<tbody>
									<tr>
										<td class="font-w600" style="width: 30%;">Category</td>
										<td>Work</td>
									</tr>
									<tr>
										<td class="font-w600">Email</td>
										<td>stephen@rwb.fr</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END Contact -->

				</div>
				<div class="col-sm-6 col-md-4 col-lg-3">
					<!-- Contact -->
					<div class="block block-rounded">
						<div class="block-header">
							<div class="block-title">Arthur Jimenez</div>
						</div>
						<div
							class="block-content block-content-full bg-primary text-center">
							<img class="img-avatar img-avatar-thumb"
								src="assets/img/avatars/arthur.jpg" alt="">
							<div class="font-s13 push-10-t">Test Team Manager</div>
						</div>
						<div class="block-content">
							<div class="text-center push">
								<a href="javascript:void(0)"> <i
									class="fa fa-2x fa-fw fa-linkedin"></i>
								</a>
							</div>
							<table class="table table-borderless table-striped font-s13">
								<tbody>
									<tr>
										<td class="font-w600" style="width: 30%;">Category</td>
										<td>Work</td>
									</tr>
									<tr>
										<td class="font-w600">Email</td>
										<td>arthur@rwb.fr</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END Contact -->

				</div>
				<div class="col-sm-6 col-md-4 col-lg-3">
					<!-- Contact -->
					<div class="block block-rounded">
						<div class="block-header">
							<div class="block-title">Pascal Steier</div>
						</div>
						<div
							class="block-content block-content-full bg-primary text-center">
							<img class="img-avatar img-avatar-thumb"
								src="assets/img/avatars/pascal.jpg" alt="">
							<div class="font-s13 push-10-t">Technical Team Manager</div>
						</div>
						<div class="block-content">
							<div class="text-center push">
								<a href="https://www.linkedin.com/in/pascal-steier-980123144/">
									<i class="fa fa-2x fa-fw fa-linkedin"></i>
								</a>
							</div>
							<table class="table table-borderless table-striped font-s13">
								<tbody>
									<tr>
										<td class="font-w600" style="width: 30%;">Category</td>
										<td>Work</td>
									</tr>
									<tr>
										<td class="font-w600">Email</td>
										<td>pascal@rwb.fr</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END Contact -->

				</div>

			</div>
			<div class="col-sm-8 col-sm-offset-2" style="padding-bottom:30px;">
				<div class="js-wizard-validation block">
					<ul class="nav nav-tabs nav-tabs-alt nav-justified">
						<li class="active">
							<a href="#simple-step1" data-toggle="tab">1. Personal Informations</a>
						</li>
						<li>
							<a href="#simple-step2" data-toggle="tab">2. Mail</a>
						</li>
					</ul>
					<form class="js-form2 form-horizontal" >
						<div class="block-content tab-content">
							<div class="tab-pane fade in push-30-t push-50 active"
								id="simple-step1">
								<div class="form-group">
									<div class="col-sm-8 col-sm-offset-2">
										<div class="form-material">
											<input class="form-control" id="MailName" name="MailName" placeholder="Please enter your firstname" type="text">
											<label for="MailName">First Name</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-8 col-sm-offset-2">
										<div class="form-material">
											<input class="form-control" id="MailSurname" name="MailSurname" placeholder="Please enter your lastname" type="text">
											<label for="MailSurname">Last Name</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-8 col-sm-offset-2">
										<div class="form-material">
											<input class="form-control" id="MailEmailToAnswer" name="MailEmailToAnswer" placeholder="Please enter your email" type="email"> 
												<label for="MailEmailToAnswer">Email</label>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane fade push-30-t push-50" id="simple-step2">
								<div class="form-group">
									<div class="col-sm-8 col-sm-offset-2">
										<div class="form-material">
											<textarea class="form-control" id="MailText" name="MailText" rows="9" placeholder="Share something about yourself"></textarea>
											<label for="MailText">Content of mail</label>
										</div>

										<div class="col-sm-8 col-sm-offset-2">
											<label class="css-input switch switch-sm switch-primary" for="simple-terms"> 
											<input id="simple-terms" name="simple-terms" type="checkbox"><span></span>
												Agree with the 
												<a data-toggle="modal" data-target="#modal-terms" href="#">terms</a>
											</label>
										</div>

									</div>
								</div>
							</div>

						</div>
						<div class="block-content block-content-mini block-content-full border-t">
                            <div class="row">
                                <div class="col-xs-6">
                                    <button class="wizard-prev btn btn-warning" type="button"><i class="fa fa-arrow-circle-o-left"></i> Previous</button>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <button class="wizard-next btn btn-success" type="button">Next <i class="fa fa-arrow-circle-o-right"></i></button>
                                    <button class="wizard-finish btn btn-primary" type="submit"><i class="fa fa-check-circle-o"></i> Submit</button>
                                </div>
                            </div>
                        </div>
					</form>
				</div>
			</div>
		</div>

		<!-- END Page Content --> </main>
		<!-- END Main Container -->


		<!-- END Footer -->
	</div>
	<%@ include file="/includes/footer.jsp"%>
	<script src="<%= path2 %>assets/js/js-contact.js"></script>
	
	<!-- END Page Container -->

</body>
</html>
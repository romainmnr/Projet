<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="rwb.java.bdd.bo.BddServeurBO"%>
<%@ page import="rwb.java.server.bo.ServeurBO"%>
<%@ page import="java.util.List"%>
<%@ page import="rwb.java.proxy.Proxy"%>
<%@ include file="/includes/action/checkSession.jsp"%>
<%
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RWB : User manager</title>
<!-- MetaData and css import -->
<%@ include file="/includes/head.jsp"%>

</head>
<body>

	<div id="page-container" class="sidebar-l  side-scroll header-navbar-fixed">

		<%@ include file="/includes/sideBar.jsp"%>
		<%@ include file="/includes/header.jsp"%>
		<!-- Main Container -->
		<main id="main-container">
			<div class="content bg-image overflow-hidden" style="background-image: url('assets/img/photos/photo10@2x.jpg'); padding-top: 100px">
				<div class="push-50-t push-15">
					<h1 class="h2 text-white animated zoomIn">User manager</h1>
				</div>
			</div> 
			<div class="content">
				<div class="row">
					<div class="block">
						<ul class="nav nav-tabs nav-tabs-alt nav-justified bg-grey" data-toggle="tabs">
							<li class="active">
								<a href="#usersList" class="custom-tab" >Users list</a>
							</li>
							<li class="">
								<a href="#groupsList" class="custom-tab">Groups list</a>
							</li>
							<li class="">
								<a href="#management" class="custom-tab">Management</a>
							</li>
						
						</ul>
						<div class="block-content tab-content bg-grey">
						
			
							<div class="tab-pane fade push-30-t push-50 active in" id="usersList">
							
								<div class="block">
								    <div class="block-header">
								        <h3 class="block-title">List of users</h3>
								    </div>
								    <div class="block-content">
								        <!-- DataTables init on table by adding .js-dataTable-full class, functionality initialized in js/pages/base_tables_datatables.js -->
								        <table class="table table-bordered table-striped js-dataTable-full">
								            <thead>
								                <tr>
								                    <th class="text-center"><i class="fa fa-sort-numeric-asc" aria-hidden="true"></i></th> 
								                    <th>Name</th>
								                    <th>Firstnam</th>
								                    <th>Grade</th> 
								                    
								                </tr>
								            </thead>
								            <tbody>
								            <%//int idxMachine=1; for(MachineBO m: prox.getListMachine()){ %>
								                <tr>
								                    <td class="text-center">1</td>
								                    <td class="font-w600">DUPOND</td>
								                    <td> Jean</td>
								                    <td>I2</td> 
								                   
								                </tr>
								                <tr>
								                    <td class="text-center">1</td>
								                    <td class="font-w600">DUPOND</td>
								                    <td> Jean</td>
								                    <td>I2</td> 
								                   
								                </tr>
								         <% //idxMachine++; } %>
								            </tbody>
								        </table>
								    </div>
								</div>
							
							</div>
							<div class="tab-pane fade push-30-t push-50 " id="groupsList">
								<div class="block">
								    <div class="block-header">
								        <h3 class="block-title">List of groups</h3>
								    </div>
								    <div class="block-content">
								        <!-- DataTables init on table by adding .js-dataTable-full class, functionality initialized in js/pages/base_tables_datatables.js -->
								        <table class="table table-bordered table-striped js-dataTable-full">
								            <thead>
								                <tr>
								                    <th class="text-center"><i class="fa fa-sort-numeric-asc" aria-hidden="true"></i></th> 
								                    <th>Group name</th>
								                    <th>Number of person</th>
								                    <th>Actions</th> 
								                    
								                </tr>
								            </thead>
								            <tbody>
								            <%//int idxMachine=1; for(MachineBO m: prox.getListMachine()){ %>
								                <tr>
								                    <td class="text-center">1</td>
								                    <td class="font-w600">DIS-CC2</td>
								                    <td> 8</td>
								                    <td>x</td> 
								                   
								                </tr>
								              
								         <% //idxMachine++; } %>
								            </tbody>
								        </table>
								    </div>
								</div>
							
							
							</div>
							<div class="tab-pane fade push-30-t push-50 " id="management">
							
							Permissions
							
							</div>
						
						</div>
					</div>
				</div>
			</div>

		</main>
	</div>
	<%@ include file="/includes/footer.jsp"%>

</body>
</html>
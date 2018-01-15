<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ include file="/includes/action/checkSession.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remote Web Box : Forum</title>
<%
	request.getSession().setAttribute("path", "../");
%>
<!-- FOOOOOOOOOOOORUMMMMM -->
<%!int totaldesmessages = 0;%>
<%!int categorie;%>
<!-- /FOOOOOOOOOOOORUMMMMM -->

<!-- MetaData and css import -->
<%@ include file="../includes/head.jsp"%>

</head>
<body>

	<div id="page-container"
		class="sidebar-l  side-scroll header-navbar-fixed">

		<%@ include file="../includes/sideBar.jsp"%>
		<%@ include file="../includes/header.jsp"%>
		<!-- Main Container -->
		<main id="main-container"> <!-- Page Content -->
		<div class="content content-narrow">
			<!-- Breadcrumb -->
			<ol class="breadcrumb push-15">
				<!-- <li><a class="text-muted" href="base_pages_forum_categories.html">Forums</a></li>
                        <li><a class="link-effect" href="base_pages_forum_topics.html">Introduction</a></li>-->
				<li><a class="text-muted" href="./Final.jsp">Forums</a></li>
			</ol>
			<!-- END Breadcrumb -->

			<!-- Topics Block -->
			<div class="block">
				<div class="block-header bg-gray-lighter">
					<ul class="block-options">
						<li>
							<button type="button" data-toggle="block-option"
								data-action="fullscreen_toggle"></button>
						</li>
						<li>
							<button type="button" data-toggle="block-option"
								data-action="refresh_toggle" data-action-mode="demo">
								<i class="si si-refresh"></i>
							</button>
						</li>
					</ul>
				</div>
				<div class="block-content">
					<!-- Topics -->
					<table class="table table-striped table-borderless table-vcenter">
						<thead>
							<tr>
								<th colspan="2">Welcome</th>
							</tr>
						</thead>
						<tbody>
							<%
								// Declare JDBC objects outside the "try" block
								try {
									Class.forName("com.mysql.jdbc.Driver");
									DriverManager.registerDriver(new com.mysql.jdbc.Driver());
									Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox",
											"ProjetCC");
									ResultSet rset = null;
									Statement stmt = con.createStatement();
											if(stmt.execute("SELECT cat_id, cat_name,forum_forum.forum_id, forum_name,"
													+ " forum_desc, forum_post, forum_topic, forum_topic.topic_id,  forum_topic.topic_post, post_id, post_time,"
													+ " post_writer, username,idUser FROM forum_category"
													+ " LEFT JOIN forum_forum ON forum_category.cat_id = forum_forum.forum_cat_id"
													+ " LEFT JOIN forum_post ON forum_post.post_id = forum_forum.forum_last_post_id"
													+ " LEFT JOIN forum_topic ON forum_topic.topic_id = forum_post.topic_id"
													+ " LEFT JOIN RemoteWebBox_Users ON RemoteWebBox_Users.idUser = forum_post.post_writer"
													+ " ORDER BY cat_order, forum_order DESC")){
												rset = stmt.getResultSet();
											}else{
												rset = null;
											}

									int forum_id=0;
									String cat_nom=null;
									int cat_id=0;
									String forum_name=null;
									String forum_desc=null;
									int forum_topic=0;
									int forum_post=0;
									int topic_post=0;
									String post_time=null;
									int membre_id=0;
									String membre_pseudo=null;
									int topic_id=0;
									int post_id=0;

									while (rset.next()) {
										//for (int i = 0; i < 10; i++) {
										//request.getSession().setAttribute("result",rset.getString("cat_id"));
										cat_id = rset.getInt("cat_id");
										cat_nom = rset.getString("cat_name");
										//request.getSession().setAttribute("forum_id",rset.getString("forum_id"));
										forum_id = rset.getInt("forum_id");
										forum_name = rset.getString("forum_name");
										forum_desc = rset.getString("forum_desc");
										forum_topic = rset.getInt("forum_topic");
										forum_post = rset.getInt("forum_post");
										topic_post = rset.getInt("topic_post");
										post_time = rset.getString("post_time");
										membre_pseudo = rset.getString("username");
										membre_id = rset.getInt("idUser");
										topic_id = rset.getInt("topic_id");
										post_id = rset.getInt("post_id");
										//}
										if (categorie != cat_id) {
											categorie = cat_id;
							%>
							<tr>
								<th class="titre"><strong> <%=
										cat_nom
 %>
								</strong></th>
								<th class="nombremessages"><strong>Topics</strong></th>
								<th class="nombresujets"><strong>Messages</strong></th>
								<th class="derniermessage"><strong>Last message</strong></th>
							</tr>

							<%
								}

							%>

							<tr>
								<td class="titre"><strong> <a
										href="./voirForum.jsp?f=<%=forum_id%>"> <%=forum_name %>
									</a></strong> <br /><%=forum_desc %></td>
								<td class="nombresujets"><%=forum_topic	%>
								</td>
								<td class="nombremessages"><%=forum_post%>
								</td>
								<%
									int nombreDeMessagesParPage = 0;
									int nbr_post = 0;
									int nbpage = 0;

									
									if (forum_post != 0) {
												//Selection dernier message
												nombreDeMessagesParPage = 15;
												nbr_post = topic_post + 1;
												nbpage = Math.round(nbr_post / nombreDeMessagesParPage);%>

								<td class="derniermessage"><%=post_time%><br /><%=membre_pseudo%>
								<a href="./voirForum.jsp?t='<%=topic_id%>'&amp;page='<%=page%>'<%=post_id%>'"></a>
								</td>

								<%
									} else {
								%>
								<td class="nombremessages">Pas de message</td>
							</tr>
							<%
								}

										//Cette variable stock le nombre de messages, on la met à jour
										totaldesmessages += forum_post;

										//On ferme notre boucle et nos balises
									} //fin de la boucle

									
									rset.close();
									//prepStmt.close();
									stmt.close();
								} catch (SQLException e) {
									System.out.println(e);
								}
							%>
						
					</table>
				</div>

				
				</tbody>
				<!-- END Topics -->
			</div>
		</div>
		<!-- END Topics Block -->
	</div>
	<!-- END Page Content -->
	</main>
	<!-- END Main Container -->
	<%@ include file="../includes/footer.jsp"%>
	<script src="../assets/js/js-sidebar.js"></script>

</body>
</html>
<%
	request.getSession().removeAttribute("path");
%>

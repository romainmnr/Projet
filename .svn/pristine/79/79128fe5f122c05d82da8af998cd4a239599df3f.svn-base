<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ include file="/includes/action/checkSession.jsp"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Voir un topic</title>
<%
request.getSession().setAttribute("path", "../");
%>
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
				<li><a class="text-muted" href="./voirForum.jsp">Forums</a></li>

				
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

					




<% 
int forum = 0;
if (request.getParameter("f")!=null){
	forum=Integer.parseInt(request.getParameter("f"));
}

String forum_name = null;
if (request.getParameter("n")!=null){
	forum_name=request.getParameter("n");
}
//$titre="Voir un sujet";

int topic = 0;
if (request.getParameter("t")!=null){
	topic=Integer.parseInt(request.getParameter("t"));
}
int totalDesMessages = 0;
int nombreDeMessagesParPage = 0;
int nombreDePages =0;
String topic_titre=null;

try {
Class.forName("com.mysql.jdbc.Driver");
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
PreparedStatement prepStmt = con.prepareStatement("SELECT topic_title, topic_post, forum_topic.forum_id, topic_last_post,"
		+" forum_name"
		+" FROM forum_topic"
		+" LEFT JOIN forum_forum ON forum_topic.forum_id = forum_forum.forum_id"
		+" WHERE topic_id = ?");
		//+" LIMIT ?,?");
prepStmt.setInt(1,topic);
//prepStmt2.setInt(2,premierMessageAafficher);
//prepStmt2.setInt(3,nombreDeMessagesParPage);
ResultSet rset = null;
prepStmt.execute();
rset = prepStmt.getResultSet();

while (rset.next()) {
	totalDesMessages = rset.getInt("topic_post") + 1;
	nombreDeMessagesParPage = 15;
	topic_titre= rset.getString("topic_title");
	nombreDePages = Math.round(totalDesMessages / nombreDeMessagesParPage);
}
rset.close();
prepStmt.close();
} catch (SQLException e) {
System.out.println(e);
}

%>
<p><a href="./Final.jsp">Forum -</a>
<a href="./voirForum.jsp?f=<%=forum%>"><%=forum_name%></a>
<h1><%=topic_titre%></h1><br /><br />

<a href="./NewTopic.jsp?t=<%=topic%>&amp;f=<%=forum%>&amp;action=post">Answer to this topic&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>

<a href="./NewTopic.jsp?f=<%=forum%>&amp;action=creation">Post a new topic</a>


<% 
try {
Class.forName("com.mysql.jdbc.Driver");
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
PreparedStatement prepStmt2 = con2.prepareStatement("SELECT post_id , post_writer , post_text , post_time ,"
		+" idUser, username, member_posts"
		+" FROM forum_post"
		+" LEFT JOIN RemoteWebBox_Users ON RemoteWebBox_Users.idUser = forum_post.post_writer"
		+" WHERE topic_id =?"
		+" ORDER BY post_id");
		//+" LIMIT ?,?");
prepStmt2.setInt(1,topic);
//prepStmt2.setInt(2,premierMessageAafficher);
//prepStmt2.setInt(3,nombreDeMessagesParPage);
ResultSet rset2 = null;
prepStmt2.execute();
rset2 = prepStmt2.getResultSet();

int membre_id=0;
String membre_pseudo=null;
String post_time=null;
int post_createur=0;
int post_id=0;
int membre_post=0;
String post_texte=null;

while (rset2.next()) {
	membre_id = rset2.getInt("idUser"); 
	membre_pseudo =	rset2.getString("username");
	post_time = rset2.getString("post_time");
	post_id = rset2.getInt("post_id");
	post_createur = rset2.getInt("post_writer");
	membre_post = rset2.getInt("member_posts");
	post_texte =	rset2.getString("post_text");
	%>
	 <table>
     <tr>
     <th class="vt_auteur"><strong>Author&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></th>             
     <th class="vt_mess"><strong>Message&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></th>       
     </tr>
     
     
         <tr><td><%=membre_pseudo%></td>
         <td id=p_<%=post_id%>>(Posted the <%=post_time%>)
         <a href="./NewTopic.jsp?p=<%=post_id%>&amp;action=edit&amp;t=<%=topic%>&amp;f=<%=forum%>">Edit</a>
         <a href="./NewTopic.jsp?p=<%=post_id%>&amp;action=delete&amp;t=<%=topic%>&amp;f=<%=forum%>">Delete</a></td></tr>

         <tr><td>(<%=membre_post%> posts)<br /></td>
         <td><%=post_texte%></td></tr><br />


</table>
     
     
<%
}
rset2.close();
prepStmt2.close();
} catch (SQLException e) {
System.out.println(e);
}

try {
Class.forName("com.mysql.jdbc.Driver");
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
PreparedStatement prepStmt3 = con3.prepareStatement("UPDATE forum_topic"
        +" SET topic_view = topic_view + 1 WHERE topic_id = ?");
prepStmt3.setInt(1,topic);
prepStmt3.execute();
prepStmt3.close();
} catch (SQLException e) {
System.out.println(e);
}


%>

<!--  <img src="./images/nouveau.gif" alt="Nouveau topic" title="Poster un nouveau topic" /></a>-->


				</tbody>
				</table>
				<!-- END Topics -->
			</div>
		</div>
		<!-- END Topics Block -->
	</div>
	<!-- END Page Content -->
	</main>
	<!-- END Main Container -->
	</div>
	<%@ include file="../includes/footer.jsp"%>
	<script src="../assets/js/js-sidebar.js"></script>

</body>
</html>
<%
	request.getSession().removeAttribute("path");
%>
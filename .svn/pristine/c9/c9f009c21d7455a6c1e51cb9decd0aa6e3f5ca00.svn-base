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
<title>Voir un forum</title>
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

						<tbody>


<% int forum = 0;
if (request.getParameter("f")!=null){
	forum=Integer.parseInt(request.getParameter("f"));
}
int forum_topic=0;
String forum_name=null;
try {
Class.forName("com.mysql.jdbc.Driver");
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
PreparedStatement prepStmt = con.prepareStatement("SELECT forum_name, forum_topic FROM forum_forum WHERE forum_id = ?");
prepStmt.setString(1,Integer.toString(forum));
ResultSet rset = null;
prepStmt.execute();
rset = prepStmt.getResultSet();


while (rset.next()) {
	forum_topic = rset.getInt("forum_topic");
	forum_name = rset.getString("forum_name");
}
rset.close();
prepStmt.close();
} catch (SQLException e) {
System.out.println(e);
}
int totalDesMessages = forum_topic + 1;
int nombreDeMessagesParPage = 25;
int nombreDePages = Math.round(totalDesMessages / nombreDeMessagesParPage);

%>


<p><a href="./Final.jsp">Forum index</a>



<%
int premierMessageAafficher = 1;
%>

<h1><%=forum_name%></h1><br /><br />
<a href="./NewTopic.jsp?f=<%=forum%>"></a>
<li><a class="link-effect" href="./NewTopic.jsp?f=<%=forum%>&amp;action=creation"> New Topic</a></li>

<%
try {
Class.forName("com.mysql.jdbc.Driver");
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
PreparedStatement prepStmt2 = con2.prepareStatement("SELECT forum_topic.topic_id, topic_title, topic_writer, topic_view, topic_post, topic_time, topic_last_post,"
		+" Mb.username AS member_pseudo_writer, post_id, post_writer, post_time, Ma.username AS member_pseudo_last_writer FROM forum_topic"
		+" LEFT JOIN RemoteWebBox_Users Mb ON Mb.idUser = forum_topic.topic_writer"
		+" LEFT JOIN forum_post ON forum_topic.topic_last_post = forum_post.post_id"
		+" LEFT JOIN RemoteWebBox_Users Ma ON Ma.idUser = forum_post.post_writer"
		+" WHERE forum_topic.forum_id =?"
		+" ORDER BY topic_last_post DESC");
		//+" LIMIT ?,?");
prepStmt2.setInt(1,forum);
//prepStmt2.setInt(2,premierMessageAafficher);
//prepStmt2.setInt(3,nombreDeMessagesParPage);
ResultSet rset2 = null;
prepStmt2.execute();
rset2 = prepStmt2.getResultSet();
int topic_vu=0;
String topic_time=null;
String topic_titre=null;
int topic_post=0;
int topic_createur=0;
String membre_pseudo_createur=null;
String membre_pseudo_last_posteur=null;
int topic_id=0;
int post_id=0;
String post_time=null;
int post_createur=0;
       
while (rset2.next()) {
	topic_vu= rset2.getInt("topic_view");
	topic_time= rset2.getString("topic_time");
	topic_titre= rset2.getString("topic_title");
	topic_post= rset2.getInt("topic_post");
	topic_createur= rset2.getInt("topic_writer");
	membre_pseudo_createur= rset2.getString("member_pseudo_writer");
	membre_pseudo_last_posteur= rset2.getString("member_pseudo_last_writer");
	topic_id= rset2.getInt("topic_id");
	post_id= rset2.getInt("post_id");
	post_time= rset2.getString("post_time");
	post_createur=rset2.getInt("post_writer");
	%>
                <table>
        <tr>
        <!--<th><img src="./images/message.gif" alt="Message" /></th>-->
        <th class="titre"><strong>Title</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>             
        <th class="nombremessages"><strong>Answers</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
        <th class="nombrevu"><strong>Vues</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
        <th class="auteur"><strong>Author</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>                       
        <th class="derniermessage"><strong>Last message</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
        </tr>
                <tr>

                <td class="titre">
                <strong><a href="./voirTopic.jsp?t=<%=topic_id%>&amp;f=<%=forum%>&amp;n=<%=forum_name%>"                 
                title="Topic started at
                <%=topic_time%>">
                <%=topic_titre%></a></strong></td>

                <td class="nombremessages"><%=topic_post%></td>

                <td class="nombrevu"><%=topic_vu%></td>

                <td><%=membre_pseudo_createur%></td>

             <%  	//Selection dernier message
		int nombreDeMessagesParPage2 = 15;
		int nbr_post2 = topic_post +1;
		int nombreDePages2 = Math.round(nbr_post2 / nombreDeMessagesParPage);%>

                <td class="derniermessage">From
                <%=membre_pseudo_last_posteur%><br />
                Posted the <%=post_time%></td></tr>

        </table><br />
        <%
}
rset2.close();
//prepStmt.close();
prepStmt2.close();

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
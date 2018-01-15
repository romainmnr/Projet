<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
 
<%@ include file="/includes/action/checkSession.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Remote Web Box : Forum</title>
		<% request.getSession().setAttribute("path", "../"); %>
		<!-- MetaData and css import -->
		<%@ include file="../includes/head.jsp"%>

	</head>
<body>

	<div id="page-container" class="sidebar-l  side-scroll header-navbar-fixed">

		<%@ include file="../includes/sideBar.jsp"%>
		<%@ include file="../includes/header.jsp"%>

            <!-- Main Container -->
            <main id="main-container">
                <!-- Page Content -->
                <div class="content content-narrow">
                    <!-- Breadcrumb -->
                    <ol class="breadcrumb push-15">
                        <li><a class="text-muted" href="./Final.jsp">Forums</a></li>
                    </ol>
                    <!-- END Breadcrumb -->

                    <!-- New Topic -->
                    <div class="block">
                        <div class="block-header bg-gray-lighter">
                            <ul class="block-options">
                                <li>
                                    <button type="button" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                                </li>
                                <li>
                                    <button type="button" data-toggle="block-option" data-action="refresh_toggle" data-action-mode="demo"><i class="si si-refresh"></i></button>
                                </li>
                            </ul>
                        </div>
                      <div class="block-content">
					<!-- Topics -->
					<table class="table table-striped table-borderless table-vcenter">

						<tbody>
		<% 
int author_id = 0;
int nouveautopic=0;
int nouveaupost=0;
		
String topic_title = null;
if (request.getParameter("topic-title")!=null){
	topic_title=request.getParameter("topic-title");
}
Date dateToday = new java.util.Date();
DateFormat topic_dateEN = DateFormat.getDateTimeInstance(DateFormat.SHORT,DateFormat.SHORT, new Locale("EN","en"));
String topic_date=topic_dateEN.format(dateToday);

String topic_author = null;
if (request.getSession().getAttribute("login-username")!=null){
	topic_author=request.getSession().getAttribute("login-username").toString();
}
String topic_messsage = null;
if (request.getParameter("topic-messsage")!=null){
	topic_messsage=request.getParameter("topic-messsage");
}
int topic_id = 0;
int forum = 0;
int post_id=0;
String topicCases = request.getParameter("action");
switch(topicCases){
	case "creation":
	if (request.getParameter("f")!=null){
		forum=Integer.parseInt(request.getParameter("f"));
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
			PreparedStatement prepStmt = con.prepareStatement("SELECT idUser FROM RemoteWebBox_Users WHERE username = ?");
			prepStmt.setString(1,topic_author);
			ResultSet rset = null;
			prepStmt.execute();
			rset = prepStmt.getResultSet();

			while (rset.next()) {
				author_id = rset.getInt("idUser");
			}
			rset.close();
			prepStmt.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
			
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
			PreparedStatement prepStmt2 = con2.prepareStatement("INSERT INTO forum_topic"
		            +" (forum_id, topic_title, topic_writer, topic_view, topic_time)"
		            +" VALUES(?,?,?,1,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			prepStmt2.setInt(1,forum);
			prepStmt2.setString(2,topic_title);
			prepStmt2.setInt(3,author_id);
			prepStmt2.setString(4,topic_date);
			ResultSet rset2 = null;
			prepStmt2.execute();
			//rset = prepStmt.;
			rset2=prepStmt2.getGeneratedKeys();
			while (rset2.next()) {
				nouveautopic=rset2.getInt(1);
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
			PreparedStatement prepStmt3 = con3.prepareStatement("INSERT INTO forum_post"
		            +" (post_writer, post_text, post_time, topic_id, post_forum_id)"
		            +" VALUES (?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			prepStmt3.setInt(1,author_id);
			prepStmt3.setString(2,topic_messsage);
			prepStmt3.setString(3,topic_date);
			prepStmt3.setInt(4,nouveautopic);
			prepStmt3.setInt(5,forum);
			ResultSet rset3 = null;
			prepStmt3.execute();
			//rset = prepStmt.;
			rset3=prepStmt3.getGeneratedKeys();
			while (rset3.next()) {
				nouveaupost=rset3.getInt(1);
			}
			rset3.close();
			prepStmt3.close();
			} catch (SQLException e) {
				System.out.println(e);
			}

		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
			PreparedStatement prepStmt4 = con4.prepareStatement("UPDATE forum_topic"
		            +" SET topic_last_post = ?,"
		            +" topic_first_post = ?"
		            +" WHERE topic_id = ?");
			prepStmt4.setInt(1,nouveaupost);
			prepStmt4.setInt(2,nouveaupost);
			prepStmt4.setInt(3,nouveautopic);
			prepStmt4.execute();
			prepStmt4.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
			PreparedStatement prepStmt5 = con5.prepareStatement("UPDATE forum_forum SET forum_post = forum_post + 1 ,forum_topic = forum_topic + 1," 
		            +" forum_last_post_id = ?"
		            +" WHERE forum_id = ?");
			prepStmt5.setInt(1,nouveaupost);
			prepStmt5.setInt(2,forum);
			prepStmt5.execute();
			prepStmt5.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection con6 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
			PreparedStatement prepStmt6 = con6.prepareStatement("UPDATE RemoteWebBox_Users SET member_posts = member_posts + 1 WHERE idUser = ?");
			prepStmt6.setInt(1,author_id);
			prepStmt6.execute();
			prepStmt6.close();
			} catch (SQLException e) {
				System.out.println(e);
			}%>
		<a class="link-effect" href="./voirForum.jsp?f=<%=forum%>">TOPIC SUCCESSFULLY CREATED</a><%
		}
		break;
	case"post" : 
		if (request.getParameter("t")!=null){
			topic_id=Integer.parseInt(request.getParameter("t"));
			if (request.getParameter("f")!=null){
				forum=Integer.parseInt(request.getParameter("f"));
				
				try {
					Class.forName("com.mysql.jdbc.Driver");
					DriverManager.registerDriver(new com.mysql.jdbc.Driver());
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
					PreparedStatement prepStmt = con.prepareStatement("SELECT idUser FROM RemoteWebBox_Users WHERE username = ?");
					prepStmt.setString(1,topic_author);
					ResultSet rset = null;
					prepStmt.execute();
					rset = prepStmt.getResultSet();

					while (rset.next()) {
						author_id = rset.getInt("idUser");
					}
					rset.close();
					prepStmt.close();
					} catch (SQLException e) {
						System.out.println(e);
					}
				
				try {
				
					Class.forName("com.mysql.jdbc.Driver");
					DriverManager.registerDriver(new com.mysql.jdbc.Driver());
					Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
					PreparedStatement prepStmt2 = con2.prepareStatement("INSERT INTO forum_post"
			            +" (post_writer, post_text, post_time, topic_id, post_forum_id)"
			            +" VALUES (?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
					prepStmt2.setInt(1,author_id);
					prepStmt2.setString(2,topic_messsage);
					prepStmt2.setString(3,topic_date);
					prepStmt2.setInt(4,topic_id);
					prepStmt2.setInt(5,forum);
					ResultSet rset2 = null;
					prepStmt2.execute();
					//rset = prepStmt.;
					rset2=prepStmt2.getGeneratedKeys();
					while (rset2.next()) {
						nouveaupost=rset2.getInt(1);
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
			            +" SET topic_post = topic_post+1,"
			            +" topic_last_post = ?"
			            +" WHERE topic_id = ?");
					prepStmt3.setInt(1,nouveaupost);
					prepStmt3.setInt(2,topic_id);
					prepStmt3.execute();
					prepStmt3.close();
					} catch (SQLException e) {
						System.out.println(e);
					}
			
				try {
					Class.forName("com.mysql.jdbc.Driver");
					DriverManager.registerDriver(new com.mysql.jdbc.Driver());
					Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
					PreparedStatement prepStmt4 = con4.prepareStatement("UPDATE forum_forum SET forum_post = forum_post + 1," 
			            +" forum_last_post_id = ?"
			            +" WHERE forum_id = ?");
					prepStmt4.setInt(1,nouveaupost);
					prepStmt4.setInt(2,forum);
					prepStmt4.execute();
					prepStmt4.close();
					} catch (SQLException e) {
						System.out.println(e);
					}
			
				try {
					Class.forName("com.mysql.jdbc.Driver");
					DriverManager.registerDriver(new com.mysql.jdbc.Driver());
					Connection con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
					PreparedStatement prepStmt5 = con5.prepareStatement("UPDATE RemoteWebBox_Users SET member_posts = member_posts + 1 WHERE idUser = ?");
					prepStmt5.setInt(1,author_id);
					prepStmt5.execute();
					prepStmt5.close();
					} catch (SQLException e) {
						System.out.println(e);
					}
			%>
			<a class="link-effect" href="./voirForum.jsp?f=<%=forum%>">SUCCESSFULLY ANSWERED</a><%
				}
			}
		break;

	case "edit": 
		if (request.getParameter("p")!=null){
			post_id=Integer.parseInt(request.getParameter("p"));
			if (request.getParameter("t")!=null){
				topic_id=Integer.parseInt(request.getParameter("t"));
				if (request.getParameter("f")!=null){
					forum=Integer.parseInt(request.getParameter("f"));
					try {
						Class.forName("com.mysql.jdbc.Driver");
						DriverManager.registerDriver(new com.mysql.jdbc.Driver());
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/RemoteWebBox", "RemoteWebBox","ProjetCC");
						PreparedStatement prepStmt = con.prepareStatement("UPDATE forum_post SET post_text =  ? WHERE post_id = ?");
						prepStmt.setString(1,topic_messsage);
						prepStmt.setInt(2,post_id);
						prepStmt.execute();
						prepStmt.close();
						} catch (SQLException e) {
							System.out.println(e);
						}
					
					%>
					<a class="link-effect" href="./voirForum.jsp?f=<%=forum%>">SUCCESSFULLY EDITED</a><%
					
				}
			}
		}
		break;
}

%>
				</tbody>
				</table>
				<!-- END Topics -->
			</div>
		</div>
		<!-- END Topics Block -->
	</div>
	<!-- END Page Content -->
	</main>
	</div>
	<%@ include file="../includes/footer.jsp"%>

</body>
</html>
<%  request.getSession().removeAttribute("path"); %>
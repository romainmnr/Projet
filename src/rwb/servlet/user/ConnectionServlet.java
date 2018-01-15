package rwb.servlet.user;

import java.io.IOException; 
import java.net.URLEncoder; 
import java.util.HashMap;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.directory.api.ldap.model.exception.LdapException;

import com.google.gson.Gson;

import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.divers.AES;
import rwb.java.divers.Log;
import rwb.java.ldap.MainLdap;
 

/**
 * Servlet implementation class ConnectionServlet
 */
@WebServlet("/ConnectionServlet")
public class ConnectionServlet extends HttpServlet {

	/**
	 * Attributes of class ConnectionServlet
	 */
	private static final long serialVersionUID = 1L;


	/**
	 * Constants of class class ConnectionServlet
	 */
	private static final String LOGIN_USERNAME = "login-username";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConnectionServlet() {
		//default
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {



		BddServeurBO bddBo = new BddServeurBO(); 
		Boolean error = false;
		String msgError = "";
				
		HttpSession session = request.getSession();
		
		//initialisation of the varaibles
		String userName = null;
		String userPassword = null;
		String mail = null;
		String userRights = "admin"; //LDAP
		

		if(request.getAttribute("login-autoLoggin") != null){
			userName = (String)request.getAttribute(LOGIN_USERNAME);
			userPassword = (String)request.getAttribute("login-password");
		}else{
			userName = (String)request.getParameter(LOGIN_USERNAME);
			userPassword = (String)request.getParameter("login-password");
		}
		
		//LDAP ------------------------
		//gets the rights of the userName
		MainLdap testmain = new MainLdap(); 
		try {
			userRights=testmain.getUserRights(userName);
			//testmain.AddUserLdap("lolipop","referent");
			//test to show rights
			Log.info(userName);
			Log.info(testmain.getUserRights(userName));
		} catch (LdapException e) {
			error = true;
			msgError = "LDAP Exception";
			Log.warning(e.getMessage());
		} catch (NamingException e) {
			error = true;
			msgError = "LDAP Exception";
			Log.warning(e.getMessage());
		}
		//END LDAP ---------------------

		String[] result = bddBo.getUser(userName, userPassword);

		if (result[0] != null){	
			userName = result[1];
			mail = result[2];
			userPassword = result[3];
			//set the attributes in the session
			session.setAttribute("login-id",result[0]);
			session.setAttribute(LOGIN_USERNAME,userName);
			session.setAttribute("login-mail",mail); 
			session.setAttribute("login-rights", userRights); 
			//cookie creation
			if(request.getParameter("login-remember-me") != null){  
					/* cookie format : username@#password */
					String value = "";
					value += userName;
					value += "@#";
					value += userPassword; 
					//value hash
					value = AES.encrypt(value, "@RwBAuthEncrypt#"); 
			
					Cookie myCookie = new Cookie("RwbAuthCookie", URLEncoder.encode(value, "UTF-8"));
					response.addCookie(myCookie);
				 
			}

			 
		

		}else{//case user not valid
			session.invalidate(); 
			error = true;
			msgError = "Invalid user";
		}


		bddBo.close();
		
		/**
		 * Response parse
		 */

		HashMap<String, Object> resp = new HashMap<>();
		HashMap<String, Object> header = new HashMap<>();
		if (error) {
			header.put("statut", "503");
			header.put("msg", "Login failed");
		} else {
			header.put("statut", "200");
			header.put("msg", "login ok ");
		}
	
		HashMap<String, Object> data = new HashMap<>();
		data.put("msg", msgError);
		resp.put("header", header);
		resp.put("data", data);

		Gson gson = new Gson();
		String json = gson.toJson(resp);

		response.setStatus(HttpServletResponse.SC_OK); 
		response.getWriter().write(json);

	}

}

package rwb.servlet.general;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rwb.java.divers.HashmapBO;
import rwb.java.divers.Log;

/**
 * Servlet implementation class Session
 */
@WebServlet("/Session")
public class Session extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Session() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = (String) request.getParameter("param");
		HashMap<String,Object> resp = new HashMap<>();
		HashMap<String,Object> header = new HashMap<>();
		HashmapBO mapbo = new HashmapBO();
		HashMap<String,Object> result = new HashMap<>();
		
		
		try{
			if ("mapMachine".equals(param)){
				mapbo = (HashmapBO) request.getSession().getAttribute(param);
				result = (HashMap<String,Object>)mapbo.getNetwork();
			}
			
			header.put("status", "200");
		}catch(Exception e){
			Log.warning(e.toString());
			header.put("status", "500");
			 
		}
		resp.put("data", result);
		resp.put("header", header);

		Gson gson = new Gson(); 
		String json = gson.toJson(resp); 
			
		
		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(json);

	}

}

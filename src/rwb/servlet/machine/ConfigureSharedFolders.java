package rwb.servlet.machine;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rwb.config.Messages;

import com.google.gson.Gson;

import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.divers.Log;
import rwb.java.server.bo.ServeurBO;
import rwb.java.vb.bo.VirtualBoxBO;
import rwb.java.vb.dao.VirtualBoxDAO;

/**
 * Servlet implementation class ConfigureSharedFolders
 */
@WebServlet("/ConfigureSharedFolders")
public class ConfigureSharedFolders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfigureSharedFolders() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String serverId = (String) request.getParameter("vm-page-srv");
		String machineId = (String) request.getParameter("vm-page-vm");
		
		VirtualBoxBO vbox = null;
		
		Boolean error = false;
		HashMap<String,Object> data = new HashMap<>();
		/**
		 * Get information from the form
		 */
		HashMap<String,Object> mapModif = new HashMap<>();
		if ("createSharedFolder".equals(request.getParameter("fn"))){
			String username = (String)request.getSession().getAttribute("login-username");
			String nameFolder = (String)request.getParameter("nameFolder");
			boolean writable;
			if (request.getParameter("readOnly") == null ){
				writable = true;
			}else{
				writable = false;
			}
			boolean autoMount;
			if (request.getParameter("autoMount") != null ){
				autoMount = true;
			}else{
				autoMount = false;
			}
			String pathBase = Messages.getString("Path_smb_folder");
			String pathFolder = pathBase + username + "/sharedFolders/"+nameFolder;
			HashMap<String,Object> mapFolder = new HashMap<>();
			mapFolder.put("delete",false);
			mapFolder.put("name",nameFolder);
			mapFolder.put("path",pathFolder);
			mapFolder.put("writable", writable);
			mapFolder.put("automount",autoMount);
			HashMap<String,Object> mapFolders = new HashMap<>();
			mapFolders.put("0", mapFolder);
			mapModif.put("sharedFolders", mapFolders);
			Log.info("Try to create SharedFolder ...");
		}
		if("deleteSharedFolder".equals(request.getParameter("fn"))){
			HashMap<String,Object> mapFolder = new HashMap<>();
			mapFolder.put("delete", true);
			mapFolder.put("name", (String) request.getParameter("param"));
			HashMap<String,Object> mapFolders = new HashMap<>();
			mapFolders.put("0", mapFolder);
			mapModif.put("sharedFolders", mapFolders);
			Log.info("Try to delete SharedFolder ...");
		}
		
		/**
		 *    Create sharedFolder
		 *
		 */
		try{
			
			
			BddServeurBO bdd = new BddServeurBO();
			List<ServeurBO> listServeur = bdd.getServeurs("enabled");
			ServeurBO srv = ServeurBO.getServeur(listServeur, serverId);
			
			vbox = new VirtualBoxBO(new VirtualBoxDAO(srv),true);
			vbox.modifMachine(mapModif, machineId);

			
			if (vbox.getSharedFoldersMachine(machineId) != null){
				data.put("SharedFolders", vbox.getSharedFoldersMachine(machineId));
			} 
		}catch(Exception e){
			Log.warning(e.toString());
			error = true;
			 
		}
		
		/**
		 * Response parse 
		 */
		HashMap<String,Object> resp = new HashMap<>();
		HashMap<String,Object> header = new HashMap<>();
		if(error ){
			header.put("statut", "503");
			header.put("msg", "Not ok ");
		}else{
			header.put("statut", "200");
			header.put("msg", " ok");
		}
		 
		resp.put("header", header);
		resp.put("data", data);
			
		
		Gson gson = new Gson(); 
		String json = gson.toJson(resp); 
			
		
		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(json);
	}

}

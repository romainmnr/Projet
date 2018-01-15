package rwb.servlet.machine;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.virtualbox_5_0.IMedium;

import com.google.gson.Gson;

import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.divers.HashmapBO;
import rwb.java.divers.Log;
import rwb.java.server.bo.ServeurBO;
import rwb.java.vb.bo.VirtualBoxBO;
import rwb.java.vb.dao.VirtualBoxDAO;

/**
 * Servlet implementation class ConfigureStorage
 */
@WebServlet("/ConfigureStorage")
public class ConfigureStorage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfigureStorage() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String serverId = (String)request.getParameter("vm-page-srv");
		String machineId = (String)request.getParameter("vm-page-vm");
		
		
		Boolean error = false;
		VirtualBoxBO vbox = null;
		BddServeurBO bdd = null;
		HashmapBO mapBO = new HashmapBO() ;
		List<ServeurBO> listServeur = null;
		String mac = null;
	
	
		
		
		
		
		try {
			Log.info("Try to configure storage  ...");
			
			bdd = new BddServeurBO();
			listServeur = bdd.getServeurs("enabled");
			ServeurBO srv = ServeurBO.getServeur(listServeur, serverId);
			
			vbox = new VirtualBoxBO(new VirtualBoxDAO(srv),true);
			vbox.createInfosMachine(machineId);
			mapBO =  new HashmapBO((HashMap<String, Object>) vbox.getInfosMachine(machineId));
			
			if(request.getParameter("fn") != null){
				String function = (String)request.getParameter("fn");
				String ctrl = null;
				if(request.getParameter("param") != null){
					ctrl = (String)request.getParameter("param");
				}
				 
				switch(function){
				case "addCtrl": 
					mapBO.createController(ctrl);
					vbox.modifMachine((HashMap<String,Object>)mapBO.generateConfigHashMap(), machineId); 
					break;
				case "removeCtrl": 
					mapBO.deleteController(ctrl,ctrl);
					vbox.modifMachine((HashMap<String,Object>)mapBO.generateConfigHashMap(), machineId); 
					break;
				case "addDrive":
					IMedium medium = vbox.createDrive(machineId,(String)request.getParameter("createHDD-name"), (String)request.getParameter("createHDD-format"), vbox.getPathMachineFolder()+"/", Long.valueOf(request.getParameter("createHDD-size")));
					mapBO.createCustomHDD(ctrl,mapBO.getAvailablePort("IDE"),medium);
					vbox.modifMachine((HashMap<String,Object>)mapBO.generateConfigHashMap(), machineId); 
					break;
				case "refreshMAC":
					mac = vbox.refreshMACAdpaterMachine(machineId,Long.valueOf((String)request.getParameter("param")));
					break;
				default:
					break;
					
				}
				
				mapBO =  new HashmapBO((HashMap<String, Object>) vbox.getInfosMachine(machineId));
			}
			
			
			
			 
		} catch (Exception e) {
			error = true;
			Log.warning(e.toString());
			 
		
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
		
		header.put("srvId", serverId);
		header.put("vmId", machineId);
		
		HashMap<String,Object> data = new HashMap<>();

		data.put("controller", mapBO.getControllerList());
		data.put("storageTree", mapBO.getStorageTree()); 
		data.put("MAC", mac);
		
			 
		resp.put("header", header);
		resp.put("data", data);
			
		
		Gson gson = new Gson(); 
		String json = gson.toJson(resp); 
			
		
		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(json);
	
	
	}

}

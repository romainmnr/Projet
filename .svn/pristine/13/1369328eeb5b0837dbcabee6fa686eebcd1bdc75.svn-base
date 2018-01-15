package rwb.servlet.machine;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.divers.Log;
import rwb.java.server.bo.ServeurBO;
import rwb.java.vb.bo.VirtualBoxBO;
import rwb.java.vb.dao.VirtualBoxDAO;

/**
 * Servlet implementation class PreviewMachine
 */
@WebServlet("/PreviewStateMachine")
public class PreviewStateMachine extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private byte[] imageInByte = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PreviewStateMachine() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String serverId = (String)request.getParameter("vm-page-srv");
		String machineId = (String)request.getParameter("vm-page-vm");

		String src = "";
		String state = "";
		Boolean error = false;
		VirtualBoxBO vbox = null;
		BddServeurBO bdd = null;
		List<ServeurBO> listServeur = null;

		try {
			

			bdd = new BddServeurBO();
			listServeur = bdd.getServeurs("enabled");
			ServeurBO srv = ServeurBO.getServeur(listServeur, serverId);

			vbox = new VirtualBoxBO(new VirtualBoxDAO(srv),true);

			//Get preview
			imageInByte = vbox.getPreviewMachine(machineId);
			
			try {
				if(imageInByte != null){ 
					// convert byte array back to BufferedImage
					InputStream in = new ByteArrayInputStream(imageInByte);
					BufferedImage bImageFromConvert = ImageIO.read(in);

					ByteArrayOutputStream out = new ByteArrayOutputStream();
					ImageIO.write(bImageFromConvert, "PNG", out);
					byte[] bytes = out.toByteArray();

					String base64bytes = Base64.getEncoder().encodeToString(bytes);
					src = "data:image/png;base64," + base64bytes; 
				}
			} catch (IOException e) {
				Log.warning(e.getMessage());
				 
			}

			//Get State
			state = vbox.getMachine(machineId).getState();


		} catch (Exception e) {
			error = true;
			Log.warning(e.toString());
		} 
		
		
		/**
		 * Response parse 
		 */
		HashMap<String,Object> resp = new HashMap<>();
		HashMap<String,Object> header = new HashMap<>();
		if(error){
			header.put("statut", "503");
			header.put("msg", "Preview and state - error ");
		}else{
			header.put("statut", "200");
			header.put("msg", "Preview and State - ok");
		}
		
		header.put("srvId", serverId);
		header.put("vmId", machineId);
		
		HashMap<String,Object> data = new HashMap<>();
		data.put("preview", src);
		data.put("state", state);
	
		
		resp.put("header", header);
		resp.put("data", data);
			
		
		Gson gson = new Gson(); 
		String json = gson.toJson(resp); 
			
		
		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(json);
				
	
		

	}

}

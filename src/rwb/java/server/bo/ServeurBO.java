package rwb.java.server.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ServeurBO {

	private String name;
	private String id;
	private String ip;
	private int port;
	private String user;
	private String password;
	private boolean enabled;
	private Map<String,Object> mapSrv = new HashMap<>();
	
	/**
	 * 
	 * @param name
	 * @param id
	 * @param ip
	 * @param port
	 * @param user
	 * @param password
	 * @param enabled
	 */
	public ServeurBO(String name, String id, String ip, int port, String user, String password,boolean enabled) {
		this.name = name;
		this.id = id;
		this.ip = ip;
		this.port = port;
		this.user = user;
		this.password = password;
		this.enabled = enabled;
	}
	
	/**
	 * 
	 */
	public ServeurBO() {
		this.name = "";
		this.id = "";
		this.ip = "";
		this.port = 18083;
		this.user = "";
		this.password = "";
		this.enabled = false;
		
	}

	/**
	 * 
	 * @param ip
	 * @param user
	 * @param pass
	 */
	public ServeurBO( String ip, String user, String pass ) {
		this.port = 18083;
		this.ip = ip;
		this.user = user;
		this.password = pass;
	}

	/**
	 * 
	 * @param list
	 * @param idSrv
	 * @return
	 */
	public static ServeurBO getServeur(List<ServeurBO> list, String idSrv){
		ServeurBO serveur = null;
		for(ServeurBO s : list){
			if(s.getId().equals(idSrv)){
				serveur = s;
			}
		}
		return serveur;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * 
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 
	 * @return
	 */
	public String getId() {
		return id;
	}

	/**
	 * 
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 
	 * @return
	 */
	public String getIp() {
		return ip;
	}

	/**
	 * 
	 * @param ip
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}

	/**
	 * 
	 * @return
	 */
	public int getPort() {
		return port;
	}

	/**
	 * 
	 * @param port
	 */
	public void setPort(int port) {
		this.port = port;
	}

	/**
	 * 
	 * @return
	 */
	public String getUser() {
		return user;
	}

	/**
	 * 
	 * @param user
	 */
	public void setUser(String user) {
		this.user = user;
	}

	/**
	 * 
	 * @return
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * 
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * 
	 * @return
	 */
	public boolean getState() {
		return enabled;
	}

	/**
	 * 
	 * @param enabled
	 */
	public void setState(boolean enabled) {
		this.enabled = enabled;
	}
	
	/**
	 * 
	 * @return
	 */
	public boolean isEnabled() {
		return enabled;
	}

	/**
	 * 
	 * @param enabled
	 */
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	/**
	 * 
	 * @return
	 */
	public Map<String, Object> getMapSrv() {
		return mapSrv;
	}

	/**
	 * 
	 * @param mapSrv
	 */
	public void setMapSrv(Map<String, Object> mapSrv) {
		this.mapSrv = mapSrv;
	}
}

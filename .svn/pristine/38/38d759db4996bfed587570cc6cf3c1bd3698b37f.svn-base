package rwb.java.bdd.bo;

import java.sql.ResultSet; 
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import rwb.config.Messages;
import rwb.java.bdd.dao.BddServeurDAO;
import rwb.java.divers.Log;
import rwb.java.server.bo.ServeurBO;


public class BddServeurBO {
	
	/**
	 * Attributes class BddServeurBO
	 */
	private BddServeurDAO bdd;
	private String selectAllFrom = "SELECT * FROM ";
	private String success = "Success";
	/**
	 * Constants class BddServeurBO
	 */
	private static final String TABLE_USERS = Messages.getString("table_Users");
	private static final String TABLE_SERVERS = Messages.getString("table_Servers");
	private static final String TABLE_VMS = Messages.getString("table_VMs");
	private static final String NORESULT = "No result";
	
	/**
	 * Instance of BddServeurBO, create the connection to DB
	 */
	public BddServeurBO() {
		this.bdd = new BddServeurDAO();
	}
	
	/**
	 * 
	 * @param test
	 */
	public BddServeurBO(boolean test){
	}
	
	/**
	 * Get the data base
	 * @return
	 */
	public BddServeurDAO getBdd() {
		return bdd;
	}
	
	/**
	 * Set the data base
	 * @param bdd
	 */
	public void setBdd(BddServeurDAO bdd) {
		this.bdd = bdd;
	}
	
	/**
	 * Get parameters of each user
	 * 
	 * @param userName
	 * @param userPassword
	 * @return User from DB (if present) -> Array:[username,password,account,mail]
	 */
	public String[] getUser(String userName, String userPassword){
		int size = 4;
		/*
		 *  Needed to UPDATE `users` SET `password`=PASSWORD("mdptest") WHERE username="test"
		 *  for each password in the bdd to secure it
		 */
		String[] result = new String[size];
		
		//SECURITY
		String selectUser = selectAllFrom +TABLE_USERS+" WHERE username=? AND password=PASSWORD(?)";
		Log.info("Try to get user from BDD... ");
		String[] paramStmt= {userName,userPassword};
		this.bdd.prepareStmt(selectUser);
		this.bdd.setPrepStmt(paramStmt);
		ResultSet rset = this.bdd.executePrep();
		//END SECURITY
		
		if(rset != null){
			try{
				while (rset.next()) {
					for(int i = 0; i< size; i++){
						result[i] = rset.getString(i+1);
					}
				}
			}catch(SQLException e){
				Log.warning(e.toString());
			}finally{
				Log.info(success);
				bdd.closeRset();
			}
		}else{
			Log.info(NORESULT);
			bdd.closeRset();
		}
		return result;
	}
	
	/**
	 * Method that permit to get the list of the machines for a server
	 * 
	 * @return List<ServeurBO> present in the DB.
	 */
	public List<ServeurBO> getServeurs(String mode){
		
		String select;
		switch(mode){
		case "all":
			select = selectAllFrom + TABLE_SERVERS;
			break;
		case "enabled":
			select = selectAllFrom + TABLE_SERVERS +" WHERE `enabled`='1'";
			break;
		default: // case of idUser in param
			select = selectAllFrom + TABLE_SERVERS +" WHERE `idServer` IN (SELECT `idServer` FROM "+TABLE_VMS+" WHERE `idUser`=\""+mode+"\")";
			break;
		}
		List<ServeurBO> result = new ArrayList<>();

		Log.info("Try to get list servers from BDD...");

		ResultSet rset = this.bdd.execute(select);
		if(rset != null){
			try{
				while (rset.next()) {
					ServeurBO serveur = new ServeurBO(rset.getString(4),
														rset.getString(1),
														rset.getString(2),
														rset.getInt(3),
														rset.getString(5),
														rset.getString(6),
														rset.getBoolean(7)
														); 
					result.add(serveur);
				}
			}catch(SQLException e){
				Log.warning(e.toString());
			}finally{
				Log.info(success);
				bdd.closeRset();
			}
		}else{
			Log.info(NORESULT);
		}
		return result;
	}
	
	/**
	 * Method that permit to get the list of the machines for a server
	 * 
	 * @return List<ServeurBO> present in the DB.
	 */
	public ServeurBO getServeur(String srvId){
		
		String select = selectAllFrom + TABLE_SERVERS +" WHERE `idServer`='"+ srvId +"'";
		ServeurBO result = null; 
		Log.info("Try to get list servers from BDD...");

		ResultSet rset = this.bdd.execute(select);
		if(rset != null){
			try{
				while (rset.next()) {
					result = new ServeurBO(	rset.getString(4),
											rset.getString(1),
											rset.getString(2),
											rset.getInt(3),
											rset.getString(5),
											rset.getString(6),
											rset.getBoolean(7)
											);
				}
			}catch(SQLException e){
				Log.warning(e.toString());
			}finally{
				Log.info(success);
				bdd.closeRset();
			}
		}else{
			Log.info(NORESULT);
		}
		return result;
	}
	
	/**
	 * 
	 * @return
	 */
	public List<String> getListVmName(){
		List<String> list = new ArrayList<>();
		
		String select = "SELECT `name` FROM " + TABLE_VMS; 
		ResultSet rset = this.bdd.execute(select);
		if(rset != null){
			try{ 
				while (rset.next()) {
					list.add(rset.getString(1));   
				}
			}catch(SQLException e){
				Log.warning(e.toString());
				 
			}finally{ 
				Log.info(success);
				bdd.closeRset();
			} 
		}else{
			Log.info(NORESULT); 
		} 
		return list;
	}
	
	/**
	 * 
	 * @param machineName
	 * @return
	 */
	public String getVmOwner(String machineName){
		String r = null;
		String select = "SELECT `idUser` FROM " + TABLE_VMS + " WHERE `name`= '"+machineName+"'"; 
		ResultSet rset = this.bdd.execute(select);
		if(rset != null){
			try{ 
				while (rset.next()) {
					r = rset.getString(1);   
				}
			}catch(SQLException e){
				Log.warning(e.toString());
				 
			}finally{ 
				Log.info(success);
				bdd.closeRset();
			} 
		}else{
			Log.info("No result"); 
		} 
		return r;
	}
	

	/**
	 * 
	 * @param mode
	 * @param userId
	 * @return
	 */
	public Map<String,Object> getVm(String mode, String userId){
		String select = "";
		switch(mode){
		case "all":
			select = selectAllFrom + TABLE_VMS;
			break;
		case "user":
			select = selectAllFrom + TABLE_VMS +" WHERE `idUser`=?";
			break;
		default:
			break;
		}
		String[] paramStmt= {userId};
		this.bdd.prepareStmt(select); 
		this.bdd.setPrepStmt(paramStmt);
		
		Log.info("Try to get list of VM from BDD...");
		
		ResultSet rset = this.bdd.executePrep();
		Map<String,Object> result = new HashMap<>();
		
		if(rset != null){
			try{
				while (rset.next()) {
					Map<String,Object> vm = new HashMap<>();
					vm.put("idVm", rset.getString(1));
					vm.put("name", rset.getString(2));
					vm.put("os", rset.getString(3));
					vm.put("idServer", rset.getString(4));
					vm.put("idUser", rset.getString(5));
					vm.put("idPortVrde", rset.getString(6));
											
					result.put(rset.getString(1),vm);		
				}
			}catch(SQLException e){
				Log.warning(e.toString());
			}finally{
				Log.info(success);
				bdd.closeRset();
			}
		}else{
			Log.info(NORESULT);
		}
		return result;
	}

	/**
	 * 
	 * @param name
	 * @param os
	 * @param idSrv
	 * @param idUser
	 * @param port
	 */
	public void createMachine(String name, String os, String idSrv, String idUser, String port){
		String insert = "INSERT INTO `RemoteWebBox_VMs` (`name`, `os`, `idServer`, `idUser`, `idPortVrde`) VALUES (?,?,?,?,?)";
		Log.info("Try to create machine in BDD... ");

		String[] paramStmt= {name,os,idSrv,idUser,port};
		this.bdd.prepareStmt(insert);

		this.bdd.setPrepStmt(paramStmt);
		this.bdd.executePrep();
	}
	
	/**
	 * 
	 * @param name
	 */
	public void deleteMachine(String name){
		String insert = "DELETE FROM `RemoteWebBox_VMs` WHERE `name`=?";
		Log.info("Try to create machine in BDD... ");

		String[] paramStmt= {name};
		this.bdd.prepareStmt(insert);

		this.bdd.setPrepStmt(paramStmt);
		this.bdd.executePrep();
	}
	
	
	/**
	 * Method that permit to toggle the server state
	 * 
	 * @param srvId
	 */
	public void toggleSrvState(String srvId){
		
		boolean result = false;
		String select = "SELECT `enabled` FROM " + TABLE_SERVERS +" WHERE `idServer`='"+srvId+"'";
		Log.info("Try to get server state from BDD...");
		ResultSet rset = this.bdd.execute(select);
		try{
			while (rset.next()) {
				result = rset.getBoolean(1);
			}
		}catch(SQLException e){
			Log.warning(e.toString());
			 
		}finally{
			bdd.closeRset();
			Log.info(success);	
		}
		int state = 0;
		if(!result){
			state = 1;
		}
		String update = "UPDATE " + TABLE_SERVERS +" SET `enabled`='"+ state +"' WHERE `idServer`='"+srvId+"'";
		Log.info("Try to toggle state server  from BDD...");
		
		this.bdd.execute(update);
		Log.info(success); 
	}
	
	/**
	 * Close the connection to DB
	 */
	public void close(){
		this.bdd.closeBdd();
	}	
}
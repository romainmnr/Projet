package rwb.java.ldap;

import java.io.IOException;
import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.Control;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;

import org.apache.directory.api.ldap.model.entry.DefaultAttribute;
import org.apache.directory.api.ldap.model.entry.DefaultEntry;
import org.apache.directory.api.ldap.model.entry.DefaultModification;
import org.apache.directory.api.ldap.model.entry.ModificationOperation;
import org.apache.directory.api.ldap.model.exception.LdapException;
import org.apache.directory.api.ldap.model.name.Dn;
import org.apache.directory.ldap.client.api.LdapConnection;
import org.apache.directory.ldap.client.api.LdapNetworkConnection;

import rwb.config.Messages;

public class MainLdap {

	/**
	 * Attributes
	 */
	//private static final String IP_HOST = Messages.getString("IP_host");
	private final LdapConnection lLdapCo = new LdapNetworkConnection(CONSTANT_LDAP_IP, 389);
	//private static final String IP_LDAP = Messages.getString("IP_ldap");

	private static final String CONSTANT_AD_IP 			= Messages.getString("ad_host");
	private static final String CONSTANT_AD_IP_PORT 	= Messages.getString("ad_host_port");
	private static final String CONSTANT_AD_LOGIN 		= Messages.getString("ad_login");
	private static final String CONSTANT_AD_PASSWORD 	= Messages.getString("ad_pass");
	private static final String CONSTANT_AD_BRANCH 		= Messages.getString("ad_branch");
	
	private static final String CONSTANT_SEARCH = "(&(objectclass=person)(cn=";

	private static final String CONSTANT_LDAP_IP 		= Messages.getString("ldap_host");      
	private static final String CONSTANT_LDAP_IP_PORT 	= Messages.getString("ldap_host_port"); 
	private static final String CONSTANT_LDAP_LOGIN 	= Messages.getString("ldap_login");     
	private static final String CONSTANT_LDAP_PASSWORD 	= Messages.getString("ldap_pass");      
	private static final String CONSTANT_LDAP_BRANCH 	= Messages.getString("ldap_branch");    
	

	/**	
	 * Default main
	 */
	public MainLdap() {
		//default main
	}

	/**
	 * 
	 * @param userName
	 * @param rigths
	 * @param surname
	 * @param uid
	 * @param option
	 * @param prenomNom
	 * @throws LdapException
	 * @throws IOException
	 */
	public void addUserLdap(String userName, String rigths, String surname, String uid, String option, String prenomNom) throws LdapException, IOException {
		this.lLdapCo.bind(CONSTANT_AD_LOGIN, CONSTANT_AD_PASSWORD);
		this.lLdapCo.add(new DefaultEntry(
				// add a user
				"cn=" + userName + ",ou=" + rigths + ","+CONSTANT_AD_BRANCH, // Distinguished
																						// Name
				"objectClass: organizationalPerson", "objectClass: inetOrgPerson", "objectClass: person","objectClass: top", 
				"sn: "+surname, "uid: "+uid, "st: "+option,"givenName: "+prenomNom
		));
		this.lLdapCo.unBind();
		this.lLdapCo.close();
	}
	/**
	 * 
	 * @param userName
	 * @throws LdapException
	 * @throws IOException
	 */
	public void changeUserLdap(String userName, String rigths, String operation, String attribut, String contenu)
			throws LdapException, IOException {

		this.lLdapCo.bind(CONSTANT_AD_LOGIN, CONSTANT_AD_PASSWORD);

		switch (operation) {
		case "ADD":
			this.lLdapCo.modify(new Dn("uid=" + userName + ",ou=" + rigths + "," + CONSTANT_AD_BRANCH),
					new DefaultModification(ModificationOperation.ADD_ATTRIBUTE,
							// ADD_ATTRIBUTE
							// REMOVE_ATTRIBUTE
							// REPLACE_ATTRIBUTE
							new DefaultAttribute(attribut, contenu)));
			break;
		case "REPLACE":
			this.lLdapCo.modify(new Dn("uid=" + userName + ",ou=" + rigths + "," + CONSTANT_AD_BRANCH),
					new DefaultModification(ModificationOperation.REPLACE_ATTRIBUTE,
							// ADD_ATTRIBUTE
							// REMOVE_ATTRIBUTE
							// REPLACE_ATTRIBUTE
							new DefaultAttribute(attribut, contenu)));
			break;
		case "REMOVE":
			this.lLdapCo.modify(new Dn("uid=" + userName + ",ou=" + rigths + "," + CONSTANT_AD_BRANCH),
					new DefaultModification(ModificationOperation.REMOVE_ATTRIBUTE,
							// ADD_ATTRIBUTE
							// REMOVE_ATTRIBUTE
							// REPLACE_ATTRIBUTE
							new DefaultAttribute(attribut, contenu)));
			break;
		}
		this.lLdapCo.unBind();
		this.lLdapCo.close();
	}

	public String getListUsersLdap() throws LdapException, IOException, NamingException {

		String returnListUsers = new String();
		Hashtable<String, String> lEnvironment = new Hashtable<>();
		// Connexion parameters
		//Messages.getString("IP_ldap");
		lEnvironment.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		lEnvironment.put(Context.PROVIDER_URL, CONSTANT_AD_IP_PORT);
		lEnvironment.put(Context.SECURITY_PRINCIPAL, CONSTANT_AD_LOGIN);
		lEnvironment.put(Context.SECURITY_CREDENTIALS, CONSTANT_AD_PASSWORD);

		// Initialisation
		final LdapContext lLdapContext = new InitialLdapContext(lEnvironment, new Control[0]);
		final SearchControls lSearchControls = new SearchControls();

		// Research scope
		lSearchControls.setSearchScope(SearchControls.SUBTREE_SCOPE);

		// does a query for each type of rigths that exist
		final NamingEnumeration<SearchResult> resAdm = lLdapContext.search(CONSTANT_AD_BRANCH, "(&(objectclass=*))",
				lSearchControls);
		while (resAdm.hasMore()) {
			// determines which rights the user has
			returnListUsers=returnListUsers+(resAdm.next().getName().toString())+"\n";
		}
		return returnListUsers;
	}
	
	
	public String[] getListUserAttributes(String userName) throws LdapException, IOException, NamingException {

		String[] returnListAttributes = new String[]{};
		Hashtable<String, String> lEnvironment = new Hashtable<>();
		// Connexion parameters
		//Messages.getString("IP_ldap");
		lEnvironment.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		lEnvironment.put(Context.PROVIDER_URL, CONSTANT_AD_IP_PORT);
		lEnvironment.put(Context.SECURITY_PRINCIPAL, CONSTANT_AD_LOGIN);
		lEnvironment.put(Context.SECURITY_CREDENTIALS, CONSTANT_AD_PASSWORD);

		// Initialisation
		//final LdapContext lLdapContext = new InitialLdapContext(lEnvironment, new Control[0]);
		final SearchControls lSearchControls = new SearchControls();
		// Research scope
		lSearchControls.setSearchScope(SearchControls.SUBTREE_SCOPE);
		lSearchControls.setReturningAttributes(new String[]{"uid","sn","cn","st"});
		//"uid"=Id
		//"sn"=Surnom
		//"cn"= Nom Prénom
		//"st"= Option (ex:cc/iit)
		// does a query for each type of rigths that exist
		InitialDirContext context= new InitialDirContext(lEnvironment);
		SearchResult resultAttrFinal = null;
				
		final NamingEnumeration<SearchResult> resAttr = context.search(CONSTANT_AD_BRANCH, CONSTANT_SEARCH + userName + "))",
				lSearchControls);
				
		while (resAttr.hasMore()) {
			resultAttrFinal=resAttr.nextElement();
		}
		if(resultAttrFinal != null){
			returnListAttributes[0]=resultAttrFinal.getAttributes().get("uid").get().toString();
			returnListAttributes[1]=resultAttrFinal.getAttributes().get("sn").get().toString();
			returnListAttributes[2]=resultAttrFinal.getAttributes().get("cn").get().toString();
			returnListAttributes[3]=resultAttrFinal.getAttributes().get("st").get().toString(); 
		}
				
		return returnListAttributes;
	}

	/**
	 * Method that return the right of each user
	 * 
	 * @param userName
	 * @return UserRight
	 * @throws NamingException
	 * @throws LdapException
	 * @throws IOException
	 */
	public String getUserRights(String userName) throws NamingException, LdapException, IOException {
		// look in the ldap to return the rights of the user
		final Hashtable<String, String> lEnvironment = new Hashtable<>();
		// Connexion parameters
		lEnvironment.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		lEnvironment.put(Context.PROVIDER_URL, CONSTANT_AD_IP_PORT);
		// env.put(Context.SECURITY_AUTHENTICATION, "simple");
		lEnvironment.put(Context.SECURITY_PRINCIPAL, CONSTANT_AD_LOGIN);
		lEnvironment.put(Context.SECURITY_CREDENTIALS, CONSTANT_AD_PASSWORD);

		// Initialisation
		final LdapContext lLdapContext = new InitialLdapContext(lEnvironment, new Control[0]);
		final SearchControls lSearchControls = new SearchControls();

		// Research scope
		lSearchControls.setSearchScope(SearchControls.SUBTREE_SCOPE);

		// does a query for each type of rigths that exist
		final NamingEnumeration<SearchResult> resAdm = lLdapContext.search(CONSTANT_AD_BRANCH, CONSTANT_SEARCH + userName + "))",
				lSearchControls);
		final NamingEnumeration<SearchResult> resEtu = lLdapContext.search(CONSTANT_AD_BRANCH, CONSTANT_SEARCH + userName + "))",
				lSearchControls);
		final NamingEnumeration<SearchResult> resEnc = lLdapContext.search(CONSTANT_AD_BRANCH, CONSTANT_SEARCH + userName + "))",
				lSearchControls);
		final NamingEnumeration<SearchResult> resRef = lLdapContext.search(CONSTANT_AD_BRANCH, CONSTANT_SEARCH + userName + "))",
				lSearchControls);

		String returnRights = new String("Username does not exist");
		while (resAdm.hasMore()) {
			// determines which rights the user has

			if (resAdm.next().getName().contains("admin")) {
				returnRights = "admin";
			}
		}

		while (resEtu.hasMore()) {
			if (resEtu.next().getName().contains("etudiant")) {
				returnRights = "etudiant";
			}
		}

		while (resEnc.hasMore()) {
			if (resEnc.next().getName().contains("encadrant")) {
				returnRights = "encadrant";
			}
		}

		while (resRef.hasMore()) {
			if (resRef.next().getName().contains("referent")) {
				returnRights = "referent";
			}
		}
		resAdm.close();
		resEtu.close();
		resEnc.close();
		resRef.close();

		lLdapContext.close();

		return returnRights;
	}

	/**
	 * 
	 * @param userName
	 * @param rigths
	 * @throws LdapException
	 * @throws IOException
	 * @throws NamingException
	 */
	public void deleteUserLdap(String userName, String rigths) throws LdapException, IOException, NamingException {
		lLdapCo.bind(CONSTANT_AD_LOGIN, CONSTANT_AD_PASSWORD);
		lLdapCo.delete("cn=" + userName + ",ou=" + rigths + ","+CONSTANT_AD_BRANCH);
		lLdapCo.unBind();
		lLdapCo.close();
	}
}

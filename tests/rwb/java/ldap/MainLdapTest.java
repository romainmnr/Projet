package rwb.java.ldap;

import static org.junit.Assert.*;

import java.io.IOException;

import javax.naming.NamingException;

import org.apache.directory.api.ldap.model.exception.LdapException;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.testng.Assert;

public class MainLdapTest {

	private MainLdap ldap;
	
	@Before
	public void setUp() throws Exception {
		this.ldap = new MainLdap();
	}

	/*
	 * @After public void tearDown() throws Exception { }
	 */


	public void addUserLdapTest() throws NamingException, LdapException, IOException {
		this.ldap.addUserLdap("test", "etudiant", "responsable test", "100", "option test", "testprenom testnom");
		Assert.assertEquals("etudiant", this.ldap.getUserRights("test"));
		
	}
	
	
	public void getUserRightsTest() throws NamingException, LdapException,IOException {
		Assert.assertEquals("admin", this.ldap.getUserRights("admin"));
		Assert.assertEquals("etudiant", this.ldap.getUserRights("test"));
	}
	
	
	public void changeUserLdapTest()throws NamingException, LdapException, IOException {
		String[] listAttributesBefore = new String[]{"100","responsable test","test","option test","testprenom testnom"};
		Assert.assertEquals(listAttributesBefore,this.ldap.getListUserAttributes("test"));
		this.ldap.changeUserLdap("test","etudiant","REPLACE","sn","expert");
		String[] listAttributesAfter = new String[]{"100","expert","test","option test","testprenom testnom"};
		Assert.assertEquals(listAttributesAfter,this.ldap.getListUserAttributes("test"));
		
		String[] listRemove_Add_Before = new String[]{"100","expert","test","option test","testprenom testnom"};
		Assert.assertEquals(listRemove_Add_Before,this.ldap.getListUserAttributes("test"));
		this.ldap.changeUserLdap("test","etudiant","REMOVE","st","option test");
		this.ldap.changeUserLdap("test","etudiant","ADD","st","attribut option");
		String[] listRemove_Add_After = new String[]{"100","expert","test","attribut option","testprenom testnom"};
		Assert.assertEquals(listRemove_Add_After,this.ldap.getListUserAttributes("test"));

	}
	public void getListUsersLdapTest()throws NamingException, LdapException, IOException {
		Assert.assertEquals("cn=romain,ou=encadrant\ncn=maxime,ou=etudiant\ncn=stephen,ou=referent\ncn=admin,ou=admin\n",this.ldap.getListUsersLdap());
	}
	
	public void getListUserAttributesTest()throws NamingException, LdapException, IOException {
		String[] listAttributesTest = new String[]{"2","security hypervisor","stephen","Option CC","Stephen Perrin"};
		Assert.assertEquals(listAttributesTest,this.ldap.getListUserAttributes("stephen"));
	}
	
	public void deleteUserLdapTest() throws NamingException, LdapException,IOException {
	this.ldap.deleteUserLdap("test", "etudiant");
	Assert.assertEquals("Username does not exist",this.ldap.getUserRights("test"));
	}
	
	// FAIRE CHANGEUSERLDAP
	
	@Test
	public void testSuite() throws NamingException, LdapException,IOException {
	this.addUserLdapTest();
	this.changeUserLdapTest();
	this.getUserRightsTest();
	this.deleteUserLdapTest();
	this.getListUsersLdapTest();
	this.getListUserAttributesTest();
	}

}

package rwb.java.server.bo;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.testng.Assert;

public class ServeurBOTest {

	private ServeurBO serveurBO;

	@Before
	public void setUp() {
		this.serveurBO = new ServeurBO();
}

	
	@Test
	public void getServeurTest(){
		ServeurBO serveurMock = Mockito.mock(ServeurBO.class);
		Mockito.when(serveurMock.getId()).thenReturn("123");
		List<ServeurBO> listServeur = new ArrayList<ServeurBO>();
		listServeur.add(serveurMock);

		Assert.assertEquals(serveurMock, ServeurBO.getServeur(listServeur, "123"));
	
	}
	
	@Test 
	public void accesseurAttributsTest(){
		this.serveurBO.setId("id");
		this.serveurBO.setIp("ip");
		this.serveurBO.setName("name");
		this.serveurBO.setPassword("password");
		this.serveurBO.setPort(0);
		this.serveurBO.setState(true);
		this.serveurBO.setUser("user");
		
		Assert.assertEquals("id", this.serveurBO.getId());
		Assert.assertEquals("ip", this.serveurBO.getIp());
		Assert.assertEquals("name", this.serveurBO.getName());
		Assert.assertEquals("password", this.serveurBO.getPassword());
		Assert.assertEquals("user", this.serveurBO.getUser());
		Assert.assertEquals(0, this.serveurBO.getPort());
		Assert.assertTrue(this.serveurBO.getState());
		
	}
}

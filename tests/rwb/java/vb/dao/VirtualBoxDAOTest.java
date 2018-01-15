package rwb.java.vb.dao;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.virtualbox_5_0.VirtualBoxManager;

import rwb.java.server.bo.ServeurBO;

public class VirtualBoxDAOTest {

	private VirtualBoxDAO daoMock;
	
	@Before
	public void setUp(){
		this.daoMock = new VirtualBoxDAO();
	}

	@Test
	public void accesseurAttributsTest() {
		VirtualBoxManager vbm = Mockito.mock(VirtualBoxManager.class);
		daoMock.setVbm(vbm);
		Assert.assertEquals(vbm, daoMock.getVbm());
	}
	
	@Test
	public void constructeurTest(){
		ServeurBO serveurMock = Mockito.mock(ServeurBO.class);
		VirtualBoxManager vbm = Mockito.mock(VirtualBoxManager.class);
		
		Mockito.when(serveurMock.getId()).thenReturn("192.168.4.201");
		Mockito.when(serveurMock.getPort()).thenReturn(18083);
		Mockito.when(serveurMock.getUser()).thenReturn("etudiant");
		Mockito.when(serveurMock.getPassword()).thenReturn("network");
		
		VirtualBoxDAO dao = new VirtualBoxDAO(serveurMock);
		Assert.assertNotNull(dao.getVbm());
	}
	
	@Test
	public void disconnectTest(){
		VirtualBoxManager vbm = Mockito.mock(VirtualBoxManager.class);
		daoMock.setVbm(vbm);
		Assert.assertTrue(daoMock.disconnect());
	}
	
	
}


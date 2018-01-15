package rwb.java.proxy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.testng.Assert;

import rwb.java.bdd.bo.BddServeurBO;
import rwb.java.divers.HashmapBO;
import rwb.java.server.bo.ServeurBO;
import rwb.java.vb.bo.MachineBO;
import rwb.java.vb.bo.VirtualBoxBO;

public class ProxyTest {

	private Proxy proxyUser;
	private Proxy proxyMachine;
	private Proxy proxyEmpty;
	private Proxy proxy;
	
	@Before
	public void setUp(){
		this.proxy = new Proxy("2", "ProxyTest", "pajotima", "admin");
		this.proxyUser = new Proxy("pajotima");
		this.proxyMachine = new Proxy("2", "ProxyTest");
		this.proxyEmpty = new Proxy();
	}
	
	@Test
	public void accesseurAttributsTest(){
		BddServeurBO bdd = Mockito.mock(BddServeurBO.class);
		MachineBO machine = Mockito.mock(MachineBO.class);
		HashmapBO mapBO = Mockito.mock(HashmapBO.class);
		ServeurBO srv = Mockito.mock(ServeurBO.class);
		VirtualBoxBO vboxBo = Mockito.mock(VirtualBoxBO.class);
		List<MachineBO> listMachine = new ArrayList<MachineBO>();
		List<ServeurBO> listServeur = new ArrayList<ServeurBO>();
		Map<String, Object> mapMachine = new HashMap<String, Object>();
		Map<String, Object> mapServeur = new HashMap<String, Object>();
		String srvId = "2";
		String machineId = "10";

		
		
		proxyEmpty.setBdd(bdd);
		proxyEmpty.setListMachine(listMachine);
		proxyEmpty.setListServeur(listServeur);
		proxyEmpty.setMachine(machine);
		proxyEmpty.setMapBO(mapBO);
		proxyEmpty.setMapMachine(mapMachine);
		proxyEmpty.setSrv(srv);
		proxyEmpty.setSrvId(srvId);
		proxyEmpty.setVboxBo(vboxBo);
		proxyEmpty.setMachineId(machineId);
		proxyEmpty.initVRDEPort();
		proxyEmpty.setMapServer(mapServeur);
		
		Assert.assertEquals(bdd, proxyEmpty.getBdd());
		Assert.assertEquals(listMachine, proxyEmpty.getListMachine());
		Assert.assertEquals(listServeur, proxyEmpty.getListServeur());
		Assert.assertEquals(machine, proxyEmpty.getMachine());
		Assert.assertEquals(mapBO, proxyEmpty.getMapBO());
		Assert.assertEquals(mapMachine, proxyEmpty.getMapMachine());
		Assert.assertEquals(srv, proxyEmpty.getSrv());
		Assert.assertEquals(srvId, proxyEmpty.getSrvId());
		Assert.assertEquals(vboxBo, proxyEmpty.getVboxBo());

		Assert.assertEquals(machineId, proxyEmpty.getMachineId());
	}
	
	@Test
	public void test(){
		proxy.connectionBDD();
		proxy.initAllInfos();

		Assert.assertTrue(proxy.checkRight());
		Assert.assertNotNull(proxy.getVboxBo());
		Assert.assertNotNull(proxy.getBdd());
		Assert.assertNotNull(proxy.getListMachine());
	}
}

package rwb.java.bdd.bo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.testng.Assert;

import rwb.java.bdd.dao.BddServeurDAO;

public class BddServeurBOTest {

	private BddServeurBO bddBo;
	private BddServeurBO bddBOEmpty;
	private BddServeurDAO bddDAOMock;

	@Before
	public void setUp() {
		this.bddBo = new BddServeurBO();
		this.bddBOEmpty = new BddServeurBO(true);
		this.bddDAOMock = Mockito.mock(BddServeurDAO.class);
		this.bddBOEmpty.setBdd(bddDAOMock);
	}
	
	@After
	public void tearDown(){
		this.bddBo.close();
	}

	@Test
	public void accesseurAttributsTest() {
		bddBOEmpty.setBdd(bddDAOMock);
		Assert.assertEquals(bddDAOMock, bddBOEmpty.getBdd());

	}

	@Test
	public void getUserTest() throws SQLException {
		ResultSet resultSet = Mockito.mock(ResultSet.class);
		Mockito.when(resultSet.getString(1)).thenReturn("maxime");
		Mockito.when(resultSet.getString(2)).thenReturn("pajotin");
		Mockito.when(resultSet.next()).thenReturn(true).thenReturn(true).thenReturn(false);
		Mockito.when(bddDAOMock.executePrep()).thenReturn(resultSet);

		String[] users = bddBOEmpty.getUser("maxime", "123456");

		Assert.assertEquals("maxime", users[0]);
		Assert.assertEquals("pajotin", users[1]);
	}

	@Test
	public void getServeurTest() {
		Assert.assertEquals("Fourier17", this.bddBo.getServeur("2").getName());
	}

	@Test
	public void getListVmNameTest() {
		Assert.assertTrue(bddBo.getListVmName().contains("ServletTest"));
	}

	@Test
	public void getVmOwnerTest() {
		Assert.assertEquals("1", bddBo.getVmOwner("ServletTest"));
	}

	@Test
	public void getVmTest(){
		Assert.assertEquals("ServletTest", ((HashMap<String, Object>) bddBo.getVm("user", "1").get("10") ).get("name"));
	}
}

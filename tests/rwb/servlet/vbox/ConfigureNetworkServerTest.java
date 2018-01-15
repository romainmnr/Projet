package rwb.servlet.vbox;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class ConfigureNetworkServerTest {

	ConfigureNetworkServer configureNetworkServer;
	HttpServletRequest request;
	HttpServletResponse response;
	Class[] argsTypes = { HttpServletRequest.class, HttpServletResponse.class };
	Object[] args;
	String server;
	

	@Before
	public void setUp() {
		this.configureNetworkServer = new ConfigureNetworkServer();
		this.request = Mockito.mock(HttpServletRequest.class);
		this.response = Mockito.mock(HttpServletResponse.class);
		this.args = new Object[2];
		this.args[0] = request;
		this.args[1] = response;
		this.server = "2";
	}

	@Test
	public void serviceTest() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
//		this.serviceTestDeleteHostOnlyNetwork();
		this.serviceTestCreateHostOnlyNetwork();
//		this.serviceTestModifHostOnlyNetwork();
		this.serviceTestCreateNATNetwork();
		this.serviceTestDeleteNATNetwork();
		this.serviceTestGetHostOnlyNetwork();
		this.serviceTestGetNATNetwork();

	}

	private void serviceTestDeleteHostOnlyNetwork() throws IOException, NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn(server);
		Mockito.when(request.getParameter("fn")).thenReturn("deleteHostOnlyNetwork");
		Mockito.when(request.getParameter("param")).thenReturn("vboxnet1");
		this.verify();
	}

	private void serviceTestCreateHostOnlyNetwork() throws IOException, NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn(server);
		Mockito.when(request.getParameter("fn")).thenReturn("createHostOnlyNetwork");
		this.verify();

	}

	private void serviceTestModifHostOnlyNetwork() throws IOException, NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn(server);
		Mockito.when(request.getParameter("fn")).thenReturn("modifHostOnlyNetwork");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-name")).thenReturn("vboxnet0");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-ipv4")).thenReturn("192.168.56.2");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-ipv6")).thenReturn("aa:aa:aa:aa");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-ipv4Mask")).thenReturn("255.255.255.0");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-ipv6MaskLength")).thenReturn("0");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-dhcp-enable")).thenReturn("true");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-dhcp-address")).thenReturn("192.168.56.100");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-dhcp-lowerAdd")).thenReturn("192.168.56.101");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-dhcp-upperAdd")).thenReturn("192.168.56.101");
		Mockito.when(request.getParameter("cfgsrv-hostOnly-dhcp-mask")).thenReturn("255.255.255.0");
		this.verify();

	}

	private void serviceTestCreateNATNetwork() throws IOException, NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn(server);
		Mockito.when(request.getParameter("fn")).thenReturn("createNATNetwork");
		Mockito.when(request.getParameter("param")).thenReturn("NATTest");
		this.verify();

	}

	private void serviceTestDeleteNATNetwork() throws IOException, NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn(server);
		Mockito.when(request.getParameter("fn")).thenReturn("deleteNATNetwork");
		Mockito.when(request.getParameter("param")).thenReturn("NATTest");
		this.verify();
	}

	private void serviceTestGetHostOnlyNetwork() throws IOException, NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn(server);
		Mockito.when(request.getParameter("fn")).thenReturn("getHostOnlyNetwork");
		this.verify();
	}

	private void serviceTestGetNATNetwork() throws IOException, NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn(server);
		Mockito.when(request.getParameter("fn")).thenReturn("getNATNetwork");
		this.verify();

	}

	private void verify() throws IOException, NoSuchMethodException, SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		PrintWriter writer = new PrintWriter("somefile.txt");
		Mockito.when(response.getWriter()).thenReturn(writer);

		Method method = configureNetworkServer.getClass().getDeclaredMethod("service", argsTypes);
		method.invoke(configureNetworkServer, args);

		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("200"));
	}
}

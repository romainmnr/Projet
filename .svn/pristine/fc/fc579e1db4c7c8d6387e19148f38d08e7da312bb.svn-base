package rwb.servlet.machine;

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

public class ConfigureStorageTest {
	
	private ConfigureStorage configureStorage;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private PrintWriter writer;
	private Method method;
	
	@Before
	public void setUp() throws IOException, NoSuchMethodException, SecurityException{
		this.configureStorage = new ConfigureStorage();
		Class[] argsTypes = { HttpServletRequest.class, HttpServletResponse.class };
		this.method = configureStorage.getClass().getDeclaredMethod("service", argsTypes);
	}
	
	@Test
	public void serviceTest() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
		this.request = Mockito.mock(HttpServletRequest.class);
		this.response = Mockito.mock(HttpServletResponse.class);
		this.writer = new PrintWriter("somefile.txt");

		Mockito.when(response.getWriter()).thenReturn(writer);
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn("2");
		Mockito.when(request.getParameter("vm-page-vm")).thenReturn("ServletModifMachineTest");
		Mockito.when(request.getParameter("fn")).thenReturn("addCtrl");
		Mockito.when(request.getParameter("param")).thenReturn("floppy");
		
		Object[] args = { request, response };
		this.method.invoke(configureStorage, args);

		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("200"));
	}

	@Test
	public void serviceTest_1() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
		this.request = Mockito.mock(HttpServletRequest.class);
		this.response = Mockito.mock(HttpServletResponse.class);
		this.writer = new PrintWriter("somefile.txt");
	
		Mockito.when(response.getWriter()).thenReturn(writer);
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn("2");
		Mockito.when(request.getParameter("vm-page-vm")).thenReturn("ServletModifMachineTest");
		Mockito.when(request.getParameter("fn")).thenReturn("addCtrl");
		Mockito.when(request.getParameter("param")).thenReturn("floppy");
		
		Object[] args = { request, response };
		this.method.invoke(configureStorage, args);
	
		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("200"));
	}
	
	@Test
	public void serviceTest_2() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
		this.request = Mockito.mock(HttpServletRequest.class);
		this.response = Mockito.mock(HttpServletResponse.class);
		this.writer = new PrintWriter("somefile.txt");

		Mockito.when(response.getWriter()).thenReturn(writer);
		Mockito.when(request.getParameter("vm-page-srv")).thenReturn("2");
		Mockito.when(request.getParameter("vm-page-vm")).thenReturn("ServletModifMachineTest");
		Mockito.when(request.getParameter("fn")).thenReturn("removeCtrl");
		Mockito.when(request.getParameter("param")).thenReturn("floppy");
		
		Object[] args = { request, response };
		this.method.invoke(configureStorage, args);

		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("200"));
	}
}

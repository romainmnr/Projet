package rwb.servlet.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class ConnectionServletTest {

	private ConnectionServlet connectionServlet;

	@Before
	public void setUp() {
		this.connectionServlet = new ConnectionServlet();
	}

	@Test
	public void serviceTest() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
		HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse response = Mockito.mock(HttpServletResponse.class);
		HttpSession session = Mockito.mock(HttpSession.class);

		Mockito.when(request.getSession()).thenReturn(session);

		Mockito.when(request.getAttribute("login-autoLoggin")).thenReturn(true, null);
		Mockito.when(request.getParameter("login-username")).thenReturn("admin", "truc");
		Mockito.when(request.getParameter("login-password")).thenReturn("admin", "bidule");
		Mockito.when(request.getAttribute("login-username")).thenReturn("admin");
		Mockito.when(request.getAttribute("login-password")).thenReturn("admin");
		Mockito.when(request.getParameter("login-remember-me")).thenReturn("yes", "yes", null);

//		Mockito.doCallRealMethod().when(session).setAttribute(Mockito.any(), Mockito.any());
//		Mockito.doCallRealMethod().when(session).invalidate();

		PrintWriter writer = new PrintWriter("somefile.txt");
		Mockito.when(response.getWriter()).thenReturn(writer);

		Class[] argsTypes = { HttpServletRequest.class, HttpServletResponse.class };
		Object[] args = { request, response };
		Method method = connectionServlet.getClass().getDeclaredMethod("service", argsTypes);
		
		method.invoke(connectionServlet, args);
		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(
				FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("200"));

		method.invoke(connectionServlet, args);
		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(
				FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("200"));

		method.invoke(connectionServlet, args);
		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(
				FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("503"));

	}
}

package rwb.servlet.general;

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

import rwb.java.divers.HashmapBO;

public class SessionTest {

	private Session session;

	@Before
	public void setUp() {
		this.session = new Session();
	}

	@Test
	public void serviceTest() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
	InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException  {
		HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse response = Mockito.mock(HttpServletResponse.class);
		HttpSession httpSession = Mockito.mock(HttpSession.class);
		HashmapBO mapBo = Mockito.mock(HashmapBO.class);
		
		Mockito.when(mapBo.getNetwork()).thenReturn(null);
		Mockito.when(httpSession.getAttribute("mapMachine")).thenReturn(mapBo, null);
		Mockito.when(request.getSession()).thenReturn(httpSession);
		Mockito.when(request.getParameter("param")).thenReturn("mapMachine");

		
		PrintWriter writer = new PrintWriter("somefile.txt");
		Mockito.when(response.getWriter()).thenReturn(writer);

		Class[] argsTypes = { HttpServletRequest.class, HttpServletResponse.class };
		Object[] args = { request, response };
		Method method = session.getClass().getDeclaredMethod("service", argsTypes);
		method.invoke(session, args);

		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(
				FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("200"));
		

		method.invoke(session, args);

		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(
				FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("500"));
	}

}

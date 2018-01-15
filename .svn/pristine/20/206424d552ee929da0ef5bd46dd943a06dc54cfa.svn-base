
package rwb.servlet.general;

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
import org.junit.Test;
import org.mockito.Mockito;

public class BddServletTest {

	@Test
	public void serviceTest()
			throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
		BddServlet bddServlet = new BddServlet();
		HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse response = Mockito.mock(HttpServletResponse.class);

		Mockito.when(request.getParameter("fn")).thenReturn("toogleServer");
		
		PrintWriter writer = new PrintWriter("somefile.txt");
		Mockito.when(response.getWriter()).thenReturn(writer);

		Class[] argsTypes = { HttpServletRequest.class, HttpServletResponse.class };
		Object[] args = { request, response };
		Method method = bddServlet.getClass().getDeclaredMethod("service", argsTypes);
		method.invoke(bddServlet, args);

		writer.flush(); // it may not have been flushed yet...
		Assert.assertTrue(
				FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("200"));
	}
}

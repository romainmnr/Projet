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
import org.junit.Test;
import org.mockito.Mockito;

import rwb.servlet.machine.DeleteMachine;

public class SidebarContentTest {

	@Test
	public void serviceTest() throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {

		SidebarContent sidebarContent = new SidebarContent();
		HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse response = Mockito.mock(HttpServletResponse.class);
		HttpSession session = Mockito.mock(HttpSession.class);

		Mockito.when(request.getSession()).thenReturn(session);
		Mockito.when(session.getAttribute("login-id")).thenReturn("1");

		PrintWriter writerCreate = new PrintWriter("somefile.txt");
		Mockito.when(response.getWriter()).thenReturn(writerCreate);

		Class[] argsTypes = { HttpServletRequest.class, HttpServletResponse.class };
		Object[] args = { request, response };
		Method methodCreate = sidebarContent.getClass().getDeclaredMethod("service", argsTypes);
		methodCreate.invoke(sidebarContent, args);

		writerCreate.flush(); // it may not have been flushed yet...
		Assert.assertNotNull(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8"));
	}
}

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
import org.junit.Test;
import org.mockito.Mockito;

public class PreviewStateMachineTest {

	@Test
	public void previewStateMachine()
			throws ServletException, IOException, IllegalAccessException, IllegalArgumentException,
			InvocationTargetException, NoSuchMethodException, SecurityException, NoSuchFieldException {
		PreviewStateMachine previewStateMachine = new PreviewStateMachine();
		HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
		HttpServletResponse response = Mockito.mock(HttpServletResponse.class);

		Mockito.when(request.getParameter("vm-page-srv")).thenReturn("2");
		Mockito.when(request.getParameter("vm-page-vm")).thenReturn("ServletTest");

		PrintWriter writer = new PrintWriter("somefile.txt");
		Mockito.when(response.getWriter()).thenReturn(writer);

		Class[] argsTypes = { HttpServletRequest.class, HttpServletResponse.class };
		Object[] args = { request, response };
		Method method = previewStateMachine.getClass().getDeclaredMethod("service", argsTypes);
		method.invoke(previewStateMachine, args);

		writer.flush(); // it may not have been flushed yet...
		System.out.println(FileUtils.readFileToString(new File("somefile.txt"), "UTF-8"));
		Assert.assertTrue(
				FileUtils.readFileToString(new File("somefile.txt"), "UTF-8").contains("Preview and State - ok"));
	}
}

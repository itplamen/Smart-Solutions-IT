package bg.jwd.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bg.jwd.contracts.IConstants;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest httpRequest, HttpServletResponse httpResponse) 
			throws ServletException, IOException {
		
		httpRequest.getSession().invalidate();
		httpResponse.sendRedirect(httpRequest.getContextPath() + IConstants.HOME_PAGE);
	}
}

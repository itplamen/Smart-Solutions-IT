package bg.jwd.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bg.jwd.contracts.IConstants;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest httpRequest, HttpServletResponse httpResponse) 
			throws ServletException, IOException {
		
		String username = httpRequest.getParameter(IConstants.USERNAME_PARAMETER);
		String password = httpRequest.getParameter(IConstants.PASSWORD_PARAMETER);
		
		HttpSession session = httpRequest.getSession();
		
		if (username.equals(IConstants.ADMIN_USERNAME) && password.equals(IConstants.ADMIN_PASSWORD)) {
			session.setAttribute(IConstants.USERNAME_PARAMETER, username);
			session.setAttribute(IConstants.PASSWORD_PARAMETER, password);
			httpResponse.sendRedirect(httpRequest.getContextPath() + IConstants.HOME_PAGE);
		}
		else {
			session.setAttribute(IConstants.USERNAME_PARAMETER, IConstants.INVALID_PARAMETER);
			session.setAttribute(IConstants.PASSWORD_PARAMETER, IConstants.INVALID_PARAMETER);
			
			RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(IConstants.LOGIN_PAGE);
			dispatcher.forward(httpRequest, httpResponse);
		}
	}
}

package bg.jwd.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bg.jwd.contracts.IConstants;

@WebFilter({"/Login", "/Employees/*"})
public class AuthenticationFilter implements Filter {
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		HttpSession session = httpRequest.getSession();
		boolean isLoggedIn = session != null && session.getAttribute(IConstants.USERNAME_PARAMETER) != null 
				&& session.getAttribute(IConstants.USERNAME_PARAMETER).equals(IConstants.ADMIN_USERNAME);
		
		if (!isLoggedIn) {
			String requestedPage = this.getRequestedPage(httpRequest);
			
			if (requestedPage.equals(IConstants.EMPTY_URL)) {
				httpResponse.sendRedirect(IConstants.LOGIN_PAGE);
				return;
			}
			
			if (requestedPage.equals(IConstants.LOGIN_PAGE) ||
					requestedPage.equals(IConstants.ALL_EMPLOYEES_SERVLET)) {
				filterChain.doFilter(request, response);
				return;
			}
			
			if (!requestedPage.equals(IConstants.LOGIN_PAGE)) {
				httpResponse.sendRedirect(httpRequest.getContextPath() + IConstants.HOME_PAGE);
				return;
			}
		} 	
		else {
			filterChain.doFilter(request, response);
			return;
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	private String getRequestedPage(HttpServletRequest httpRequest) {
		String url = httpRequest.getRequestURI();
		int firstSlash = url.indexOf("/", 1);
		String requestedPage = null;
		
		if (firstSlash != -1) {
			requestedPage = url.substring(firstSlash, url.length());
		}
		
		return requestedPage;
	}
}

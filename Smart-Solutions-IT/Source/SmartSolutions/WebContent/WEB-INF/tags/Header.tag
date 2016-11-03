<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@tag import="bg.jwd.contracts.IConstants"%>
<%@tag import="bg.jwd.servlets.LogoutServlet"%>

<%-- Disable browser caching --%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-cache");
%>

<header>
	<div id="SiteTitle">
		<h1><a href="/SmartSolutions">Smart Solutions IT</a></h1>
		<p>We love to solve problems</p>
	</div>
	
	<div id="Login">
		<c:set var="username" value="<%= request.getSession().getAttribute(IConstants.USERNAME_PARAMETER) %>" scope="page" />
		<c:set var="password" value="<%= request.getSession().getAttribute(IConstants.PASSWORD_PARAMETER) %>" scope="page" />
		<c:set var="searchFieldText" value="Search by name, e-mail, job position ..." scope="page" />
		<c:set var="invalid" value="<%= IConstants.INVALID_PARAMETER %>" scope="page" />
		
		<c:choose>
			<c:when test="${(empty username || username == invalid) && (empty password || password == invalid)}">
				<p>
					<a href="${pageContext.request.contextPath}<%= IConstants.LOGIN_PAGE %>#AuthenticationForm">
						Login
					</a>
				</p>
			</c:when>
			<c:otherwise>
				<p>
					Hello, ${username} | 
					<a href="${pageContext.request.contextPath}/LogoutServlet">
						Logout
					</a>
				</p>
			</c:otherwise>
		</c:choose>
		
		<form method="get" action="/SmartSolutions/Employees/Search?search="<%= IConstants.SEARCH_PARAMETER %>>
			<p>
				<input type="search" id="SearchTextField" class="ui-widget" name="search" 
				placeholder="Search employee ..." title="${searchFieldText}" required />
			</p>
		</form>
	</div>
</header>
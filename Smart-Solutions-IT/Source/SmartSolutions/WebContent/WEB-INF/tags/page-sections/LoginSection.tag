<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag import="bg.jwd.contracts.IConstants"%>

<%@ attribute name="sectionTitle" %>

<c:set var="username" value="<%= request.getSession().getAttribute(IConstants.USERNAME_PARAMETER) %>" />
<section>
	<h2>${sectionTitle}</h2>
	
	<c:choose>
		<c:when test="${not empty username}">
			<div class="infoMessageBox">
				<img src="images/info.png" alt="Info Image" />
				<span>You are already logged in ass <strong>${username}!</strong></span>
			</div>
		</c:when>
		<c:otherwise>
			<div class="infoMessageBox">
				<img src="images/info.png" alt="Info Image" />
				<span>To perform Update and Delete operations:</span>
			
				<ul id="UpdateDeleteEmployeeStepsUL">
					<li>Search for certain employee by name, e-mail, telephone number ... </li>
					<li>Click on the result to see the employee's profile.</li>
					<li>Then click on the buttons 'Update' and 'Delete'.</li>
				</ul>
			</div>
						
			<p class="infoText">You need to be logged in as <span class="boldText">Administrator!</span></p>
			<p class="infoText">Username: <%= IConstants.ADMIN_USERNAME %>, 
			Password: <%= IConstants.ADMIN_PASSWORD %></p>	
		
			<form method="post" action="${pageContext.request.contextPath}/LoginServlet" id="AuthenticationForm">
				<label for="UsernameTextField">Username:</label>
				<input type="text" id="UsernameTextField" name="<%= IConstants.USERNAME_PARAMETER %>" required />
				<br/>
							
				<label for="PasswordTextField">Password:</label>
				<input type="password" id="PasswordTextField" name="<%= IConstants.PASSWORD_PARAMETER %>" required /> 
				<br/>
							
				<input type="submit" value="Login" id="LoginButton"/>
			</form>
		</c:otherwise>
	</c:choose>
</section>
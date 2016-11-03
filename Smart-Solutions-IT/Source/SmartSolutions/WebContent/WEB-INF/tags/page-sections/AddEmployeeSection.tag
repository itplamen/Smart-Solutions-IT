<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@tag import="bg.jwd.contracts.IConstants"%>
<%@tag import="bg.jwd.models.Gender"%>

<%@ attribute name="sectionTitle" %>

<section>
	<h2>${sectionTitle}</h2>
	
	<form method="post" action="${pageContext.request.contextPath}/AddEmployeeServlet" id="AddEmployeeForm">
		<label for="FirstNameTextField">First Name (*):</label>
		<input type="text" id="FirstNameTextField" name="firstName" required />
		<br/>
		
		<label for="LastNameTextField">Last Name (*):</label>
		<input type="text" id="LastNameTextField" name="lastName" required />
		<br/>
		
		<label for="JobPositionTextField">Job Position:</label>
		<input type="text" id="JobPositionTextField" name="jobPosition" />
		
		<label for="DepartmentSelectField">Department (*):</label>
		<select id="DepartmentSelectField" name="department">
			<c:forEach var="department" items="<%= IConstants.DEFAULT_DEPARTMENTS %>">
				<option value="${department}">${department}</option>
			</c:forEach>
		</select>
		
		<label for="GenderSelectField">Gender (*):</label>
		<select id="GenderSelectField" name="gender">
			<option value="<%= Gender.Male %>" selected><%= Gender.Male %></option>
			<option value="<%= Gender.Female %>"><%= Gender.Female %></option>
		</select>
		
		<label for="DateOfBirthTextField">Date of Birth (*):</label>
		<input type="date" id="DateOfBirthTextField" name="dateOfBirth" required />
		<br/>
		
		<label for="PhoneNumberTextField">Phone Number:</label>
		<input type="text" id="PhoneNumberTextField" name="phoneNumber" />
		<br/>
		
		<label for="EmailAddressTextField">E-mail: Address (*):</label>
		<input type="email" id="EmailAddressTextField" name="emailAddress" required />
		<br/>
		
		<input type="submit" id="AddtEmployeeBtn" value="Add" />
		<input type="reset" value="Clear" />
	</form>
</section>

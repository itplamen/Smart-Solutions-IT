<%@tag import="bg.jwd.contracts.IConstants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@tag import="bg.jwd.models.Employee"%>
<%@tag import="java.util.List"%>

<%@ attribute name="sectionTitle" %>

<c:set var="search" value="<%= request.getSession().getAttribute(IConstants.SEARCH_PARAMETER) %>"/>
<c:set var="matchedEmployees" value="<%= request.getSession().getAttribute(IConstants.MATCHED_PARAMETER) %>"/>
		
<section>
	 <h2>${sectionTitle}</h2>
	 
	<c:choose>
		<c:when test="${not empty matchedEmployees}">
		
			<c:forEach var="employee" items="${matchedEmployees}">
				<div class="matchedEmployeesDiv" data-href="${pageContext.request.contextPath}/Employees/Profile/${employee.getID()}">					
					<c:choose>
						<c:when test="${employee.getGender() == 'Male'}">
							<img class="searchedEmployeeImage" src="../images/male-employee.png" alt="Employee Picture" />
						</c:when>
						<c:otherwise>
							<img class="searchedEmployeeImage" src="../images/female-employee.png" alt="Employee Picture" />
						</c:otherwise>
					</c:choose>
					
					<p>${employee.getFirstName()} ${employee.getLastName()}</p>
					<p>${employee.getEmailAddress()}</p>
					<p>${employee.getDateOfBirth()}</p>
				</div>
			</c:forEach>
			
		</c:when>
		<c:otherwise>
			<p class="infoText">We couldn't find anything for <strong>${search}</strong>. 
			Search again with different word!</p>
		</c:otherwise>
	</c:choose>
		
</section>
	

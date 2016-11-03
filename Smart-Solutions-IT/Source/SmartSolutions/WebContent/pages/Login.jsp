<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="ct" uri="http://jwd.bg/tags" %>

<%@page import="bg.jwd.contracts.IConstants"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="css/style.css"/>
	<link type="text/css" rel="stylesheet" href="css/jquery-ui.min.css"/>
	<script type="text/javascript" src="js/lib/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="js/lib/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/AutocompleteTags.js"></script>
	<title>Login</title>		
</head>
<body>	
	<ct:Header/>
	<ct:Navigation/>
	<ct:LoginSection sectionTitle="Login" />
	<ct:Footer/>
	
	<script type="text/javascript" src="js/Message.js"></script>
	<script type="text/javascript" src="js/Events.js"></script> 
	
	<script>
		(function($) {
			var username = '${username}',
				password = '${password}',
				$authenticationForm = $('#AuthenticationForm');
			
			if ((username !== '' && username === '<%= IConstants.INVALID_PARAMETER %>') || 
					(password !== '' && password === '<%= IConstants.INVALID_PARAMETER %>')) {
				
				Message.displayErrorMessage($authenticationForm, 'Invalid data access!');
			}
			
			$(window).on('beforeunload', function() {
				Message.deleteMessages();
				
				<% 
					request.getSession().removeAttribute(IConstants.USERNAME_PARAMETER);
					request.getSession().removeAttribute(IConstants.PASSWORD_PARAMETER);
				%>
			});
		}(jQuery));
	</script>	
</body>
</html>
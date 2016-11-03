$(document).ready(function() {
	'use strict';
	
	$('#SortEmployeesSelect').change(function() {
		var servletURL = $(this).find(':selected').val();
		
		if (servletURL.length > 0) {
			document.location.href = servletURL;
		}
	});

	$(function() {
		$('#dialog-confirm').dialog({
			autoOpen: false,
			resizable: false,
			height: 'auto',
			width: 400,
			modal: true,
			buttons: {
				'Delete': function() {
					var url = $('#DeleteEmployeeHref').attr('href'),
						id = getParameterByName('deleteID', url);
					
					HttpRequest.deleteEmployee(url)
						.then(function(data) {
							document.location = 'http://localhost:8085/SmartSolutions/Employees/Profile/' + id;
						},
			            function(data) {
			                alert('Error! Cannot delete employee!');
						});
					
					$(this).dialog('close');
				},
				Cancel: function() {
					$(this).dialog('close');
				}
			}
		});
		
		$('#DeleteEmployeeHref').on('click', function(event) {
			event.preventDefault();  
			$('#dialog-confirm').dialog('open');
		});
	});
	
	function getParameterByName(name, url) {
		var regex,
			results;
		
	    if (!url) {
	    	throw new Error('URL cannot be empty ot null!');
	    }
	    
	    name = name.replace(/[\[\]]/g, "\\$&");
	    regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
	    results = regex.exec(url);
	    
	    if (!results) {
	    	return null;
	    }
	    
	    if (!results[2]) {
	    	return '';
	    }
	    
	    return decodeURIComponent(results[2].replace(/\+/g, " "));
	}
});
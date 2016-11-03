Message = (function($) {
	'use strict';
	
    function displayErrorMessage($element, messageText) {
    	var $errorImage = $('<img src="images/error.png" alt="Error Image" />'),
    		$errorMessageBox = $('<div class="errorMessageBox" />'),
    		$span = $('<span/>').html(messageText);
    		
    	$errorMessageBox
	    	.append($errorImage)
	    	.append($span)
	    	.insertBefore($element);
    }
    
    function displaySuccessMessage($element, messageText) {
		var $successImage = $('<img src="../images/success.png" alt="Success Image" />'),
			$successMessageBox = $('<div class="successMessageBox" />'),
			$span = $('<span/>').html(messageText);
		
		$successMessageBox
			.append($successImage)
			.append($span)
			.insertBefore($element);
	}
    
    function displayInfoMessage($element, messageText) {
    	var $infoImage = $('<img src="../images/info.png" alt="Info Image" />'),
			$infoMessageBox = $('<div class="infoMessageBox" />'),
			$span = $('<span/>').html(messageText);
    	
    	$infoMessageBox
    		.append($infoImage)
    		.append($span)
			.insertBefore($element);
	}
    
    // Deletes only error and success messages.
    function deleteMessages() {
		if ($('.errorMessageBox').length) {
			$('.errorMessageBox').detach();
		}
		
		if ($('.successMessageBox').length) {
			$('.successMessageBox').detach();
		}
	}
    
    return {
    	displayErrorMessage: displayErrorMessage,
    	displaySuccessMessage: displaySuccessMessage,
    	displayInfoMessage: displayInfoMessage,
    	deleteMessages: deleteMessages
    };
    
}(jQuery));
    
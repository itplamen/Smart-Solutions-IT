(function($) {
	$(function() {
	    var availableTags = [
	      'Ivan',
	      'Dimitur',
	      'Anelia',
	      'Plamen',
	      'Developer',
	      'Nikolay',
	      'QA',
	      'Manager',
	      'Nina',
	      'Maria',
	      'Ivanov',
	      'Gergana',
	      'Sales',
	      'Stocker',
	      'Java',
	      'JavaScript',
	      '@gmail',
	      '.Net',
	      'Java',
	      'Python',
	      'Tanya',
	      'Hristo',
	      'Dekov',
	      'Male',
	      'Female',
	      'Engineering',
	      'Marketing',
	      'Kiril',
	      'Kasheva',
	      'CEO',
	      'CFO',
	      'Vice President'
	    ];
	    
	    $('#SearchTextField').autocomplete({
	    	source: availableTags
	    });
	});
}(jQuery));

$ ->	
	$('#vendor-picture.no-url').click ->
		$('.file-upload-hidden').trigger('click');
	$('.dropdown-toggle').dropdown()
	$('.bid-links > .link').click ->
		target = $(this).attr("target")
		$(target).slideDown('slow')
	$('.current-filter').click ->
		$('.filter-options').show();
		# ...
	
	

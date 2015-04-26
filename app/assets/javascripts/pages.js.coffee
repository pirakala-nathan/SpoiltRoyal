# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.dtoggle').click ->
		target = "." + this.id
		$(target).toggleClass('hidden')
	$('.post-a-q').click ->
		$('#post-a-q').modal("show")
	$('.bid_now').click ->
		$('#bid_now').modal("show")
	$('.login').click ->
		$('#login').modal("show")
	$('.join').click ->
		$('#join').modal("show")
	$('.seeking').click ->
		$('.slide-1').hide();
		$('.slide-2').show();
		$('.account-type').attr("value","Consumer")
		$('.fb-signup').attr("href","/auth/facebook?type=Consumer")
	$('.offering').click ->
		$('.slide-1').hide();
		$('.slide-2').show();
		$('.account-type').attr("value","Vendor")
		$('.fb-signup').attr("href","/auth/facebook?type=Vendor")
	$('.email-signup').click ->
		$('.slide-2').hide();
		$('.slide-3').show();
	$('#join').on 'hidden.bs.modal', ->
		$('.slide-2').hide();
		$('.slide-3').hide();
		$('.slide-1').show();
	$('.number-of-p-locations').change ->
		NumberLocation = $('.address-label').length;
		value = $(this).val()
		alert( NumberLocation)
		if NumberLocation > value
			while NummberLocation > value
				$('.remove-p-location').last().click();
				NumberLocation
		else if value > NumberLocation
			while value >= NumberLocation
				$('.add-p-location').last().click();
				NumberLocation += 1
			# ...
		
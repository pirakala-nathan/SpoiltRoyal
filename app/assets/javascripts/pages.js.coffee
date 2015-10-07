# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('.stars').raty()
	$('.dtoggle').click ->
		target = "." + this.id
		$(target).toggleClass('hidden')
	$('.new-review').click ->
		$('#new-review').modal("show")
	$('.post-new').click ->
		$('#post-new').modal("show")
	$('.post-a-q').click ->
		$('#post-a-q').modal("show")
	$('.bid_now').click ->
		$('#bid_now').modal("show")
	$('.login').click ->
		$('#login').modal("show")
	$('.join').click ->
		$('#join').modal("show")
	$('.seeking').click ->
		$('.slide-1').addClass('hidden')
		$('.slide-2').removeClass('hidden');
		$('.account-type').attr("value","Consumer")
		$('.fb-signup').attr("href","/auth/facebook?type=Consumer")
	$('.offering').click ->
		$('.slide-1').addClass('hidden')
		$('.slide-2').removeClass('hidden');
		$('.account-type').attr("value","Vendor")
		$('.fb-signup').attr("href","/auth/facebook?type=Vendor")
	$('.email-signup').click ->
		$('.slide-2').addClass('hidden')
		$('.slide-3').removeClass('hidden');
	$('#join').on 'hidden.bs.modal', ->
		$('.slide-2').addClass('hidden')
		$('.slide-3').addClass('hidden')
		$('.slide-1').removeClass('hidden');
	$('.join-slide-2').click ->
		if $('.slide-1').hasClass('hidden')
			$('.slide-1').addClass('hidden')
			$('.slide-3').addClass('hidden')
			$('.slide-2').addClass('hidden')
			$('.slide-2').removeClass('hidden');

	$('.join-slide-1').click ->	
		if $('.slide-1').hasClass('hidden')
			$('.slide-1').addClass('hidden')
			$('.slide-3').addClass('hidden')
			$('.slide-2').addClass('hidden')
			$('.slide-1').removeClass('hidden');
			$('.account-type').attr("value","")

	$('.join-slide-3').click ->
		if $('.slide-1').hasClass('hidden')
			$('.slide-1').addClass('hidden')
			$('.slide-3').addClass('hidden')
			$('.slide-2').addClass('hidden')
			$('.slide-3').removeClass('hidden');
	$('.add-p-location').click ->
		setTimeout (->
			country = parseInt $('.country-select:eq(0) option:selected').val();
			province = parseInt $('.province-select:eq(0) option:selected').val() ;
			city = parseInt $('.city-select:eq(0) option:selected').val();
			num = $('.country-select').length;
			num = num - 2
			$('.country-select:eq('+num+') option:eq('+country+')').prop('selected', true);
			$('.province-select:eq('+num+') option:eq('+province+')').prop('selected', true);
			$('.citry-select:eq('+num+') option:eq('+citry+')').prop('selected', true);
		), 500
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
		
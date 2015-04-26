# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
# for the post form datepicker
  $('.more-or-less').click ->
    if $(this).hasClass('view-less')
      $('.rest-of-bids').slideUp('slow');
      $(this).removeClass('view-less')
      $(this).html('View More')
      $(this).addClass('view-more')
    else
      $('.rest-of-bids').slideDown('slow');
      $(this).addClass('view-less')
      $(this).html('View Less')
      $(this).removeClass('view-more')
  $('.more-or-less-comments').click ->
    if $(this).hasClass('view-less')
      $('.rest-of-comments').slideUp('slow');
      $(this).removeClass('view-less')
      $(this).html('View More')
      $(this).addClass('view-more')
    else
      $('.rest-of-comments').slideDown('slow');
      $(this).addClass('view-less')
      $(this).html('View Less')
      $(this).removeClass('view-more')
	$('.datepicker').datepicker();
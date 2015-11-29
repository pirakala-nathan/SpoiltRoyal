# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
# for the post form datepicker
  $('.datepicker').datepicker
    autoclose: true
  $('.post-your-own.next').click ->
    $('.slide-1').hide();
    $('.submit.slide-2').removeClass('slide-2')
    $('.slide-2').css('display','block')
  $('.add-img').click -> 
    $('.img-btn.non-hidden').click();
  $('.img-btn.non-hidden').change ->
    pictureName = $(this).val()
    $(this).removeClass('non-hidden')
    $('.next-imgs').append('<input class="img-btn non-hidden" id="images_" multiple="multiple" name="images[]" type="file">')
    pictureName = pictureName.replace('C:\\fakepath\\','')
    alert pictureName
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
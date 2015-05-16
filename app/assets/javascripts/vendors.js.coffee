# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.stars-raiting.form > img').click ->
    val = $('.stars-raiting > input ').val()
    $('.raiting').val(val)
    $('.raiting-form').submit();
  $('.read-more-des').click ->
    $('.description').removeClass('less')
    $(this).hide();
    $('.read-less-des').show();
  $('.read-less-des').click ->
    $('.description').addClass('less')
    $(this).hide();
    $('.read-more-des').show();
  $('.delivery-btn').click ->
    if $(this).hasClass('slideup')
      $('.delivery-locations').slideUp('slow')
      $(this).removeClass('slideup')  
    else
      $('.delivery-locations').slideDown('slow')
      $(this).addClass('slideup')
  $('.service-btn').click ->
    if $(this).hasClass('slideup')
      $('.service-locations').slideUp('slow')
      $(this).removeClass('slideup')  
    else
      $('.service-locations').slideDown('slow')
      $(this).addClass('slideup')
  $('.next-vendor-slide').click ->
    target = $(this).attr('target')
    prev = $(this).attr('prev')
    $(prev).hide();
    $(target).css('display','block')
    if target == '.slide-2'

      $(this).html("Almost Done")
      nexTarget = '.slide-3'
      $(this).attr('prev', target)
      $(this).attr('target', nexTarget)
    else if target == '.slide-3' 
      $(this).hide();
      $(".next-vendor-slide.slide-3").css('display','inline-block')
  $('.file-upload-trigger').click ->
    $('.file-upload-hidden').trigger('click');
  $('.file-cover-trigger').click ->
    $('.file-cover-hidden').trigger('click');
  $('.file-media-trigger').click ->
    $('.file-media-hidden').trigger('click');
  document.getElementById('vendor_assets_attributes_1_image').onchange = ->
    file = this.value
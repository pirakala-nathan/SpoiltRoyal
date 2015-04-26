# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
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
  document.getElementById('vendor_assets_attributes_1_image').onchange = ->
    file = this.value
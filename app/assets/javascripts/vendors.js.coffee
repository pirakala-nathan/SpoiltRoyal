# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



checkPostal = (code,letter) ->
  length = code.length
  length = length % 2

  if length == 1
    pCodePattern = new RegExp('[a-z]','i')
  else
    pCodePattern = new RegExp('[0-9]','i')
  if pCodePattern.test(letter)
    true
  else
    false
$ ->
  if $('.vendor-form').hasClass('new-false')
    $('.remove-p-location').last().trigger('click')
    # ...
  
  $('.postal').keyup (e)->
    letter = String.fromCharCode(e.which)
    code = $(this).val();
    if !(checkPostal(code,letter))
      code= code.slice(0,-1)
      $(this).val(code)

  $('.final-submit').click (e)->
    error = false;
    $('.required.first').each ->
      if $(this).val() == ""
        $('.vf-slide-toggle').removeClass('active')
        $('.vf-slide-1-toggle').addClass('active')
        $('.slide-1').hide()
        $('.slide-2').hide()
        $('.slide-3').hide()
        $('.slide-1').css('display','inline-block')
        $(this).css('border','1px solid red')
        error = true
      else
        $(this).css('border','1px solid #ffc285')
        # ...
    if error
      e.preventDefault()
      
   
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
  $('.vf-slide-toggle').click ->
    $('.vf-slide-toggle').removeClass('active')
    $(this).addClass('active')
    if $(this).hasClass('vf-slide-1-toggle')
      $('.slide-1').hide()
      $('.slide-2').hide()
      $('.slide-3').hide()
      $('.slide-1').css('display','inline-block')
    if $(this).hasClass('vf-slide-2-toggle')
      $('.slide-1').hide()
      $('.slide-2').hide()
      $('.slide-3').hide()
      $('.slide-2').css('display','inline-block')
    if $(this).hasClass('vf-slide-3-toggle')
      $('.slide-1').hide()
      $('.slide-2').hide()
      $('.slide-3').hide()
      $('.slide-3').css('display','inline-block')
  $('.next-vendor-slide').click ->
    target = $(this).attr('target')
    prev = $(this).attr('prev')
    $(prev).hide();
    $(target).css('display','block')
    if target == '.slide-2'
      $('.prev-vendor-slide').removeClass('hidden')
      $(this).html("Almost Done")
      nexTarget = '.slide-3'
      $(this).attr('prev', target)
      $(this).attr('target', nexTarget)
    else if target == '.slide-3' 
      $(this).hide();
      $('.prev-vendor-slide').attr('current','.slide-3')
      $('.prev-vendor-slide').attr('target','.slide-2')
      $(".next-vendor-slide.slide-3").css('display','inline-block') 
  
  $('.prev-vendor-slide').click ->
    target = $(this).attr('target')
    current = $(this).attr('current')
    $(current).hide();
    $(target).css('display','block')
    nextDiv = $(".next-vendor-slide.next")
    if target == '.slide-2'
      nexTarget = '.slide-1'
      $(this).attr('current', target)
      $(this).attr('target', nexTarget)
      $(nextDiv).css('display','inline-block')        
      $(nextDiv).html("Almost Done")
      nexTarget = '.slide-3'
      $(nextDiv).attr('prev', target)
      $(nextDiv).attr('target', nexTarget)

    else if target == '.slide-1' 
      $(this).addClass('hidden');
      $(nextDiv).html('Next')
      nexTarget = '.slide-2'
      $(nextDiv).attr('prev', target)
      $(nextDiv).attr('target', nexTarget)

      
  $('.file-upload-trigger').click ->
    $('.file-upload-hidden').trigger('click');
  $('.file-cover-trigger').click ->
    $('.file-cover-hidden').trigger('click');
  $('.file-media-trigger').click ->
    $('.file-media-hidden').trigger('click');
  $('.file-media-hidden').change ->
      num = $(this)[0].files.length
      msg = num + " IMAGES SELECTED FOR SHOW"
      $('.file-media-trigger > span').text(msg)
      $('.file-media-trigger').addClass('image-selected')
  $('#cover_pic_').change (e) ->
      msg = " Cover Picture: " + $(this).val().split("\\").pop()
      $('.file-cover-trigger > span').text(msg)
      $('.file-cover-trigger').addClass('image-selected')
  $('#profile_pic_').change (e) ->
    msg = "Profile Picture: " + $(this).val().split("\\").pop()
    $('.file-upload-trigger > span').text(msg)
    $('.file-upload-trigger').addClass('image-selected')

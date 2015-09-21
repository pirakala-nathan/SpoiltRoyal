$ ->
  $('.close_notice').on 'click', ->
    $('.notice').hide()
  
$(window).scroll ->
  if $(window).scrollTop() + $(window).height() == $(document).height()
    $('#feedback-modal').modal('show');
  return
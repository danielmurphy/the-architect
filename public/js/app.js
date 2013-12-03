$(document).on('ready', function(){
  $('.output .button').on('click', function(e){
    e.preventDefault()
    $(e.target).closest('.output').find('.inputs').slideToggle()
  });

  $('.inputs .button').on('click', function(e){
    e.preventDefault()
    $target = $(e.target);
    output = $target.closest('.inputs').slideUp().data('value')
    input = $target.data('value')
    $.ajax({
      url: 'http://hdmi.dev:4567',
      type: 'POST',
      data: {
        'output': output,
        'input': input
      }
    });
  });
});

$(function() {
    FastClick.attach(document.body);
});
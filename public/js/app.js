
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
      url: '/',
      type: 'POST',
      data: {
        'output': output,
        'input': input
      }
    });
  });

  $('.preset.button').on('click', function(e){
    preset = $(e.target).data('value');
    $.ajax({
      url: '/preset',
      type: 'POST',
      data: {
        preset: preset
      }
    });
  });

});

$(function() {
    FastClick.attach(document.body);
});
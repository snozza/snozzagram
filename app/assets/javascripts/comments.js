var ready;
ready = function() {
  $('.new_comment').on('submit', function(event) {
    event.preventDefault();
    var comment = $(this).children('#comment_body')
    var action = $(this).attr('action')
    $.post(action, {body: comment.val() }, function(data) {
      $('.comments').append(data.new_comment);
    }).fail(function() {
      alert('You need to write something!')
    }).always(function() {
      comment.val('');
    });
  });
}

$(document).ready(ready);
$(document).on('page:load',ready);

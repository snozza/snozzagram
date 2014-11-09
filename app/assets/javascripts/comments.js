$(document).ready(function() {

  $('.new_comment').on('submit', function(event) {
    event.preventDefault();
    var comment = $('#comment_body')
    var action = $(this).attr('action')
    $.post(action, {body: comment.val() }, function(data) {
      $('.comments').append(data.new_comment);
    }).always(function() {
      comment.val('');
    });
  });
});
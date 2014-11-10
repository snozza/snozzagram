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

  $('.like').on('click', function(event) {
    event.preventDefault();
    var likesCount = $(this).siblings('.likes-count')
    $.post(this.href, function(data) {
      likesCount.text(data.new_like_count);
    });
  });

  Turbolinks.pagesCached(0)
}

$(document).ready(ready);
$(document).on('page:load',ready);

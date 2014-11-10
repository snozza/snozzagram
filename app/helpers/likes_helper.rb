module LikesHelper

  def like_link(object, content="Like")
    link_to content, post_likes_path(object), class: 'like'
  end



end

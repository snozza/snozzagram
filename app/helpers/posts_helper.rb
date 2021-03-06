module PostsHelper

  def show_image_link(object)
    link_to(image_tag(object.image.url(:thumb)), object) if can?(:read, object)
  end

  def create_link(object, content="New")
    if can?(:create, object)
      object_class = (object.kind_of(Class) ? object : object.class)
      link_to(content, [:new, object_class.name.underscore.to_sym])
    end
  end

  def destroy_link(object, content="Delete")
    link_to(content, object, :confirm => "Are you sure?", method: :delete) if can?(:destroy, object)
  end
end

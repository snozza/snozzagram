require 'rails_helper'

RSpec.describe Post, :type => :model do
  
  it 'is not valid without an image' do
    post = Post.new(caption: "Hasta la vista, Baby!")
    expect(post).to have(1).error_on(:image)
    expect(post).not_to be_valid
  end
end
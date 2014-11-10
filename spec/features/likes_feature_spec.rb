require 'rails_helper'

describe 'liking posts' do
  
  before do
    sign_up
    make_post
  end

  it 'updates the like count on same page' do
    expect(page).to have_content 'likes: 0'
    click_link 'like'
    expect(page).to have_content 'likes: 1'
    expect(Like.count).to eq 1
  end

end
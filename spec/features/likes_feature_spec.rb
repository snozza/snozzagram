require 'rails_helper'

describe 'liking posts' do
  
  before do
    sign_up
    make_post
  end

  it 'updates the like count on same page', js: true do
    expect(page).to have_content '0 likes'
    click_link 'Like'
    expect(page).to have_content '0 likes'
    expect(Like.count).to eq 1
  end

end
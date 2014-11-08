require 'rails_helper'

describe 'Posts' do

  before do
    visit '/'
  end
  
  context 'no posts have been made' do
    it 'should display a notice that there are no photos to show' do
      expect(page).to have_content 'No photos to show'
    end

    it 'should have a prompt to upload an image' do
      expect(page).to have_link 'Post Something'
    end
  end

  context 'creating posts' do

    before do
      click_link 'Post Something'
      expect(Post.count).to eq 0
    end

    it 'should be able to post by filling in form' do
      attach_file 'Photo', 'spec/fixtures/images/test.jpg'
      fill_in 'Caption', with: 'Greatest movie?'
      click_button 'Post!'
      expect(page).to have_content 'Greatest movie?'
      expect(current_path).to eq '/posts'
      expect(Post.count).to eq 1
    end
  end


end
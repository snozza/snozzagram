require 'rails_helper'

describe 'Posts' do

  before do
    visit '/'
    sign_up
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

    before(:each) do
      expect(Post.count).to eq 0
    end

    it 'should be able to post by filling in form' do
      make_post
      expect(page).to have_content 'Greatest movie?'
      expect(current_path).to eq '/'
      expect(Post.count).to eq 1
    end

    it 'should not be able to be submitted without attached photo' do
      click_link 'Post Something'
      fill_in 'Caption', with: 'ummmm....'
      click_button 'Post!'
      expect(page).to have_content 'You need to upload a valid image!'
      expect(Post.count).to eq 0
    end

    it 'should be able to be deleted' do
      make_post
      click_link 'Delete'
      expect(page).to_not have_content('Greatest movie?')
      expect(Post.count).to eq 0
    end
  end

end
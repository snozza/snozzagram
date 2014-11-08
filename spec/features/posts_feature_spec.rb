require 'rails_helper'

describe 'Posts' do
  
  context 'no posts have been made' do
    it 'should display a notice that there are no photos to show' do
      visit '/'
      expect(page).to have_content 'No photos to show'
    end

    it 'should have a prompt to upload an image' do
      visit '/'
      expect(page).to have_link 'Post Something'
    end
  end
end
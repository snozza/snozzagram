require 'rails_helper'

describe 'images' do
  
  context 'no images have been added' do
    it 'should display a notice that no images have been added' do
      visit '/'
      expect(page).to have_content 'No images'
    end

    it 'should have a prompt to upload an image' do
      visit '/'
      expect(page).to have_link 'Upload an image'
    end
  end

end
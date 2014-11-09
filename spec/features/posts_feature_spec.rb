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
  end

  context 'viewing posts' do

    it "should be able to view larger image of individual post" do
      make_post
      find(:xpath, "//a/img[@alt='Test']/..").click
      expect(page).to have_content 'Greatest movie?'
    end
  end

  context 'deleting posts' do

    before(:each) do
      make_post
    end

    it "should only allow owner of post to delete it" do
      expect{ click_link "Delete"}.to change{Post.count}.by -1
    end

    it "should not let other user delete another user's post" do
      click_link 'Sign out'
      sign_up("wendy@wendy.com", "testtest", "testtest")
      expect(page).to_not have_link "Delete"
    end
  end

end
require 'rails_helper'

describe 'User' do

  context "user not sign in and on the homepage" do

    it "should see a 'sign in' link and a 'signup' link" do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see a 'sign out' link" do
      visit '/'
      expect(page).to_not have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do

    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).to_not have_link('Sign up')
      expect(page).to_not have_link('Sign in')
    end
  end

  context "users who aren't signed in" do

    before do
      sign_up
      make_post
      click_link 'Sign out'   
    end

    it "should not be able to post" do
      visit '/posts/new'
      expect(page).to have_content "You need to sign in or sign up before continuing"
    end
  end
end
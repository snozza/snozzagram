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
end
require 'rails_helper'

describe 'Commenting' do
  
  before do
    sign_up
    make_post      
  end

  it 'should allow users to comment on posts', js: true do
    fill_in 'comment[body]', with: "This is awesome!"    
    page.execute_script("$('form.new_comment').submit()")
    expect(page).to have_content 'This is awesome!'
    expect(Comment.count).to eq 1
  end

  it 'should not allow comments to be empty', js: true do
    page.execute_script("$('form.new_comment').submit()")
    expect(Comment.count).to eq 0
  end

  



end
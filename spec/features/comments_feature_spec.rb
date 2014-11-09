require 'rails_helper'

describe 'Commenting' do
  
  before do
    make_post
       
  end

  it 'should allow users to comment on posts', js: true do
    visit '/'
    fill_in 'comment[body]', with: "This is awesome!"
    
    page.execute_script("$('form.new_comment').submit()")
    expect(page).to have_content 'This is awesome!'
  end

end
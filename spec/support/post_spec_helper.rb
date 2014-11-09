module PostHelper
  
  def make_post
    visit '/'
    click_link 'Post Something'
    attach_file 'Image',  File.expand_path('spec/fixtures/images/test.jpg')
    fill_in 'Caption', with: 'Greatest movie?'
    click_button 'Post!'
  end
end
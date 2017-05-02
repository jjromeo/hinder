describe 'Photo features' do
  context 'uploading a photo' do
    before do
      visit new_user_registration_path
      fill_in 'Email', with: 'jerome@test.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
    end

    it 'a user can upload a photo' do
      click_link 'Profile'
      click_link 'Add a photo'
      attach_file 'photo_image', "spec/fixtures/example.jpg"
      click_button 'Submit'
      expect(page).to have_selector 'img'
    end
  end
end

describe 'Photo features' do
  include SessionHelpers
  context 'uploading a photo' do
    before do
      sign_up('jerome@test.com')
    end

    it 'a user can upload a photo' do
      click_link 'Profile'
      click_link 'Add a photo'
      attach_file 'photo_image', "spec/fixtures/example.jpg"
      click_button 'Submit'
      expect(page).to have_selector 'img'
    end
  end

  xcontext 'Voting on a photo' do
    let(:other_user) { create(:user) }
    context 'when a photo exists' do

      before do
        create(:photo, user_id: other_user.id)
        sign_up('jerome@test.com')
      end

      it 'Will show you the image on the main page' do
        expect(page).to have_selector 'image_container'
      end

      it 'will have the option to upvote or downvote a photo' do
        expect(page).to have_css 'upvote'
        expect(page).to have_css 'downvote'
      end
    end
  end
end

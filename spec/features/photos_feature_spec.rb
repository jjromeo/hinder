describe 'Photo features', type: :feature do
  context 'uploading a photo' do
    before do
      sign_up('jerome@test.com')
    end

    def add_photo
      click_link 'Profile'
      click_link 'Add a photo'
      attach_file 'photo_image', "spec/fixtures/example.jpg"
      click_button 'Submit'
    end

    it 'a user can upload a photo' do
      add_photo
      expect(page).to have_content 'Photo added!'
      expect(page).to have_selector 'img'
    end

    it 'a user can delete a photo' do
      add_photo
      click_link "Remove this photo"
      expect(page).to have_content "Photo deleted"
      expect(page).not_to have_selector 'img'
    end
  end

  context 'Voting on a photo' do
    let(:other_user) { create(:user) }
    context 'when a photo exists' do

      before do
        create(:photo, user_id: other_user.id)
        create(:photo, user_id: other_user.id, image: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example2.jpg'), 'image/jpg'))
        sign_up('jerome@test.com')
      end

      it 'Will show you the image on the main page' do
        expect(page).to have_css '#image_container'
      end

      it 'will have the option to upvote or downvote a photo' do
        expect(page).to have_css '#like'
        expect(page).to have_css '#dislike'
      end

      context 'disliking a photo' do
        it 'will take you to the next photo', js: true do
          expect(page.find('#photo')['src']).to have_content 'example.jpg'
          click_link 'Dislike'
          # Wait for ajax to finish before checking otherwise page has changed
          wait_for_ajax
          expect(page.find('#photo')['src']).to have_content 'example2.jpg'
        end
      end

      context 'liking a photo', js: true do
        it 'will open up a chat with the owner of the photo' do
          click_link 'Like'
          wait_for_ajax
          expect(page).to have_content("You are now chatting with #{other_user.name}")
        end
      end
    end
  end
end

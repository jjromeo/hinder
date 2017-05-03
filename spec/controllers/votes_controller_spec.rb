RSpec.describe VotesController do
  include Devise::Test::ControllerHelpers
  context '#create' do
    let(:user) { create(:user) }
    let(:photo) { create(:photo, user: user) }
    before { sign_in user }

    it 'is successful with the correct params' do
      post :create, params: { photo_id: photo.id, vote_type: 'dislike' }
      expect(response).to be_a_success
    end

    it 'fails without a photo id' do
      post :create, params: { vote_type: 'dislike' }
      expect(response.code).to eq '404'
    end
  end
end

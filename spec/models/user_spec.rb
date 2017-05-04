RSpec.describe User do
  it { is_expected.to have_many :photos }
  it { is_expected.to have_many :votes }
  it { is_expected.to have_many(:messages) }

  context 'voted_on_photos' do
    let(:user) { create(:user) }
    let(:photo) { create(:photo) }
    let(:voted_on_photo) { create(:photo) }
    let(:voted_on_photo2) { create(:photo) }

    before do
      create(:vote, user: user, photo: voted_on_photo)
      create(:vote, user: user, photo: voted_on_photo2)
    end

    it 'returns photos which the user has voted' do
      expect(user.voted_on_photo_ids).to include voted_on_photo.id, voted_on_photo2.id
    end

    it 'ignores other photos' do
      expect(user.voted_on_photo_ids).not_to include photo.id
    end
  end
end

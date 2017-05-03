RSpec.describe User do
  it { is_expected.to have_many :photos }
  it { is_expected.to have_many :votes }
  it { is_expected.to have_many(:recently_voted_on_photos).through(:votes).source(:photo) }

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
      expect(user.recently_voted_on_photos).to include voted_on_photo, voted_on_photo2
    end

    it 'ignores other photos' do
      expect(user.recently_voted_on_photos).not_to include photo
    end
  end
end

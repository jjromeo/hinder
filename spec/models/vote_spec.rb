RSpec.describe Vote do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:photo) }
  it do 
    is_expected.to validate_inclusion_of(:vote_type)
      .in_array(['like', 'dislike']) 
  end
  it { is_expected.to validate_presence_of(:vote_type)}

  describe '.recent' do
    it 'returns votes younger than 6 hours' do
      vote1 = create(:vote, created_at: 5.hours.ago)
      vote2 = create(:vote, created_at: 6.hours.ago)
      vote3 = create(:vote, created_at: 1.hour.ago)

      expect(Vote.recent).to include vote1, vote3
      expect(Vote.recent).not_to include vote2
    end
  end
end

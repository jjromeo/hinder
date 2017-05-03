RSpec.describe Vote do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:photo) }
  it do 
    is_expected.to validate_inclusion_of(:vote_type)
      .in_array(['like', 'dislike']) 
  end
  it { is_expected.to validate_presence_of(:vote_type)}

end

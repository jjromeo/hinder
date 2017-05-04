RSpec.describe Message do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:chat_room) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content).is_at_most(500) }
end

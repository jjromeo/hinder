RSpec.describe ChatRoom do
  it { is_expected.to belong_to(:chat_initiator).class_name('User') }
  it { is_expected.to belong_to(:chat_receiver).class_name('User') }
  it { is_expected.to have_many(:messages) }
end

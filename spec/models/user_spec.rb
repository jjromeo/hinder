RSpec.describe User do
  it { is_expected.to have_many :photos }
  it { is_expected.to have_many :votes }
end

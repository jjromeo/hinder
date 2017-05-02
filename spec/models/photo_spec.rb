RSpec.describe Photo do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_attached_file :image }
  it { is_expected.to validate_attachment_presence(:image) }
  it { is_expected.to validate_attachment_content_type(:image)
    .allowing('image/png', 'image/jpeg', 'image/jpg')
    .rejecting('text/plain', 'text/xml', 'image/gif')
  }
  it { is_expected.to validate_attachment_size(:image)
    .less_than(10.megabytes) }
end

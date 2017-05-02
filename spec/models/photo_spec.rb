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

  describe '.for_user' do
    context 'returning photos from different users' do
      let(:first_user) { create(:user) }
      let(:first_user_photo) { create(:photo, user: first_user) }
      let(:second_user) { create(:user) }
      let(:second_user_photo) { create(:photo, user: second_user) }

      it 'should return photos from different users' do
        expect(Photo.for_user(first_user)).to include second_user_photo
      end

      it 'should not return photos belonging to the user' do
        expect(Photo.for_user(first_user)).not_to include first_user_photo
      end
    end
  end
end

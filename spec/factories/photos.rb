FactoryGirl.define do
  factory :photo do
    image { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example.jpg'), 'image/jpg') }
  end
end

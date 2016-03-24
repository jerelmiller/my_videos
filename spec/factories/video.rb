FactoryGirl.define do
  factory :video do
    name 'my puppy video'
    description 'puppy playing in the park'
    file {
      Rack::Test::UploadedFile.new(
        File.open(File.join(Rails.root, '/spec/test_video.mp4'))
      )
    }
  end
end
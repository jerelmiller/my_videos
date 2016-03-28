require 'rails_helper'
require 'spec_helper'
require 'carrierwave/test/matchers'

RSpec.describe Video, type: :model do

  #TODO Mock uploader service
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :file }

    context 'file type contraint' do
      include CarrierWave::Test::Matchers

      before do
        FileUploader.enable_processing = true
      end

      after do
        FileUploader.enable_processing = false
        # TODO: this doesn't remove S3 file for some reason
        Video.destroy_all
      end

      it 'saves video successfully with mp4 file' do
        video = FactoryGirl.build(:video)

        expect{ video.save }.to change{ Video.count }.by 1

        # TODO: find out why Video.destroy all doesn't work
        video.file.remove!
      end

      it 'doesn\'t alows non-mp4 file' do
        video = FactoryGirl.build(:video, name: 'my godzilla pet', file: nil)
        uploader = FileUploader.new(video, :file)

        path_to_file = 'spec/Godzilla_Atomic_Breath.gif'
        File.open(path_to_file) do |f|
          expect{ uploader.store!(f) }.to raise_error(CarrierWave::IntegrityError)
        end
        video.file = uploader
        video.save

        expect(video.valid?).to be false
      end

      it 'becomes invalid when file is missing' do
        video = FactoryGirl.create(:video)

        ## Remove video from S3
        video.file.remove!

        expect{ open(video.file.url) }.to raise_error(OpenURI::HTTPError)
      end
    end
  end
end

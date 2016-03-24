require 'rails_helper'
require 'spec_helper'
require 'carrierwave/test/matchers'

RSpec.describe Video, type: :model do
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
        Video.destroy_all
      end

      it 'saves video successfully with mp4 file' do
        video = FactoryGirl.build(:video)

        expect{ video.save }.to change{ Video.count }.by 1
      end

      it 'doesn\'t alows non-mp4 file' do
        video = FactoryGirl.build(:video, name: 'my godzilla pet', file: nil)
        uploader = FileUploader.new(video, :file)

        path_to_file = 'spec/Godzilla_Atomic_Breath.gif'
        File.open(path_to_file) do |f|
          expect{ uploader.store!(f) }.to raise_error
        end
        video.file = uploader
        video.save

        expect(video.valid?).to be false
      end

      it 'becomes invalid when file is missing' do
        video = FactoryGirl.create(:video)

        ## Remove video
        FileUtils.rm_rf(
          "#{Rails.root}/public/uploads/video/#{video.file.mounted_as}/#{video.id}"
        )

        expect(video.valid?).to be false
      end
    end
  end
end

require 'rails_helper'
require 'spec_helper'

RSpec.describe VideosController, type: :controller do
  describe '#index' do
    before do
      get :index
      FileUploader.enable_processing = true
    end

    after do
      FileUploader.enable_processing = false
      Video.destroy_all
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end

    it 'responds successfully' do
      expect(response).to be_success
    end

    # TODO - Revisit this test
    # it 'assigns video to the view' do
    #   video = Video.new(name: 'my video')
    #   uploader = FileUploader.new(video, :file)

    #   path_to_file = 'spec/test_video.mp4'
    #   File.open(path_to_file) do |f|
    #     uploader.store!(f)
    #   end

    #   video.file = uploader
    #   video.save
    #   video.reload
    #   expect(assigns[:videos]).to include video
    # end
  end
end
class VideosController <ApplicationController
  def index
    @videos = Video.all
    @video = Video.new
  end

  def create
    @video = Video.new(params_video)
    @video.file = params[:file]

    # Hacky! Unable to raise CarrierWave::IntegrityError
    unless params[:video][:file].content_type.match(/mp4/)
      flash[:notice] = "wrong file type"
    end

    if @video.save
      flash[:notice] = "Your video has been saved"
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:error] = @video.errors.full_messages.join(", ")
      redirect_to :back
    end
  end

  private
  def params_video
    params.require(:video).permit(:name, :description, :path, :file)
  end
end

class VideosController <ApplicationController
  def index
    flash[:success] = 'hello'
    @videos = Video.all
    @video = Video.new
  end

  def create
    @video = Video.new(params_video)
    @video.file = params[:file]

    # Hacky! Unable to raise CarrierWave::IntegrityError
    if params[:video][:file].present? && !params[:video][:file].content_type.match(/mp4/)
      flash[:notice] = "Wrong file type"
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

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to :back
  end

  private

  def params_video
    params.require(:video).permit(:name, :description, :path, :file)
  end
end

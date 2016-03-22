class VideosController <ApplicationController
  def index
    @videos = Video.all
    @video = Video.new
  end

  def create
    @video = Video.new(params_video)
    @video.file = params[:file]
    if @video.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      #do something
    end
  end

  private
  def params_video
    params.require(:video).permit(:name, :description, :path, :file)
  end
end
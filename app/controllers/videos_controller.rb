class VideosController < ApplicationController
  def index
    @videos = Video.all
    @video = Video.new
  end

  def create
    @video = Video.new(params_video)
    @video.file = params[:file]

    # Hacky! Unable to raise CarrierWave::IntegrityError
    if params[:video][:file].present? && !params[:video][:file].content_type.match(/mp4/)
      flash[:danger] = "Wrong file type"
    end

    if @video.save
      flash[:success] = "Your video has been saved"
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      flash[:warning] = @video.errors.full_messages.join(", ")
      redirect_to :back
    end

    VideoMailer.upload(@video.file, 'user@user.com')
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

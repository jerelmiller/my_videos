class VideoMailer < ActionMailer::Base
  def upload(v, e)
    mail(
      to: e,
      subject: 'Video has been uploaded',
      from: 'noreply@myvideos.com'
    )
  end
end

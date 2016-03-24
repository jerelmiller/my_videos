module FileUploadHelper
  def fill_in_informarion
    visit root_path
    fill_in 'Name', with: 'my video'
    fill_in 'Description', with: 'my description'
  end

  def select_video
    page.attach_file('post_file', Rails.root + 'spec/test_video.mp4', visible: false)
  end

  def select_non_video
    page.attach_file('post_file', Rails.root + 'spec/Godzilla_Atomic_Breath.gif', visible: false)
  end
end
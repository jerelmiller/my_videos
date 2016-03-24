require 'rails_helper'
require 'spec_helper'

feature "Upload video" do
  after do
    Video.destroy_all
  end

  scenario "Successfully upload a video" do
    visit '/'
    fill_in 'Name', with: 'my video'
    fill_in 'Description', with: 'my description'
    page.attach_file('post_file', Rails.root + 'spec/test_video.mp4', visible: false)
    click_button 'Save My Video'
    page.find('video')['src'].should have_content 'test_video.mp4'
    expect(page).to have_content 'Your video has been saved'
  end

  scenario "Unsuccessfully upload without a video" do
    visit '/'
    fill_in 'Name', with: 'my video'
    fill_in 'Description', with: 'my description'
    click_button 'Save My Video'
    expect(page).to have_content 'File can\'t be blank'
  end

  scenario "Unsuccessfully upload with a wrong file type" do
    visit '/'
    fill_in 'Name', with: 'my video'
    fill_in 'Description', with: 'my description'
    page.attach_file('post_file', Rails.root + 'spec/Godzilla_Atomic_Breath.gif', visible: false)
    click_button 'Save My Video'
    expect(page).to have_content 'wrong file type'
  end
end
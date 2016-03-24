require 'rails_helper'
require 'spec_helper'

feature "Upload video" do
  after do
    Video.destroy_all
  end

  scenario "Successfully upload a video" do
    fill_in_informarion
    select_video
    click_button 'Save My Video'
    page.find('video')['src'].should have_content 'test_video.mp4'
    expect(page).to have_content 'Your video has been saved'
  end

  scenario "Unsuccessfully upload without a video" do
    visit '/'
    fill_in_informarion
    click_button 'Save My Video'
    expect(page).to have_content 'File can\'t be blank'
  end

  scenario "Unsuccessfully upload with a wrong file type" do
    visit '/'
    fill_in_informarion
    select_non_video
    click_button 'Save My Video'
    expect(page).to have_content 'wrong file type'
  end

  scenario "Successfully delete video" do
    visit '/'
    fill_in_informarion
    select_video
    click_button 'Save My Video'
    page.find('video')['src'].should have_content 'test_video.mp4'
    page.find('#delete').click
    expect(page).to have_no_content('test_video.mp4')
  end
end
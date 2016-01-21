require 'rails_helper'

RSpec.feature 'Upload content to Course Library' do
  background do
    @network = create(:network)
    @teacher = create(:user, role: 'teacher')
    @course = create_course(@teacher, @network)
  end

  describe 'Upload file to Course Library' do
    scenario 'click Button to Upload file and render upload file form' do
      given_logged_in_as(@teacher)
      visit onboarding_show_course_library_path(@course)
      click_button('Subir Archivo')
      expect(page).to have_content('Subir Archivo a la Biblioteca')
      fill_upload_file_form
      attach_files
      click_button(I18n.t('.onboarding.new_library_file.upload_file'))
      expect(page).to have_content('file_name')
    end
  end

  describe 'Create folder to Course Library' do
    scenario 'click Button to Create Folder and render upload form' do
      given_logged_in_as(@teacher)
      visit onboarding_show_course_library_path(@course)
      click_button('Crear Carpeta')
      expect(page).to have_content('Crea una Carpeta en la Biblioteca del Curso')
      fill_create_folder_form
      click_button('Crear Carpeta')
      expect(page).to have_content('directory_name')
    end
  end

  describe 'Redirect to create new course' do
    scenario 'click Button to redirect new course template' do
      given_logged_in_as(@teacher)
      visit onboarding_show_course_library_path(@course)
      click_button(I18n.t('.onboarding.show_course_library.create_course'))
      expect(page).to have_content('Crea tu Primer Curso')
    end
  end

  describe 'End onboarding' do
    scenario 'click Button to finish onboarding and render intro video template' do
      given_logged_in_as(@teacher)
      visit onboarding_show_course_library_path(@course)
      click_button('Finalizar')
      expect(page).to have_content(I18n.t('.onboarding.show_tour_video.show_tour_video_step'))
    end
  end

  def fill_upload_file_form
    fill_in('library_file_name', with: 'file_name')
    fill_in('library_file_description', with: 'file_description')
  end

  def attach_files
    attach_file('library_file_file', Rails.root + "spec/fixtures/files/images/palm.png")
  end

  def fill_create_folder_form
    fill_in('library_directory_name', with: 'directory_name')
    fill_in('library_directory_description', with: 'directory_description')
  end
end

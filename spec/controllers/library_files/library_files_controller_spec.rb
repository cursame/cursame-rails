require 'rails_helper'

RSpec.describe LibraryFilesController, type: :controller do
  before :each do
    @network = create(:network)
    @admin = create(:user, role: 'admin')
    @teacher = create(:user, role: 'teacher')
    @student = create(:user, role: 'student')
  end

  describe 'DELETE destroy' do
    it 'Admin should have authorization to delete file' do
      with_user(@admin) do
        should_be_allowed_to :delete, :library_files
      end
    end

    it 'Teacher should have authorization to delete file'  do
      with_user(@teacher) do
        should_be_allowed_to :delete, :library_files
      end
    end

    it "Student shouldn't have authorization to delete files" do
      with_user(@student) do
        should_not_be_allowed_to :delete, :library_files
      end
    end
  end
end

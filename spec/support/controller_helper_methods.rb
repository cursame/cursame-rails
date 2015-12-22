module Controller
  module HelperMethods
    def upload_library_file(network, uploader_user)
      library = network.library
      library_file = create(:library_file)
      library_file.user_id = uploader_user.id
      library_file.location_id = library.id
      library_file.location_type = 'Library'
      library_file.save!
      library_file
    end
  end
end

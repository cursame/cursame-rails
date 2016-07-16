module Features
  module HelperMethods
    def given_logged_in_as(user)
      visit "/users/sign_in"
      fill_in("user_email", with: user.email)
      fill_in("user_password", with: 'password')
      click_on("sign_in")
    end

    def create_course(teacher, network)
      course = create(:course, network_id: network.id)
      create(:members_in_course, user_id: teacher.id, course_id: course.id, accepted: true, owner: true, network_id: network.id)
      course
    end

    def assign_member_in_course(course, member, network)
      create(:members_in_course, user_id: member.id, course_id: course.id, accepted: true, network_id: network.id)
    end

    def upload_library_file(network, uploader_user)
      library = network.library
      library_file = create(:library_file, user: uploader_user, location: library)
    end
  end
end

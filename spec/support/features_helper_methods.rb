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
  end
end

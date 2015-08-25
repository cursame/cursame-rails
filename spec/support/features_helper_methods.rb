module Features
  module HelperMethods
    def given_logged_in_as(user)
      visit "/users/sign_in"
      fill_in("user[email]", with: user.email)
      fill_in("user[password]", with: 'password')
      click_on("sign_in")
    end
  end
end

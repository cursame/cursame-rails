module Features
  module HelperMethods
    def given_logged_in_as(user)
      visit "/users/sign_in"
      fill_in("user_email", with: user.email)
      fill_in("user_password", with: 'password')
      click_on("sign_in")
    end

    def expect_network_show_texts(network)
      expect(page).to have_text network.name
      expect(page).to have_text network.subdomain
      expect(page).to have_text network.population
      expect(page).to have_text network.welcom_message if network.welcom_message

      locale_root = 'superadmin_panel.networks'
      expect(page).to have_text I18n.t("#{locale_root}.show.#{network.public_register?}")
    end

    def fill_network_form(network)
      fill_in('network_name', with: network.name)
      fill_in('network_subdomain', with: network.subdomain)
      fill_in('network_welcom_message', with: network.welcom_message)
      fill_in('network_population', with: network.population)

      public_register = I18n.t("superadmin_panel.networks.shared.form.#{network.public_register}")
      select(public_register, from: 'network_public_register')
    end
  end
end

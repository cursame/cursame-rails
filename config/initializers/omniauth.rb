Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "461068848087-sa5hq000sisbvpn51aipebkahg7sela9.apps.googleusercontent.com", "j7JCE7AjdZI4Vdxz2n1XWH62", {
      :scope => 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
      redirect_uri:'http://localhost/auth/google_oauth2/callback'
      
    }

end
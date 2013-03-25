module UserMacros
  def user_login
    visit new_user_session_path
    fill_in "Login", with: "test_user"
    fill_in "Password", with: "password"
  end

end

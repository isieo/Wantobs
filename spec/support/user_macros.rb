module UserMacros
  def user_login
    visit new_user_session_path
    fill_in "Login", with: "test_user"
    fill_in "Password", with: "password"
    click_button "Sign in"
    #find(:xpath, "(//a[text()='Sign in'])[1]").click
  end

  def current_test_user
    $current_test_user
  end

end

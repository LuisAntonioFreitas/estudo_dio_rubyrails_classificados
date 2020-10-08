require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit logins_url
  #
  #   assert_selector "h1", text: "Login"
  # end

  def setup
    @user = FactoryBot.create(:user, password: "password", password_confirmation: "password")
  end

  test "login com credenciais validas" do
    # visit root_path
    # click_link "Entrar"

    # fill_in "E-mail", with: @user.email
    # fill_in "Senha", with: "password"

    # click_button "Entrar"

    login_as(@user)

    assert_text "Bem vindo, Darth Vader!"
  end

  test "login com credenciais invalidas" do
    # visit root_path
    # click_link "Entrar"

    # fill_in "E-mail", with: @user.email
    # fill_in "Senha", with: "invalidpassword"

    # click_button "Entrar"

    login_as(@user, "invalidpassword")

    assert_equal new_session_path, current_path
    assert_text "E-mail ou senha inválidos!"
  end

end

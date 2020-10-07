require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit logins_url
  #
  #   assert_selector "h1", text: "Login"
  # end

  test "login com credenciais validas" do

    user = FactoryBot.create(:user, password: "password", password_confirmation: "password")

    visit root_path
    click_link "Entrar"

    fill_in "E-mail", with: user.email
    fill_in "Senha", with: "password"

    click_button "Entrar"

    assert_text "Bem vindo, Darth Vader!"
  end

end

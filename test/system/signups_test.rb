require "application_system_test_case"

class SignupsTest < ApplicationSystemTestCase

  test "usuário faz cadastro com dados validos" do
    visit "/"
    click_link "Cadastre-se"

    fill_in "Nome", with: "Darth Vader"
    fill_in "E-mail", with: "vader@imperio.com"
    fill_in "Senha", with: "minhasenha"
    fill_in "Confirme sua Senha", with: "minhasenha"

    click_button "Cadastrar"

    assert_text "Cadastro realizado com sucesso!"
  end

  test "usuário faz cadastro com dados inválidos" do
    visit "/"
    click_link "Cadastre-se"
    click_button "Cadastrar"

    assert_text "Senha de confirmação não confere!"
  end

end
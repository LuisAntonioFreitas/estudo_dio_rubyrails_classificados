require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "nome é obrigatório" do
    user = User.new(name: nil)
    user.save

    assert user.errors[:name].any?
  end

  test "e-mail é obrigatório e no formato válido" do
    user = User.new(email: nil)
    user.save

    assert user.errors[:email].any?

    user = User.new(email: "invalido")
    user.save

    # espero que tenha erro em email
    assert user.errors[:email].any?

    user = User.new(email: "valido@exemplo.com")
    user.save

    # não espero que tenha algum erro em email
    refute user.errors[:email].any?
  end

  test "e-mail é único" do
    user = User.new(name: "Darth Vader", email: "vader@exemplo.com", password: "secret")
    user.save
    other_user = User.new(email: "vader@exemplo.com")
    other_user.save

    assert other_user.errors[:email].any?
  end
end

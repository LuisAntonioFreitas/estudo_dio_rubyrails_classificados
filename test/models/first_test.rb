require "test_helper"

class FirstTest < ActiveSupport::TestCase
  test "esse é meu primeiro teste" do
    variavel = "Cadu"

    assert_equal "Cadu", variavel # teste ok
    assert_equal "Cadu X", variavel # teste não passa
  end
end
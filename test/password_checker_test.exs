defmodule PasswordCheckerTest do
  use ExUnit.Case
  doctest PasswordChecker

  test "a valid password is valid" do
    assert PasswordChecker.check("abcdefghi") == []
  end

  test "password must be longer than eight characters" do
    check_has_error("abcdefgh", "must be longer than eight characters")
  end

  defp check_has_error(password, message) do
    assert PasswordChecker.check(password) |> Enum.find(& &1 == message)
  end
end

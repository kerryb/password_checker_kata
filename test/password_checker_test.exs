defmodule PasswordCheckerTest do
  use ExUnit.Case
  doctest PasswordChecker

  test "a valid password is valid" do
    assert PasswordChecker.check("abcdefghi") == []
  end

  test "password must be longer than eight characters" do
    assert PasswordChecker.check("abcdefgh") |> Enum.find(& &1 == "must be longer than eight characters")
  end
end

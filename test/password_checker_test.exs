defmodule PasswordCheckerTest do
  use ExUnit.Case
  doctest PasswordChecker

  test "a valid password is valid" do
    assert PasswordChecker.check("abcdefghi") == []
  end
end

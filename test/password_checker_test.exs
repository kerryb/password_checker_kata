defmodule PasswordCheckerTest do
  use ExUnit.Case
  doctest PasswordChecker

  test "a valid password is valid" do
    assert PasswordChecker.check("Abcdefgh9") == []
  end

  test "password must be longer than eight characters" do
    check_has_error("Abcdefgh", "must be longer than eight characters")
  end

  test "password must not be nil" do
    check_has_error(nil, "must not be nil")
  end

  test "password must have at least one uppercase letter" do
    check_has_error("abcdefghi", "must contain at least one uppercase letter")
  end

  test "password must have at least one lowercase letter" do
    check_has_error("ABCDEFGHI", "must contain at least one lowercase letter")
  end

  test "password must have at least one number" do
    check_has_error("Abcdefghi", "must contain at least one number")
  end

  defp check_has_error(password, message) do
    result = PasswordChecker.check(password)
    assert Enum.find(result, & &1 == message),
      "Expected #{inspect result} to include #{inspect message}"
  end
end

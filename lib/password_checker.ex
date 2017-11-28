defmodule PasswordChecker do
  @moduledoc """
  [Password check kata](http://osherove.com/tdd-kata-3-refactoring/) (modified
  slightly).
  """

  def check(nil), do: ["must not be nil"]
  def check(password) do
    cond do
      String.length(password) <= 8 -> ["must be longer than eight characters"]
      ! (password =~ ~r/[A-Z]/) -> ["must contain at least one uppercase letter"]
      ! (password =~ ~r/[a-z]/) -> ["must contain at least one lowercase letter"]
      true -> []
    end
  end
end

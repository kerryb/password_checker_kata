defmodule PasswordChecker do
  @moduledoc """
  [Password check kata](http://osherove.com/tdd-kata-3-refactoring/) (modified
  slightly).
  """

  def check(nil), do: ["must not be nil"]
  def check(password) do
    if String.length(password) > 8 do
      []
    else
      ["must be longer than eight characters"]
    end
  end
end

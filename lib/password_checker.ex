defmodule PasswordChecker do
  @moduledoc """
  [Password check kata](http://osherove.com/tdd-kata-3-refactoring/) (modified
  slightly).
  """

  def check(nil), do: ["not be nil"]
  def check(password) do
    checks()
    |> Enum.map(fn check -> check.(password) end)
    |> report_status
  end

  defp checks do
    [
      &longer_than_eight_characters/1,
      &at_least_one_uppercase_letter/1,
      &at_least_one_lowercase_letter/1,
      &at_least_one_number/1,
    ]
  end

  defp report_status(results) do
    if results |> Enum.count(fn r -> match? :ok, r end) >= 3 do
      []
    else
      results
      |> Enum.filter(fn r -> match? {:error, _}, r end)
      |> Enum.map(fn {_, message} -> message end)
    end
  end

  defp longer_than_eight_characters(password) do
    if String.length(password) > 8 do
      :ok
    else
      {:error, "be longer than eight characters"}
    end
  end

  defp at_least_one_uppercase_letter(password) do
    if password =~ ~r/[A-Z]/ do
      :ok
    else
      {:error, "contain at least one uppercase letter"}
    end
  end

  defp at_least_one_lowercase_letter(password) do
    if password =~ ~r/[a-z]/ do
      :ok
    else
      {:error, "contain at least one lowercase letter"}
    end
  end

  defp at_least_one_number(password) do
    if password =~ ~r/\d/ do
      :ok
    else
      {:error, "contain at least one number"}
    end
  end
end

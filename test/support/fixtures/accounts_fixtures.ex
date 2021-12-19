defmodule Discuss.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discuss.Accounts` context.
  """

  @doc """
  Generate a test.
  """
  def test_fixture(attrs \\ %{}) do
    {:ok, test} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name"
      })
      |> Discuss.Accounts.create_test()

    test
  end
end

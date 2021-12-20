defmodule Discuss.UsrCommentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discuss.UsrComment` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{

      })
      |> Discuss.UsrComment.create_comment()

    comment
  end
end

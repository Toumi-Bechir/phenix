defmodule Discuss.UsrCommentTest do
  use Discuss.DataCase

  alias Discuss.UsrComment

  describe "comments" do
    alias Discuss.UsrComment.Comment

    import Discuss.UsrCommentFixtures

    @invalid_attrs %{}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert UsrComment.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert UsrComment.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      valid_attrs = %{}

      assert {:ok, %Comment{} = comment} = UsrComment.create_comment(valid_attrs)
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UsrComment.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{}

      assert {:ok, %Comment{} = comment} = UsrComment.update_comment(comment, update_attrs)
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = UsrComment.update_comment(comment, @invalid_attrs)
      assert comment == UsrComment.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = UsrComment.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> UsrComment.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = UsrComment.change_comment(comment)
    end
  end
end

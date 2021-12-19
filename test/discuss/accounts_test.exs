defmodule Discuss.AccountsTest do
  use Discuss.DataCase

  alias Discuss.Accounts

  describe "tests" do
    alias Discuss.Accounts.Test

    import Discuss.AccountsFixtures

    @invalid_attrs %{age: nil, name: nil}

    test "list_tests/0 returns all tests" do
      test = test_fixture()
      assert Accounts.list_tests() == [test]
    end

    test "get_test!/1 returns the test with given id" do
      test = test_fixture()
      assert Accounts.get_test!(test.id) == test
    end

    test "create_test/1 with valid data creates a test" do
      valid_attrs = %{age: 42, name: "some name"}

      assert {:ok, %Test{} = test} = Accounts.create_test(valid_attrs)
      assert test.age == 42
      assert test.name == "some name"
    end

    test "create_test/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_test(@invalid_attrs)
    end

    test "update_test/2 with valid data updates the test" do
      test = test_fixture()
      update_attrs = %{age: 43, name: "some updated name"}

      assert {:ok, %Test{} = test} = Accounts.update_test(test, update_attrs)
      assert test.age == 43
      assert test.name == "some updated name"
    end

    test "update_test/2 with invalid data returns error changeset" do
      test = test_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_test(test, @invalid_attrs)
      assert test == Accounts.get_test!(test.id)
    end

    test "delete_test/1 deletes the test" do
      test = test_fixture()
      assert {:ok, %Test{}} = Accounts.delete_test(test)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_test!(test.id) end
    end

    test "change_test/1 returns a test changeset" do
      test = test_fixture()
      assert %Ecto.Changeset{} = Accounts.change_test(test)
    end
  end
end

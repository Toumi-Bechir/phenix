defmodule Discuss.Accounts.Test do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tests" do
    field :age, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(test, attrs) do
    test
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end

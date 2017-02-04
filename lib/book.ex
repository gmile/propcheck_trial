defmodule PropcheckTrial.Book do
  @moduledoc false

  use Ecto.Schema

  schema "books" do
    field :title, :string
  end

  def add(title) do
    %PropcheckTrial.Book{title: title}
    |> Ecto.Changeset.change()
    |> PropcheckTrial.Repo.insert!
  end
end

defmodule PropcheckTrialTest do
  use ExUnit.Case

	use PropCheck
  use PropCheck.StateM

  import Ecto.Query, only: [from: 2]

  def initial_state() do
    %{books: []}
  end

  def command(_state) do
    oneof([
      {:call, PropcheckTrial.Book, :add, ["same_title"]}
    ])
  end

  def precondition(_state, _command), do: true

  def postcondition(state, {:call, PropcheckTrial.Book, :add, [title]}, result) do
    books_in_my_model = length(state[:books])
    books_in_real_db = PropcheckTrial.Repo.one(from b in PropcheckTrial.Book, select: count(1))
    
    books_in_my_model == books_in_real_db
  end

  def next_state(state, _command_result, {:call, PropcheckTrial.Book, :add, [title]}) do
    update_in state, [:books], fn list ->
      [title|list]
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PropcheckTrial.Repo)
  end

  property "propcheck works fine" do
    sequence = forall cmds <- commands(__MODULE__) do
      {history, state, result} = run_commands(__MODULE__, cmds)

      IO.puts "Finished single sequence. Result: #{inspect result}"

      (result == :ok)
      |> when_fail(
        IO.puts """
        History: #{inspect history, pretty: true}
        State: #{inspect state, pretty: true}
        Result: #{inspect result, pretty: true}
        """)
      |> aggregate(command_names cmds)
    end

    numtests(10, sequence)
  end
end

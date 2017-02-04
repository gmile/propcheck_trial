defmodule PropcheckTrial do
  @moduledoc false

  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    children = [
      supervisor(PropcheckTrial.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: PropcheckTrial.Supervisor]

    Supervisor.start_link(children, opts)
  end
end

defmodule ExMon.Player do
  @required_keys [:life, :moves, :name]
  @enforce_keys @required_keys

  defstruct @required_keys
  @max_life 100

  def build(move_avg, move_heal, move_rnd, name) do
    %ExMon.Player{
      life: @max_life,
      moves: %{
      move_avg: move_avg,
      move_heal: move_heal,
      move_rnd: move_rnd
      },
      name: name
    }
  end
end

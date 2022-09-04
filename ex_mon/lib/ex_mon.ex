defmodule ExMon do
  alias ExMon.{Player, Game}
  alias ExMon.Game.{Status, Actions}
  alias ExMon.Game.Actions
  @computer_name "Robotinik"
  def create_player(move_avg, move_heal, move_rnd, name) do
    Player.build(move_avg, move_heal, move_rnd, name)
  end

  def start_game(player) do
    create_player(:kick, :heal, :punch, @computer_name)
    |> Game.start(player)
    Status.print_round_message(Game.info)
  end

  def make_move(move) do
    move
    |>Actions.fetch_move()
    |>do_move()
  end
  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal()
      move -> Actions.attack(move)
    end
    Status.print_round_message(Game.info)
  end
end

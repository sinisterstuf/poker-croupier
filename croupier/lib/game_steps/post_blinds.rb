class Croupier::GameSteps::PostBlinds
  def run(game_state)
    game_state.send_community_message do |player|
      player.bet game_state.players[0], amount: game_state.small_blind, type: :blind
      player.bet game_state.players[1], amount: game_state.big_blind, type: :blind
    end
  end
end

require_relative '../spec_helper.rb'

describe Croupier::GameSteps::PostBlinds do
  it "should notify each player about the blinds that have been posted" do
    game_state = MakeGameState.with double("First player"), double("Second player")

    small_blind = { amount: 10, type: :blind }
    big_blind = { amount: 20, type: :blind }

    game_state.players[0].should_receive(:bet).once.with(game_state.players[0], small_blind)
    game_state.players[0].should_receive(:bet).once.with(game_state.players[1], big_blind)
    game_state.players[1].should_receive(:bet).once.with(game_state.players[0], small_blind)
    game_state.players[1].should_receive(:bet).once.with(game_state.players[1], big_blind)

    step = Croupier::GameSteps::PostBlinds.new
    step.run(game_state)
  end
end
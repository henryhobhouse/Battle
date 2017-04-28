describe Game do

  let (:player_one) { double(:player) }
  let (:player_two) { double(:player) }
  let (:game) { described_class.new(player_one, player_two) }

  it 'attacks other players' do
    allow(player_one).to receive(:deduct_health)
    expect(game.attack(player_one))
  end

  it 'has two player variables' do
    expect(game.player_one).to eq player_one
    expect(game.player_two).to eq player_two
  end

  it 'shows the whose turn it is' do
    game.player_turn_swap
    expect(game.player_turn).to eq player_two
  end

end

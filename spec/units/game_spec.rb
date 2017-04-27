describe Game do

  it 'attacks other players' do
    player = double(:player, deduct_health: true)
    expect(subject.attack(player)).to eq true
  end

  it 'has two player variables' do
    expect(subject.player_one).to eq 'test_player_one'
    expect(subject.player_two).to eq 'test_player_two'
  end

end

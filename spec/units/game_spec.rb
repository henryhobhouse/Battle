describe Game do
  it 'attacks other players' do
    player = double(:player, deduct_health: true)
    expect(subject.attack(player)).to eq true
  end
end

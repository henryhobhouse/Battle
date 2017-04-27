describe Player do
  it 'has a variable containing its name' do
    player = Player.new('Henry')
    expect(player.name).to eq 'Henry'
  end

  it 'deducts 10 health points' do
    p subject.health
    expect{subject.deduct}.to change{subject.health}.by(-10)
  end
end

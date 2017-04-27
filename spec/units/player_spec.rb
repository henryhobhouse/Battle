describe Player do
  it 'has a variable containing its name' do
    player = Player.new('Henry')
    expect(player.name).to eq 'Henry'
  end
end

describe Player do
  let(:player) { described_class.new('Henry') }
  it 'has a variable containing its name' do
    expect(player.name).to eq 'Henry'
  end

  it 'deducts health points' do
    srand(10)
    expect{player.deduct_health}.to change{player.health}.by(-14)
  end
end

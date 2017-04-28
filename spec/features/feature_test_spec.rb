# As two Players,
# So we can play a personalised game of Battle,
# We want to Start a fight by entering our Names and seeing them
feature "'/' will have form that will output results to page" do
  scenario 'checks that form submits results and posts to names page' do
    sign_in_and_play
    expect(page).to have_content('Anthony' && 'Henry')
  end
end

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points
feature " /play will show player two HP points and will update when changed" do
  scenario 'checks that /play has HP attribute that refreshes on change' do
    sign_in_and_play
    expect(page).to have_content('Henry - 60HP')
  end
end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation
feature "Player one can attack player two and recieves confirmation" do

  scenario 'checks there is a button for player one to attack' do
  sign_in_and_play
  expect(page).to have_button('attack')
  end

  scenario 'attack submit gives confirmation of attack' do
  sign_in_and_play
  find_button('attack').click
  expect(page).to have_content('Henry - 46HP')
  end

end

# As Player 1,
# So I can start to win a game of Battle,
# I want my attack to reduce Player 2's HP by 10

feature "To attack player two will reduce their HP by (SRAND) 14" do
  scenario 'upon submission of attack button, player_two HP to -14' do
    sign_in_and_play
    find_button('attack').click
    expect(page).to have_content('46HP')
  end
end

# As two Players,
# So we can continue our game of Battle,
# We want to switch turns

feature 'Player turn will change after attack' do
  scenario 'after player_one attacks, player_two has turn' do
    sign_in_and_play
    find_button('attack').click
    expect(page).to have_content("Henry's Turn!")
  end
end

# As a Player,
# So I can Lose a game of Battle,
# I want to see a 'Lose' message if I reach 0HP first

feature 'Player will lose once health is below or equal to 0' do
  scenario 'After six attacks on player two, they will lose' do
    sign_in_and_play
    6.times { find_button('attack').click }
    expect(page).to have_content('has Died!')
  end
end

# As a lonely Player,
# So I can keep my Battle skills up to scratch
# I want to play a Computerised opponent
feature 'Because I am lonely I would like to play the computer' do
  scenario 'When no player two is added play with AI' do
    srand(10)
    visit('/')
    fill_in('player_one', :with => 'Sulaiman')
    find_button('submit').click
    expect(page).to have_content('VS CUNNING AI')
  end

  scenario 'when against AI, AI also attask' do
    srand(10)
    visit('/')
    fill_in('player_one', :with => 'Sulaiman')
    find_button('submit').click
    expect(page).to have_content('Sulaiman - 46HP')
  end
end




# As a Player,
# So I can enjoy a game of Battle with more variety,
# I want to choose from a range of attacks I could make

# As a Player,
# So I can better enjoy a game of Battle,
# I want some of my attacks to Paralyse an opponent (chance of losing their next attack)

# As a Player,
# So I can better enjoy a game of Battle,
# I want one of my attacks to have a chance of Poisoning my Opponent (Opponent takes a small random amount of damage at the beginning of their turn)

# As a Player,
# So I can better enjoy a game of Battle,
# I want to make an attack that has a chance of sending my Opponent to Sleep (Opponent definitely misses next turn)

# As a Player,
# So I can extend my joyous experience of Battle,
# I want to have an attack that heals some of my Hit Points

# As a Player,
# So I can enjoy my game of Battle,
# I want a sexy user interface

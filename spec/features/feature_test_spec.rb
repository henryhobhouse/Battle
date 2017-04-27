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
  expect(page).to have_content('Henry has been attacked!')
  end

end

# As Player 1,
# So I can start to win a game of Battle,
# I want my attack to reduce Player 2's HP by 10

feature "To attack player two will reduce their HP by 10" do
  scenario 'upon submission of attack button, player_two HP to -10' do
    sign_in_and_play
    find_button('attack').click
    expect(page).to have_content('Current Health - 50HP')
  end
end

# As two Players,
# So we can continue our game of Battle,
# We want to switch turns

# As Player 1,
# So I can see how close I am to losing,
# I want to see my own hit points

# As Player 1,
# So I can lose a game of Battle,
# I want Player 2 to attack me, and I want to get a confirmation

# As Player 1,
# So I can start to lose a game of Battle,
# I want Player 2's attack to reduce my HP by 10

# As a Player,
# So I can Lose a game of Battle,
# I want to see a 'Lose' message if I reach 0HP first

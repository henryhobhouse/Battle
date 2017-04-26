
feature "The root has form to input player names" do

background do
  visit('/')
end

  scenario 'checks there is a form' do
    expect(page).to have_field('player_one')
    expect(page).to have_field('player_two')
    expect(page).to have_button('submit')
  end

end

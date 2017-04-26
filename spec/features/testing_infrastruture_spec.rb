feature "The web app is live" do

  scenario 'checks that page is loading' do
    visit('/')
    expect(page).to have_content 'Testing infrastructure working!'
  end

end

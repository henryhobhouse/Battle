describe "The web app is live" do

  it 'checks that page is loading' do
    visit '/'
    expect(page).to have_contect 'Testing infrastructure working!'
  end

end

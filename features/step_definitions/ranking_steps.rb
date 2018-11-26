
Given("the game page") do
    visit('/pvsp')
end



Then("I should see the page with title a list with scores") do
    expect(page).to have_content('1. Joe 14')
end
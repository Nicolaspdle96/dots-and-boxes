Given("the players page") do
    visit('/players')
end

Given("I fill the {string} with {string}") do |field, name|
    fill_in 'player1', :with => name
end

Given("I fill the second {string} with {string}") do |field, name|
    fill_in 'player2', :with => name
end

Then("I press the button {string}") do |button|
    click_button(button)
end
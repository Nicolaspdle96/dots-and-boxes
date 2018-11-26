
Given("the game page") do
    visit('/pvsp')
end

When("The game has finish I press the button {string}") do |btn|
    @sides = ['up','down','right','left']
    for i in 1..16
      for side in @sides
        fill_in 'box', :with => i
        click_button(side)
      end
    end
    click_link(btn)
end

Then("I should see the page with title a list with scores") do
    expect(page).to have_content('1. Joe 14')
end
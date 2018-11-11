
Given("the pvsp page") do
    visit('/pvsp')
  end
  
  Then("I press see the board") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I see whose turn is it") do
    expect(page).to have_content("El turno es de:")
  end
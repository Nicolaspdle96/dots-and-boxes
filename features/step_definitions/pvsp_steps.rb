
Given("the pvsp page") do
    visit('/pvsp')
  end
  
  Then("I see the 4x4 board") do
    expect(page).to have_css("div", :minimum=> 16)
  end
  
  Then("I see whose turn is it") do
    expect(page).to have_content("El turno es de:")
  end
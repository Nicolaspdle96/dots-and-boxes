Given("the home page") do
    visit('/')
  end
  
  When("I press the button {string}") do |button|
    click_button(button)
  end

  Then("I should see another page with  title {string}") do |title|
    expect(page).to have_content(title)
  end

  When("I press the three player button {string}") do |button|
   click_button(button)
  end
    
  Then("I should see the page with  title {string}") do |title|
    expect(page).to have_content(title)
  end

  When("I press the four player button {string}") do |button|
    click_button(button)
  end
  
  Then("I should see otherc page with  title {string}") do |title|
    expect(page).to have_content(title)
  end


 

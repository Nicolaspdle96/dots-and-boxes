
Given("the pvsp page") do
    visit('/pvsp')
  end
  
  Then("I see the 4x4 board") do
    expect(page).to have_css("div", :minimum=> 16)
  end
  
  Then("I see whose turn is it") do
    #expect(page).to have_css('.turn1')
    find('.turn1')['style'].should == 'background-color: red'
  end

  When("fill the first input {string} with {string}") do |inputName, boxId|
    fill_in inputName, :with => boxId
  end
  
  When("I press button with up") do
    click_button('up')
  end
  
  When("fill the second input {string} with {string}") do |inputName, boxId|
    fill_in inputName, :with => boxId
  end
  
  When("I press button with down") do
    click_button('down')
  end
  
  When("fill the third input {string} with {string}") do |inputName, boxId|
    fill_in inputName, :with => boxId
  end
  
  When("I press button with right") do
    click_button('right')
  end
  
  When("fill the fouth input {string} with {string}") do |inputName, boxId|
    fill_in inputName, :with => boxId
  end
  
  When("I pressbutton with left") do
    click_button('left')
  end

  Then("I see the player with one point") do 
    expect(page).to have_content('Puntaje: 1')
  end

  When("I completed all the boxes") do
    @sides = ['up','down','right','left']
    for i in 1..16
      for side in @sides
        fill_in 'box', :with => i
        click_button(side)
      end
    end
  end
  
  Then("I see El ganador es:") do
    expect(page).to have_content('El Ganador es:')
  end
  
  When("I fill the field box with {string}") do |boxId|
    fill_in "box", :with => boxId
  end
  
  Then("I see the turn change") do
   expect(page).to have_css('.turn2')
  end

  When("I click button {string}") do |button|
   click_link(button)
  end
  
  Then("I see page with title {string}") do |title|
    expect(page).to have_content(title)
  end


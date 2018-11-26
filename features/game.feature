Feature: play game
    AS a player
    I want to play the game
    SO THAT I can have fun with friends

    Scenario: see the board
        Given the pvsp page
        Then I see the 4x4 board
    Scenario: see the turn
        Given the pvsp page
        Then I see whose turn is it

    Scenario: make a movement
        Given the pvsp page
        When I fill the field box with "2"
        And I press the button "up"
        Then I see the turn change

    Scenario: see the box completed
        Given the pvsp page
        When fill the first input "box" with "1" 
        And I press button with up 
        And fill the second input "box" with "1"
        And I press button with down 
        And fill the third input "box" with "1"
        And I press button with right
        And fill the fouth input "box" with "1"
        And I pressbutton with left
        Then I see the player with one point
    Scenario: see the name of the winner
        Given the pvsp page
        When I completed all the boxes
        Then I see El ganador es:
    Scenario: start new game
        Given the pvsp page
        When I click button "Nuevo Juego"
        Then I see page with title "Dots and boxes"

      
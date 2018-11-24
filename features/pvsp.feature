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

      
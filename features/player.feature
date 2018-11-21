Feature: register players names
    AS a player
    I want to register my name 
    SO THAT I can identify myself in the game

    Scenario: register the player names
        Given the players page
        When I fill the "player1" with "John"
        And I fill the second "player2" with "Pedro"
        Then I press the button "Jugar" to play
      
    

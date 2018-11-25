Feature: register players names
    AS a player
    I want to register my name 
    SO THAT I can identify myself in the game

    Scenario: register 2 players names
        Given the players page
        And I fill the "player1" with "John"
        And I fill the second "player2" with "Pedro"
        And I press the button "Jugar"
        Then I see the title "Game"
    Scenario: register 3 players  names 
        Given the  threePlayers page
        And I fill the "player1" with "John"
        And I fill the second "player2" with "Pedro"
        And I fill the  third "player3" with "Mary"
        And I press the button "Jugar"
       Then I see the title "Game"
  
    Scenario: register 4 players  names 
    Given the  fourPlayers page
        And I fill the "player1" with "John"
        And I fill the second "player2" with "Pedro"
         And I fill the  third "player3" with "Mary"
        And I fill the fourth "player4" with "Cristina"
        And I press the button "Jugar"
        Then I see the title "Game"
      
    

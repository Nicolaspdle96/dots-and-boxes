Feature: home
    AS a player
    I WANT to see game mode options 
    SO THAT I can choose one to start the game

    Scenario: player vs player choosen
        Given the home page
        When I press the button "Player vs Player"
        Then I should see the page with  title "game"
    

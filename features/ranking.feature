Feature: ranking
    AS a player
    I WANT to see the top five scores 
    SO THAT I can know how much points i need to be there

    Scenario: see the number 1
        Given the pvsp
        When The game has finish I press the button 'Lista Mejores Jugadores'
        Then I should see the page with title a list with scores
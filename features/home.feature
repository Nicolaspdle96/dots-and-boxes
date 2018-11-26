Feature: home
    AS a player
    I WANT to see game mode options 
    SO THAT I can choose one to start the game

    Scenario: player vs player choosen
        Given the home page
        When I press the button "Jugador vs Jugador"
        Then I should see the page with  title "Ingrese los nombres de los jugadores:"
     
    Scenario: 3 players choosen
        Given the home page
        When I press the three player button "Tres Jugadores"
        Then I should see another page with  title "Ingrese los tres nombres"
    Scenario: 3 players choosen
        Given the home page
        When I press the four player button "Cuatro Jugadores"
        Then I should see otherc page with  title "Ingrese los cuatro nombres"

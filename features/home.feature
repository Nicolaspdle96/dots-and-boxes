Feature: home
    AS a player
    I WANT to see game mode options 
    SO THAT I can choose one to start the game

    Scenario: player vs player choosen
        Given the home page
        When I press the button "Jugador vs Jugador"
        Then I should see the page with  title "Ingrese los nombres de los jugadores:"
     
    Scenario: multiplayer choosen
        Given the home page
        When I press the multiplayer button "Mulltijugador"
        Then I should see another page with  title "Ingrese los nombres de 3 o 4 jugadores:"

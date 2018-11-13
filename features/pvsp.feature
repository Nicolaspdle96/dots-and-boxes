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

      
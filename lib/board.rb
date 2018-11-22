require './lib/box'
require './lib/movement'
require './lib/player'

class Board

    attr_reader :size, :hasError, :turn, :numberOfPlayers, :player1, :player2, :player3, :player4, :actualPlayer

    def initialize(size, numberOfPlayers)
        @size = size
        #TODO: Que no cambie el turno al haber un error
        @hasError = false
        @errorMessage = ""
        @turn = 1
        @numberOfPlayers = numberOfPlayers
       
        #default plyaers
        @player1 = Player.new('Joe','red')
        @player2 = Player.new('Miranda', 'blue')
        @player3 = Player.new('Mike','green')
        @player4 = Player.new('Isa', 'yellow')
        @actualPlayer = @player1
    end
    
    def numberOfPlayers=(value)              
        @numberOfPlayers = value
    end

    def setupPlayerNames(numberOfPlayer,playerName)
        case numberOfPlayer 
        when 1
            @player1.name = playerName
        when 2
            @player2.name = playerName
        when 3
            @player3.name = playerName
        when 4
            @player4.name = playerName
        end
    end

    def generateHTMLandCss(movements)
        $j = 1
        $i = 1
        row = 1
        completeHTML = ""  

        while $i <= @size  do
            while $j <= @size * row   do
                @box = Box.new($j)

                for movement in movements
                    if $j == movement.id then
                        processMovement(movement.direction, @box)
                        @hasError = false
                    else
                        @hasError = true
                        @errorMessage = "Movilimiento invalido"
                    end
                end

                completeHTML = completeHTML +  @box.renderHTMLandCSS()
                $j +=1
            end
            completeHTML = completeHTML + "<div></div>"
            row += 1
            $i +=1
        end
        return completeHTML
    end


    #TODO: REFACTORIZAR
    def verify(movements)
        $j = 1
        $i = 1
        row = 1 

        while $i <= @size  do
            while $j <= @size * row   do
                @box = Box.new($j)
                for movement in movements
                    if $j == movement.id then
                        processMovement(movement.direction, @box)
                    end
                end
                $j +=1
            end
            row += 1
            $i +=1
        end
    end

    def processMovement(direction, box)
        

        case direction
        when 'up'
            box.upSide = true
            box.borderColorUp = actualPlayer().color
        when 'down'
            box.downSide = true
            box.borderColorDown = actualPlayer().color
        when 'left'
            box.leftSide = true
            box.borderColorLeft = actualPlayer().color
        when 'right'
            box.rightSide = true
            box.borderColorRight = actualPlayer().color
        end

        puts actualPlayer().name

        if box.isCompleted() then
            actualPlayer().addPoint()
        end

        if hasError == false then
            changeTurn()
        end

    end

    def actualPlayer()
        case @turn
            when 1
                return @player1 
            when 2
                return @player2
            when 3
                return @player3 
            when 4
                return @player4
        end
               
    end

    def changeTurn()
        if @turn < @numberOfPlayers then
            @turn = @turn + 1
        else
            @turn = 1
        end
    end 



end
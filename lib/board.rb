require './lib/box'
require './lib/movement'
require './lib/player'

#test for travis

class Board

    attr_reader :size, :hasError, :turn, :numberOfPlayers, :player1, :player2, :player3, :player4, :actualPlayer, :completedboxes, :gameFinished

    def initialize(size, numberOfPlayers)
        @size = size
        @hasError = false
        @errorMessage = ""
        @turn = 1
        @numberOfPlayers = numberOfPlayers
        @completedBoxes = []
        @gameFinished = false
       
        #default players
        @player1 = Player.new('Joe','red')
        @player2 = Player.new('Miranda', 'blue')
        @player3 = Player.new('Mike','green')
        @player4 = Player.new('Isa', 'yellow')
        @actualPlayer = @player1
    end
    
    def numberOfPlayers=(value)              
        @numberOfPlayers = value
    end

    def completedboxes=(value)              
        @completedboxes = value
    end

    def turn=(value)              
        @turn = value
    end

    def setupPlayerNames(numberOfPlayer,player)
        case numberOfPlayer 
        when 1
            @player1.name = player.name
            @player1.score = player.score
        when 2
            @player2.name = player.name
            @player2.score = player.score
        when 3
            @player3.name = player.name
            @player3.score = player.score
        when 4
            @player4.name = player.name
            @player4.score = player.score
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
                        processMovement(movement.direction, @box, movement.player)
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

    def verifyErrors(movement)
        if movement.id <= 0 || movement.id > size*size then
            return true
        end
        return false
    end

    def processMovement(direction, box, player)
        
        case direction
        when 'up'
            box.upSide = true
            box.borderColorUp = player.color
        when 'down'
            box.downSide = true
            box.borderColorDown = player.color
        when 'left'
            box.leftSide = true
            box.borderColorLeft = player.color
        when 'right'
            box.rightSide = true
            box.borderColorRight = player.color
        end

        if box.isCompleted() then
            box.backgroundColor = player.color
            @completedBoxes.push(player.name)
        end

        verifyIfTheGameHasFinished()

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
        if !@hasError then
            if @turn < @numberOfPlayers then
                @turn = @turn + 1
            else
                @turn = 1
            end
        end
    end 

    def countPoints(player)
        total = 0
            for completedBox in @completedBoxes
                if completedBox == player then
                    total = total + 1
                end
            end
        return total
    end

    def verifyIfTheGameHasFinished()
        total = @player1.score + @player2.score + @player3.score + @player4.score
        if total == size * size then
            @gameFinished = true
        end
    end

end
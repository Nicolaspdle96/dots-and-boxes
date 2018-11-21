require './lib/box'
require './lib/movement'

class Board

    attr_reader :size, :hasError, :completedBoxes

    def initialize(size)
        @size = size
        #TODO: Que no cambie el turno al haber un error
        @hasError = false
        @errorMessage = ""
        @completedBoxes = []
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
                        processMovement(movement.direction, @box, movement.player, movement.turn)
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

    #TODO: REFACTORIZAR ESTO 
    def countPoints(player)
        total = 0
        for completedBox in completedBoxes
            if completedBox == player then
                total = total + 1
            end
        end
        return total
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
                        processMovement(movement.direction, @box, movement.player, movement.turn)
                    end
                end
                $j +=1
            end
            row += 1
            $i +=1
        end
    end

    def processMovement(direction, box, player, turn)
        case direction
        when 'up'
            box.upSide = true
        when 'down'
            box.downSide = true
        when 'left'
            box.leftSide = true
        when 'right'
            box.rightSide = true
        end

        #TODO: REFACTOR
        if box.isCompleted() then
            completedBoxes.push(player)
        end

        #TODO: REFACTOR
        case turn
        when 1
            box.color = "red"
        when 2
            box.color = "blue"
        end
    end



end
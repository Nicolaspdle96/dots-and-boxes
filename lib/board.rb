require './lib/box'
require './lib/movement'

class Board

    attr_reader :size, :hasError, :completedBoxes

    def initialize(size)
        @size = size
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
                        processMovement(movement.direction, @box, movement.player)
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

    def countPoints(player)
        total = 0
        for completedBox in completedBoxes
            if completedBox == player then
                total = total + 1
            end
        end
        return total
    end

    def verify(movements)
        $j = 1
        $i = 1
        row = 1 

        while $i <= @size  do
            while $j <= @size * row   do
                @box = Box.new($j)
                for movement in movements
                    if $j == movement.id then
                        processMovement(movement.direction, @box, movement.player)
                    end
                end
                $j +=1
            end
            row += 1
            $i +=1
        end
    end

    def processMovement(direction, box, player)
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

        if box.isCompleted() then
            box.player = player
            completedBoxes.push(@box.player)
        end
    end



end
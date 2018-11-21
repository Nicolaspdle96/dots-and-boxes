require './lib/box'
require './lib/movement'

class Board

    attr_reader :size, :hasError

    def initialize(size)
        @size = size
        @hasError = false
        @errorMessage = ""
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
                        processMovement(movement.direction, @box, movement.turn)
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

    def compareMovementId(movements, box)
    
    end

    def processMovement(direction, box, turn)
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

        case turn
        when 1
            box.color = "red"
        when 2
            box.color = "blue"
        end
    end



end
require './lib/player'

class Movement
    
    attr_reader :id , :direction, :color , :player

    def initialize(id,direction,player)
        @id = id
        @direction = direction
        @color = color
        @player = Player.new(player.name,player.color)
    end

    def id=(value)              
        @id = value
    end

    def direction=(value)              
        @direction = value
    end

    def color=(value)              
        @color = value
    end

    def player=(value)              
        @player = value
    end

    def isEqual(movement)
        answer = movement.id == @id and movement.direction == @direction
        return answer
    end


    def existIn(movements) 
        answer = false
        for movement in movements 
            if movement.id == @id and movement.direction == @direction then
                answer = true
            end
        end
        return answer
    end
end
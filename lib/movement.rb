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

    def complementaryMovement(board)
        complementaryMovement = nil

        case @direction 
        when 'right'
            if @id % board.size != 0  then
                complementaryMovement = Movement.new(@id + 1, 'left', board.actualPlayer())
            end
        when 'left'
            if @id % board.size != 1 then
                complementaryMovement = Movement.new(@id - 1, 'right', board.actualPlayer())
            end
        when 'up'
            if @id >= board.size then
                complementaryMovement = Movement.new(@id - board.size, 'down', board.actualPlayer())
            end
        when 'down'
            if @id <= (board.size * board.size) - board.size then
                complementaryMovement = Movement.new(@id + board.size, 'up', board.actualPlayer())
            end
        end
        return complementaryMovement
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
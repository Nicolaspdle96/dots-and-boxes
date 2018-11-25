require './lib/Player'

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

end
class Movement
    
    attr_reader :id , :direction , :player, :turn

    #TODO: TAL VEZ TURNO NO ES NECESARIO
    def initialize(id,direction,player,turn)
        @id = id
        @direction = direction
        @player = player
        @turn = turn
    end

    def id=(value)              
        @id = value
    end

    def direction=(value)              
        @direction = value
    end

    def player=(value)              
        @player = value
    end
    
    def turn=(value)
        @turn = value
    end
 
end
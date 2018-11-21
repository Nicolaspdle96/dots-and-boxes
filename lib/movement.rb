class Movement
    
    attr_reader :id , :direction, :turn

    def initialize(id,direction,turn)
        @id = id
        @direction = direction
        @turn = turn
    end

    def id=(value)              
        @id = value
    end

    def direction=(value)              
        @direction = value
    end
    
    def turn=(value)
        @turn = value
    end
 
end
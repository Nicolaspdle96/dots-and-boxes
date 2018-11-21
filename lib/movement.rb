class Movement
    
    attr_reader :id , :direction , :player

    def initialize(id,direction,player)
        @id = id
        @direction = direction
        @player = player
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
 
end
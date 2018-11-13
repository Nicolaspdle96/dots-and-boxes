class Movement
    
    attr_reader :id , :direction

    def initialize(id,direction)
        @id = id
        @direction = direction
    end

    def id=(value)              
        @id = value
    end

    def direction=(value)              
        @direction = value
    end
 
end
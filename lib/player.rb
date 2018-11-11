class Player

    def initialize(name)
        @name = name
    end

    def getName()
        return @name
    end

    def setName(newName)
        @name = newName
    end

    def generateHTMLPlayer()
        return '<h2> El turno es de:' +  @name  + '</h2>'
    end
    
end
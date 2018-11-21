class Player

    attr_reader :name, :score

    def initialize(name)
        @name = name
        @score = 0
    end

    def getName()
        return @name
    end

    def getScore()
        return @score
    end

    def setName(newName)
        @name = newName
    end

    def setScore(newScore)
        @score = newScore
    end

    def generateHTMLPlayer()
        return '<h2> El turno es de:' +  @name  +  '</h2>'
    end

    #+  @score.to_s +
    
end
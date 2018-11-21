class Player

    attr_reader :name, :score

    #AGREGAR COLOR
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

    #TODO: REFACTOR
    def generateHTMLPlayer()
        return '<h2> El turno es de:' +  @name  + @score.to_s + '</h2>'
    end

end
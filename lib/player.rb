class Player

    attr_reader :name, :score, :color

    def initialize(name,color)
        @name = name
        @score = 0
        @color = color
    end

    def name=(value)
        @name = value
    end

    def score=(value)
        @score = value
    end

    def color=(value)
        @color = value
    end

    def generateHTMLPlayer()
        return '<h2> El turno es de:' +  @name  + ' Puntaje: ' + @score.to_s + '</h2>'
    end

end
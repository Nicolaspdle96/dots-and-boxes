class Ranking

    attr_reader :number1, :number2, :number3, :number4, :number5

    def initialize()
        @number1 = Player.new('','')
        @number2 = Player.new('','')
        @number3 = Player.new('','')
        @number4 = Player.new('','')
        @number5 = Player.new('','')
    end

    def number1=(value)
        @number1 = value
    end

    def number2=(value)
        @number2 = value
    end

    def number3=(value)
        @number3 = value
    end

    def number4=(value)
        @number4 = value
    end

    def number5=(value)
        @number5 = value
    end


end
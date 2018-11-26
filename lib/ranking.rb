require "./lib/player"

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

    def sortList(player)
        if player.score >= @number1.score 
            swamp(1,@number1)
            @number1 = player
        else
            if player.score >= @number2.score
                swamp(2,@number2)
                @number2 = player
            else
                if player.score >= @number3.score
                    swamp(3,@number3)
                    @number3 = player
                else
                    if player.score >= @number4.score
                        swamp(4,@number4)
                        @number4 = player
                    else 
                        if player.score >= @number5.score
                            @number5 = player
                        end
                    end
                end
            end
        end
    end

    def swamp(number,player)
        case number 
        when 1
            aux = @number2
            @number2 = player
            aux2 = @number3
            @number3 = aux
            aux3 = @number4
            @number4 = aux2
            @number5 = aux3
        when 2
            aux2 = @number3
            @number3 = player
            aux3 = @number4
            @number4 = aux2
            @number5 = aux3
        when 3
            aux3 = @number4
            @number4 = player
            @number5 = aux3
        when 4
            @number5 = player
        end
    end

end
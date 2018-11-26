require "./lib/movement"
require "./lib/player"

describe Movement do

    before(:each) do
        @player = Player.new('','')
        @move = Movement.new(-1,'',@player)
        @move1 = Movement.new(2,'up',@player)
        @move2 = Movement.new(2,'up',@player)
        @move3 = Movement.new(3,'down',@player)
      
    end

    it "should return Juan for new movement set up with Juan as a player name" do
        @move.player.name = 'Juan'
        expect(@move.player.name).to eq 'Juan'
    end

    it "should return red for new movement set up with red as a player color" do
        @move.player.color = 'color'
        expect(@move.player.color).to eq 'color'
    end

    it "should return 1 for new movement set up with 1 as a id" do
        @move.id = 1
        expect(@move.id).to eq 1
    end

    it "should return up for new movement set up with 1 as a direction" do
        @move.direction = 'up'
        expect(@move.direction).to eq 'up'
    end

    it "should return error for two movements with the same id and direction" do
        error = @move1.isEqual(@move2)
        expect(error).to eq true
    end

    it "should return error for a new movement that has been registered before" do
        movementRegister = [@move1,@move2,@move3]
        move4 = @move3
        error = move4.existIn(movementRegister)
        expect(error).to eq true
    end

end
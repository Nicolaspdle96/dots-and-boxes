require "./lib/movement"
require "./lib/player"

describe Movement do

    before(:each) do
        @player = Player.new('','')
        @move = Movement.new(-1,'',@player)
        @move1 = Movement.new(2,'up',@player)
        @move2 = Movement.new(2,'up',@player)
        @move3 = Movement.new(3,'down',@player)
        @board = Board.new(4,2)
      
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

    it "should return 2 complementary movement of 1 right" do
        newMove = Movement.new(1,'right',@player)
        complementMove = newMove.complementaryMovement(@board)
        expect(complementMove.id).to eq 2
    end

    it "should return letft direction complementary movement of 1 right" do
        newMove = Movement.new(1,'right',@player)
        complementMove = newMove.complementaryMovement(@board)
        expect(complementMove.direction).to eq 'left'
    end

    it "should return error for complementary movement of 1 left" do
        newMove = Movement.new(1,'left',@player)
        complementMove = newMove.complementaryMovement(@board)
        error = false
        if complementMove == nil then
            error = true
        end
        expect(error).to eq true
    end

    it "should return error for complementary movement of 1 up" do
        newMove = Movement.new(1,'up',@player)
        complementMove = newMove.complementaryMovement(@board)
        error = false
        if complementMove == nil then
            error = true
        end
        expect(error).to eq true
    end

    it "should return error for complementary movement of 4 right" do
        newMove = Movement.new(4,'right',@player)
        complementMove = newMove.complementaryMovement(@board)
        error = false
        if complementMove == nil then
            error = true
        end
        expect(error).to eq true
    end

    it "should return error for complementary movement of 16 right" do
        newMove = Movement.new(16,'right',@player)
        complementMove = newMove.complementaryMovement(@board)
        error = false
        if complementMove == nil then
            error = true
        end
        expect(error).to eq true
    end

    it "should return error for complementary movement of 16 right" do
        newMove = Movement.new(16,'right',@player)
        complementMove = newMove.complementaryMovement(@board)
        error = false
        if complementMove == nil then
            error = true
        end
        expect(error).to eq true
    end


    it "should return error for complementary movement of 13 left" do
        newMove = Movement.new(13,'left',@player)
        complementMove = newMove.complementaryMovement(@board)
        error = false
        if complementMove == nil then
            error = true
        end
        expect(error).to eq true
    end

    it "should return error for complementary movement of 14 down" do
        newMove = Movement.new(14,'down',@player)
        complementMove = newMove.complementaryMovement(@board)
        error = false
        if complementMove == nil then
            error = true
        end
        expect(error).to eq true
    end

    it "should return 14 for complementary movement of 10 down" do
        newMove = Movement.new(10,'down',@player)
        complementMove = newMove.complementaryMovement(@board)
        expect(complementMove.id).to eq 14
    end

    it "should return up for complementary movement of 10 down" do
        newMove = Movement.new(10,'down',@player)
        complementMove = newMove.complementaryMovement(@board)
        expect(complementMove.direction).to eq 'up'
    end

    it "should return 6 for complementary movement of 7 left" do
        newMove = Movement.new(7,'left',@player)
        complementMove = newMove.complementaryMovement(@board)
        expect(complementMove.id).to eq 6
    end

    it "should return right direction for complementary movement of 7 left" do
        newMove = Movement.new(7,'left',@player)
        complementMove = newMove.complementaryMovement(@board)
        expect(complementMove.direction).to eq 'right'
    end

    it "should return 7 for complementary movement of 11 up" do
        newMove = Movement.new(11,'up',@player)
        complementMove = newMove.complementaryMovement(@board)
        expect(complementMove.id).to eq 7
    end


    it "should return down direction for complementary movement of 11 up" do
        newMove = Movement.new(11,'up',@player)
        complementMove = newMove.complementaryMovement(@board)
        expect(complementMove.direction).to eq 'down'
    end

end
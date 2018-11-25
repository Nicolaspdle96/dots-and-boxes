require './lib/board'
require './lib/movement'
require './lib/box'
require './lib/player'

describe Board do

    before(:each) do
        @board = Board.new(4,2)
        @movements = []
        @player1 = Player.new('Jose','red')
    end

    it 'should return 4 for board size 4' do
        expect(@board.size).to eq 4
    end

    it 'should return "upSideboard" equal "true" for a movement with direction "Up"' do
        testBox = Box.new(0)
        testMovement = Movement.new(3,'up',@player1)
        @board.processMovement(testMovement.direction,testBox,testMovement.player)
        expect(testBox.upSide).to eq true
    end 

    it 'should return false of a movement id that is smaller than the board' do
        testMovement = Movement.new(90,'up',@player1)
        @movements.push(testMovement)
        @board.generateHTMLandCss(@movements)
        expect(@board.hasError). to be true
    end

    it 'should Jose has 1 point' do
        testMovement1 = Movement.new(1,'up',@player1)
        testMovement2 = Movement.new(1,'down',@player1)
        testMovement3 = Movement.new(1,'right',@player1)
        testMovement4 = Movement.new(1,'left',@player1)
        @movements = [testMovement1, testMovement2, testMovement3, testMovement4]
        @board.generateHTMLandCss(@movements)
        expect(@board.countPoints(@player1.name)). to be 1
    end

    it 'should return 0 points when Jose doesnt completed boxes' do
        testMovement1 = Movement.new(1,'up',@player1)
        testMovement2 = Movement.new(1,'down',@player1)
        testMovement3 = Movement.new(1,'right',@player1)
        testMovement4 = Movement.new(2,'left',@player1)
        @movements = [testMovement1, testMovement2, testMovement3, testMovement4]
        @board.generateHTMLandCss(@movements)
        expect(@board.countPoints(@player1.name)). to be 0
    end

    it 'should return Jose when set the player1 with this player' do
        @board.setupPlayerNames(1, @player1)
        expect(@board.player1.name). to eq 'Jose'
    end

    it 'should return true when i fill with a wrong movement' do
        testMovement1 = Movement.new(0,'up',@player1)
        expect(@board.verifyErrors(testMovement1)). to eq true
    end

    it 'should return false when i fill with a good movement' do
        testMovement1 = Movement.new(2,'up',@player1)
        expect(@board.verifyErrors(testMovement1)). to eq false
    end

    it 'should return Jose when is the turn number 1' do
        @board.setupPlayerNames(1, @player1)
        expect(@board.actualPlayer().name). to eq 'Jose'
    end

    it 'should return 2 when the turn has change' do
        @board.changeTurn()
        expect(@board.turn). to eq 2
    end

    it 'should return false when the game didnt finish' do
        expect(@board.gameFinished). to eq false
    end

    it 'should finish the game when the number of points of all players equals the number of boxes' do
        @board.player1.score = 8
        @board.player2.score = 8
        @board.verifyIfTheGameHasFinished()
        expect(@board.gameFinished). to eq true
    end

    it 'should return Jose when he win the game' do
        @board.setupPlayerNames(1, @player1)
        @board.player1.score = 10
        @board.player2.score = 6
        expect(@board.getTheWinner()). to eq 'Jose'
    end

    it 'should return true when the game finished in a tie' do
        @board = Board.new(4,2)
        @board.player1.score = 6
        @board.player2.score = 6
        expect(@board.itsATie()). to eq true
    end

end
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

    #TODO: POSIBLEMENTE MEJORAR
    it 'should generate html for a board' do 
        expect(@board.generateHTMLandCss(@movements)).to include "</div>"
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

     it 'should return 0 points when the box is not completed' do
         testMovement1 = Movement.new(1,'up',@player1)
         testMovement2 = Movement.new(1,'down',@player1)
         testMovement3 = Movement.new(1,'right',@player1)
         testMovement4 = Movement.new(2,'left',@player1)
         @movements = [testMovement1, testMovement2, testMovement3, testMovement4]
         @board.generateHTMLandCss(@movements)
         expect(@board.countPoints(@player1.name)). to be 0
     end

    it 'should completed a box when i mark the four sides' do
        testMovement1 = Movement.new(1,'up', @player1)
        testMovement2 = Movement.new(1,'down', @player1)
        testMovement3 = Movement.new(1,'right', @player1)
        testMovement4 = Movement.new(1,'left', @player1)
        @movements = [testMovement1, testMovement2, testMovement3, testMovement4]
        @board.generateHTMLandCss(@movements)
        expect(@board.countPoints(@player1.name)). to be 1
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


end
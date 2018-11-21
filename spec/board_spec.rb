require './lib/board'
require './lib/movement'
require './lib/box'

describe Board do

    before(:each) do
        @board = Board.new(4)
        @movements = []
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
        testMovement = Movement.new(3,'up','Jose',1)
        @board.processMovement(testMovement.direction,testBox,testMovement.player,testMovement.turn)
        expect(testBox.upSide).to eq true
    end 

    it 'should return false of a movement id that is smaller than the board' do
        testMovement = Movement.new(90,'up','Jose',1)
        @movements.push(testMovement)
        @board.generateHTMLandCss(@movements)
        expect(@board.hasError). to be true
    end

    #TODO: TAL VEZ CAMBIE
    it 'should return 0 points when the box is not completed' do
        testMovement1 = Movement.new(1,'up','Jose', 1)
        testMovement2 = Movement.new(1,'down','Jose', 1)
        testMovement3 = Movement.new(1,'right','Jose', 1)
        testMovement4 = Movement.new(2,'left','Jose', 1)
        @movements = [testMovement1, testMovement2, testMovement3, testMovement4]
        @board.verify(@movements)
        expect(@board.completedBoxes.length). to be 0
    end

    #TODO: TAL VEZ CAMBIE
    it 'should completed a box when i mark the four sides' do
        testMovement1 = Movement.new(1,'up','Jose',1)
        testMovement2 = Movement.new(1,'down','Jose',1)
        testMovement3 = Movement.new(1,'right','Jose',1)
        testMovement4 = Movement.new(1,'left','Jose',1)
        @movements = [testMovement1, testMovement2, testMovement3, testMovement4]
        @board.verify(@movements)
        expect(@board.completedBoxes.length). to be 1
    end

    it 'should Jose has 1 point' do
        testMovement1 = Movement.new(1,'up','Jose',1)
        testMovement2 = Movement.new(1,'down','Jose',1)
        testMovement3 = Movement.new(1,'right','Jose',1)
        testMovement4 = Movement.new(1,'left','Jose',1)
        @movements = [testMovement1, testMovement2, testMovement3, testMovement4]
        @board.verify(@movements)
        expect(@board.countPoints('Jose')). to be 1
    end

    it 'should return 0 points when Jose doesnt completed boxes' do
        testMovement1 = Movement.new(1,'up','Jose',1)
        testMovement2 = Movement.new(1,'down','Jose',1)
        testMovement3 = Movement.new(1,'right','Jose',1)
        testMovement4 = Movement.new(2,'left','Jose',1)
        @movements = [testMovement1, testMovement2, testMovement3, testMovement4]
        @board.verify(@movements)
        expect(@board.countPoints('Jose')). to be 0
    end


end
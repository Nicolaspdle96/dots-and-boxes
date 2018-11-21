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

    it 'should generate html for a board' do 
        expect(@board.generateHTMLandCss(@movements)).to include "</div>"
    end

    it 'should return "upSideboard" equal "true" for a movement with direction "Up"' do
        testBox = Box.new(0)
        testMovement = Movement.new(3,'up','Jose')
        @board.processMovement(testMovement.direction,testBox,testMovement.player)
        expect(testBox.upSide).to eq true
    end 

    it 'should return false of a movement id that is smaller than the board' do
        testMovement = Movement.new(90,'up','Jose')
        @movements.push(testMovement)
        @board.generateHTMLandCss(@movements)
        expect(@board.hasError). to be true
    end

    it 'should return false of a movement id that is smaller than the board' do
        testMovement = Movement.new(90,'up','Jose')
        @movements.push(testMovement)
        @board.generateHTMLandCss(@movements)
        expect(@board.hasError). to be true
    end

    it 'should return false when I dont completed the box ' do
        testMovement1 = Movement.new(1,'up','Jose')
        testMovement2 = Movement.new(1,'down','Jose')
        testMovement3 = Movement.new(1,'right','Jose')
        testMovement4 = Movement.new(2,'left','Jose')
        @movements.push(testMovement1)
        @movements.push(testMovement2)
        @movements.push(testMovement3)
        @movements.push(testMovement4)
        @board.verify(@movements)
        expect(@board.completedBoxes.length). to be 0
    end

    it 'should completed a box when i mark the four sides' do
        testMovement1 = Movement.new(1,'up','Jose')
        testMovement2 = Movement.new(1,'down','Jose')
        testMovement3 = Movement.new(1,'right','Jose')
        testMovement4 = Movement.new(1,'left','Jose')
        @movements.push(testMovement1)
        @movements.push(testMovement2)
        @movements.push(testMovement3)
        @movements.push(testMovement4)
        @board.verify(@movements)
        expect(@board.completedBoxes.length). to be 1
    end

    it 'should Jose has 1 point' do
        testMovement1 = Movement.new(1,'up','Jose')
        testMovement2 = Movement.new(1,'down','Jose')
        testMovement3 = Movement.new(1,'right','Jose')
        testMovement4 = Movement.new(1,'left','Jose')
        @movements.push(testMovement1)
        @movements.push(testMovement2)
        @movements.push(testMovement3)
        @movements.push(testMovement4)
        @board.verify(@movements)
        expect(@board.countPoints('Jose')). to be 1
    end

    it 'should Jose has 0 point' do
        testMovement1 = Movement.new(1,'up','Jose')
        testMovement2 = Movement.new(1,'down','Jose')
        testMovement3 = Movement.new(1,'right','Jose')
        testMovement4 = Movement.new(2,'left','Jose')
        @movements.push(testMovement1)
        @movements.push(testMovement2)
        @movements.push(testMovement3)
        @movements.push(testMovement4)
        @board.verify(@movements)
        expect(@board.countPoints('Jose')). to be 0
    end


end
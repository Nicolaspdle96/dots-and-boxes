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
        testMovement = Movement.new(3,'up')
        @board.processMovement(testMovement.direction,testBox)
        expect(testBox.upSide).to eq true
    end 

    it 'should return false of a movement id that is smaller than the board' do
        testMovement = Movement.new(90,'up')
        @movements.push(testMovement)
        @board.generateHTMLandCss(@movements)
        expect(@board.hasError). to be true
    end


end
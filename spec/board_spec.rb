require './lib/board'

describe Board do

    before(:each) do
        @board = Board.new(4)
    end


    it 'should generate html for a board' do 
        expect(@board.generateHTML()).to include "</div>"
    end

    it 'should generate css for a board' do 
        expect(@board.generateCss()).to include "<style>"
    end


end
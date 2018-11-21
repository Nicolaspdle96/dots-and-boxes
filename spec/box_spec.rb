require './lib/box'

describe Box do

    before(:each) do
        @box = Box.new(0)
    end

    it 'should generate a empty box' do
        expect(@box.isEmpty()).to eq true 
    end

    #TODO: MEJORAR
    it 'should generate html for a box' do 
        expect(@box.generateHtml()).to include "</div>"
    end

    #TODO: MEJORAR
    it 'should generate css for a box' do 
        expect(@box.generateCss()).to include "<style>"
    end

    #TODO: REVISAR IT MAY CHANGE
    it "should get red color for player 1" do 
        @box.setPlayer1Turn()
        expect(@box.color).to eq "red"
    end

    it "should get blue color for player 2" do 
        @box.setPlayer2Turn()
        expect(@box.color).to eq "blue"
    end

    it "should return true when sideUp is setted as true" do 
        @box.upSide = true
        expect(@box.upSide).to eq true
    end

    it 'should return true for "isCompleted" when all the sides are filled' do
        @box.upSide = true
        @box.downSide = true
        @box.leftSide = true
        @box.rightSide = true
        expect(@box.isCompleted()).to be true 
    end

   



end
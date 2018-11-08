require './lib/box'

describe Box do

    before(:each) do
        @box = Box.new(0)
    end

    it 'should generate a empty box' do
        expect(@box.isEmpty()).to eq true 
    end

    it 'should generate html for a box' do 
        expect(@box.generateHTML()).to include "<div class=box>"
    end

    it 'should generate css for a box' do 
        expect(@box.generateCSS()).to include "<style>"
    end

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

   

   


end
require './lib/box'

describe Box do

    before(:each) do
        @box = Box.new(0)
    end

    it 'should generate a empty box' do
        expect(@box.isEmpty()).to eq true 
    end

    it 'should generate html for a box' do 
        expect(@box.generateHtml()).to eq "<div class=box0>0</div>"
    end

    it "should return true when sideUp is setted as true" do 
        @box.upSide = true
        expect(@box.upSide).to eq true
    end

    it "should return true when DownSide is setted as true" do 
        @box.downSide = true
        expect(@box.downSide).to eq true
    end
    
    it "should return true when LeftSide is setted as true" do 
        @box.leftSide = true
        expect(@box.leftSide).to eq true
    end

     
    it "should return true when sideRight is setted as true" do 
        @box.rightSide = true
        expect(@box.rightSide).to eq true
    end

    it 'should return true for "isCompleted" when all the sides are filled' do
        @box.upSide = true
        @box.downSide = true
        @box.leftSide = true
        @box.rightSide = true
        expect(@box.isCompleted()).to be true 
    end

   



end
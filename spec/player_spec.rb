require "./lib/player"

describe Player do

    before(:each) do
        @pl = Player.new('');
    end

    it "should create a player with empty name" do
        expect(@pl.getName()).to eq ''
    end

    it "should return 'Arnold' when i create a player with this name and i get the name" do
        pl2 = Player.new('Arnold')
        expect(pl2.getName()).to eq 'Arnold'
    end

    it "should return 'Gerard' when i set the original name" do
        @pl.setName('Gerard')
        expect(@pl.getName()).to eq 'Gerard'
    end

end
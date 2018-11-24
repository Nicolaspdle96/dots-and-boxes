require "./lib/player"

describe Player do

    before(:each) do
        @pl = Player.new('','');
    end

    it "should create a player with empty name" do
        expect(@pl.name).to eq ''
    end

    it "should return 'Arnold' when i create a player with this name" do
        pl2 = Player.new('Arnold','')
        expect(pl2.name).to eq 'Arnold'
    end

    it "should return 'Gerard' when i set the original name" do
        @pl.name = 'Gerard'
        expect(@pl.name).to eq 'Gerard'
    end

    it "should generate the HTML to show Ana's turn" do 
        @pl.name = 'Ana' 
        @pl.score = 0
        expect(@pl.generateHTMLPlayer()).to eq "<h2> El turno es de:Ana Puntaje: 0</h2>"
    end

    it "should show the name of the player" do
        @pl.name = 'Ana'
        expect(@pl.generateHTMLPlayer()).to include 'Ana'
    end

    it "should create a player with 0 points" do
        expect(@pl.score).to eq 0
    end

    it "should return 1 when the player has 1 point" do
        @pl.score = 1;
        expect(@pl.score).to eq 1
    end

    it "should return blue when the color is set to blue" do
        @pl.color = "blue";
        expect(@pl.color).to eq "blue"
    end

end
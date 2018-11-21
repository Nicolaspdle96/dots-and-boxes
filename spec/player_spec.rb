require "./lib/player"

describe Player do

    before(:each) do
        @pl = Player.new('');
    end

    it "should create a player with empty name" do
        expect(@pl.getName()).to eq ''
    end

    it "should return 'Arnold' when i create a player with this name" do
        pl2 = Player.new('Arnold')
        expect(pl2.getName()).to eq 'Arnold'
    end

    it "should return 'Gerard' when i set the original name" do
        @pl.setName('Gerard')
        expect(@pl.getName()).to eq 'Gerard'
    end

    #TODO: MEJORAR
    it "should generate the HTML to show the turn" do   
        expect(@pl.generateHTMLPlayer()).to include '<h2>'
    end

    it "should show the name of the player" do
        @pl.setName('Ana')
        expect(@pl.generateHTMLPlayer()).to include 'Ana'
    end

    it "should create a player with 0 points" do
        expect(@pl.getScore()).to eq 0
    end

    #TODO: MEJORAR
    it "should increase the score of a player when he complete one box" do
        @pl.setScore(1);
        expect(@pl.getScore()).to eq 1
    end

end
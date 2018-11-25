require "./lib/ranking"
require "./lib/player"

describe Ranking do

    before(:each) do
        @top5 = Ranking.new()
    end

    it "should start the game with an empty ranking" do
        expect(@top5.number1.name).to eq ''
    end

    it "should return the number1 with the name 'Jose'" do
        @player1 = Player.new('Jose','red')
        @player1.score = 5
        @top5.sortList(@player1)
        expect(@top5.number1.name).to eq 'Jose'
    end

    it "should return the number2 with the name 'Juan'" do
        @player1 = Player.new('Jose','red')
        @player2 = Player.new('Juan','red')
        @player1.score = 5
        @player2.score = 2
        @top5.sortList(@player1)
        @top5.sortList(@player2)
        expect(@top5.number2.name).to eq 'Juan'
    end

end
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

    it "should return the number1 with the name 'Juan' when he takes his place" do
        @player1 = Player.new('Jose','red')
        @player2 = Player.new('Juan','red')
        @player1.score = 5
        @player2.score = 10
        @top5.sortList(@player1)
        @top5.sortList(@player2)
        expect(@top5.number1.name).to eq 'Juan'
    end

    it "should return the number5 with the name 'Jose' when all the players get better scores" do
        @player1 = Player.new('Jose','red')
        @player2 = Player.new('Juan','red')
        @player3 = Player.new('Jorge','red')
        @player4 = Player.new('Jeremias','red')
        @player5 = Player.new('Jurguen','red')
        @player1.score = 5
        @player2.score = 10
        @player3.score = 8
        @player4.score = 14
        @player5.score = 10
        @top5.sortList(@player1)
        @top5.sortList(@player2)
        @top5.sortList(@player3)
        @top5.sortList(@player4)
        @top5.sortList(@player5)
        expect(@top5.number5.name).to eq 'Jose'
    end

end
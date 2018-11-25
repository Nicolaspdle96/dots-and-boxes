require "./lib/ranking"

describe Ranking do

    it "should start the game with an empty ranking" do
        @top5 = Ranking.new()
        expect(@top5.number1.name).to eq ''
    end

end
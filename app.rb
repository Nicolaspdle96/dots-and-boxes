require 'sinatra'
require './lib/player'


class App < Sinatra::Base
    get '/' do
        erb:home
    end

    get '/players' do
        erb:players
    end 

    get '/game' do
        @pl1 = Player.new(params[:player1])
        @pl2 = Player.new(params[:player2])
        erb:game
    end

    get '/pvsp' do  #player VS player
        board = Board.new(4)
        board.generateHTML() + board.generateCss()

    
    run! if app_file == $0;
end
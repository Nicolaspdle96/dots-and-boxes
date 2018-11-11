require 'sinatra'
require './lib/player'
require './lib/board'

class App < Sinatra::Base
    get '/' do
        erb:home
    end

    get '/players' do
        erb:players
    end 

    get '/game' do
       
        erb:game
    end

    get '/pvsp' do  #player VS player
        @pl1 = Player.new(params[:player1])
        @pl2 = Player.new(params[:player2])  
        board = Board.new(4)
        @pl1.generateHTMLPlayer() + board.generateHTML() + board.generateCss()  
    end
    run! if app_file == $0;
end
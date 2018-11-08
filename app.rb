require 'sinatra'
require './lib/board'

class App < Sinatra::Base
    get '/' do
        erb:home
    end

    post '/players' do
        erb:players
    end

    get '/pvsp' do  #player VS player
        board = Board.new(4)
        board.generateHTML() + board.generateCss()
    end 
    
    run! if app_file == $0;
end
require 'sinatra'
require './lib/player'


class App < Sinatra::Base
    get '/' do
        erb:home
    end

<<<<<<< HEAD
    get '/players' do
        erb:players
    end 

    get '/game' do
        @pl1 = Player.new(params[:player1])
        @pl2 = Player.new(params[:player2])
        erb:game
    end
=======
    post '/players' do
        erb:players
      end
>>>>>>> dev
    
    run! if app_file == $0;
end
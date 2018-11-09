require 'sinatra'
require './lib/board'
require './lib/player'
require './lib/movement'
require './lib/controls'



class App < Sinatra::Base  

    set :movementList, []
  
    configure do
        set :my_config_property, 'hello world'
    end

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
     
        controls = Controls.new()
        board = Board.new(4)
        
        numberOfBox =  params[:box].to_i
        direction = params[:direction].to_s
        newMove = Movement.new(numberOfBox,direction)
        
        settings.movementList.push(newMove)

        board.generateHTMLandCss(settings.movementList) + controls.returnHTML
    end

    
    run! if app_file == $0;
end
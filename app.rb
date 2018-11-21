require 'sinatra'
require './lib/board'
require './lib/player'
require './lib/movement'
require './lib/controls'



class App < Sinatra::Base  

    set :movementList, []
    set :savedP1, ''
    set :savedP2, ''
    set :turn, 1
  
    configure do
        set :my_config_property, 'hello'
    end

    get '/' do
        erb:home
    end

    get '/players' do
        erb:players
    end 

    get '/pvsp' do  #player VS player
        
        #setting board
        @controls = Controls.new()
        @board = Board.new(4)
        @movement = settings.movementList
     
        #setting names
        player1 = Player.new(params[:player1])
        player2 = Player.new(params[:player2])

        #saving players names
        if player1.name != nil and player2 != nil then
            settings.savedP1 = player1.name.to_s
            settings.savedP2 = player2.name.to_s
        end

        #TODO: REVISAR POSICION DE CODIGO TAL VEZ PONER EN BOARD.RB
        if settings.turn == 1
            @actualPlayer = Player.new(settings.savedP1)
            settings.turn = 2
        else
            @actualPlayer = Player.new(settings.savedP2)
            settings.turn = 1
        end     
        
        #setting game functionality
        numberOfBox =  params[:box].to_i
        direction = params[:direction].to_s
        newMove = Movement.new(numberOfBox,direction, @actualPlayer.name, settings.turn)
        settings.movementList.push(newMove)  

        #TODO: REVISAR TAL VEZ PONER EN BOARD
        @board.verify(settings.movementList)
        @actualPlayer.setScore(@board.countPoints(@actualPlayer.name))

        #render the board
        #actualPlayer.generateHTMLPlayer() + @board.generateHTMLandCss(settings.movementList) + @controls.returnHTML

        erb:pvsp
       
    end


    run! if app_file == $0;
end
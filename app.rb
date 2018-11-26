require 'sinatra'
require './lib/board'
require './lib/player'
require './lib/movement'
require './lib/controls'
require './lib/ranking'



class App < Sinatra::Base  

    set :movementList, []
    set :savedP1, Player.new('Joe','red')
    set :savedP2, Player.new('Miranda', 'blue')
    set :savedP3, Player.new('Jill','green')
    set :savedP4, Player.new('Emmy','yellow')
    set :turn, 0
    set :endGame, false
    set :ranking, Ranking.new()

    configure do
        set :my_config_property, 'hello'
    end

    get '/' do
        erb:home
    end

    get '/players' do
        erb:players
    end 

    get '/threePlayers' do 
        erb:threePlayers
    end

    get '/fourPlayers' do 
        erb:fourPlayers
    end

    def  setTurn()
        
        if settings.turn != 0 then
            return settings.turn
        else 
            return 1
        end     
    end

    get '/pvsp' do  #player VS player
        
        #setting board
        @controls = Controls.new()
        @board = Board.new(4,2)
        @movement = settings.movementList
        @errorMessage = ""

        @board.turn = setTurn()  
     
        #setting names
        player1 = Player.new(params[:player1],'red')
        player2 = Player.new(params[:player2],'blue')

        #saving players names
        if player1.name != nil and player2 != nil then
            settings.savedP1.name = player1.name.to_s
            settings.savedP2.name = player2.name.to_s
        end

        @board.setupPlayerNames(1,settings.savedP1)
        @board.setupPlayerNames(2,settings.savedP2)  
        
        #setting game functionality
        numberOfBox =  params[:box].to_i
        direction = params[:direction].to_s
        newMove = Movement.new(numberOfBox,direction, @board.actualPlayer())

        if (@board.verifyErrors(newMove) and settings.turn!=0) or @movement.include?(newMove) or settings.endGame then
            @errorMessage = "Movimiento inválido"
        else
            settings.movementList.push(newMove) 
            if settings.turn == 0 then
                settings.turn = 1
            else
                @board.changeTurn()
                settings.turn = @board.turn
            end
        end
        erb:pvsp  
    end

    get '/multiplayerThree' do
        
        #setting board
        @controls = Controls.new()
        @board = Board.new(4,3)
        @movement = settings.movementList
        @errorMessage = ""

        @board.turn = setTurn()  
     
        #setting names
        player1 = Player.new(params[:player1],'red')
        player2 = Player.new(params[:player2],'blue')
        player3 = Player.new(params[:player3],'green')

        #saving players names
        if player1.name != nil and player2 != nil  and player3 != nil then
            settings.savedP1.name = player1.name.to_s
            settings.savedP2.name = player2.name.to_s
            settings.savedP3.name = player3.name.to_s
        end

        @board.setupPlayerNames(1,settings.savedP1)
        @board.setupPlayerNames(2,settings.savedP2)  
        @board.setupPlayerNames(3,settings.savedP3)
        
        #setting game functionality
        numberOfBox =  params[:box].to_i
        direction = params[:direction].to_s
        newMove = Movement.new(numberOfBox,direction, @board.actualPlayer())

        if (@board.verifyErrors(newMove) and settings.turn!=0) or @movement.include?(newMove) or settings.endGame then
            @errorMessage = "Movimiento inválido"
        else
            settings.movementList.push(newMove) 
            if settings.turn == 0 then
                settings.turn = 1
            else
                @board.changeTurn()
                settings.turn = @board.turn
            end
        end
        erb:multiplayerThree
    end


    get '/multiplayerFour' do
        #setting board
        @controls = Controls.new()
        @board = Board.new(4,4)
        @movement = settings.movementList
        @errorMessage = ""

        @board.turn = setTurn()  
     
        #setting names
        player1 = Player.new(params[:player1],'red')
        player2 = Player.new(params[:player2],'blue')
        player3 = Player.new(params[:player3],'green')
        player4 = Player.new(params[:player4],'yellow')

        #saving players names
        if player1.name != nil and player2 != nil  and player3 != nil and player4 != nil then
            settings.savedP1.name = player1.name.to_s
            settings.savedP2.name = player2.name.to_s
            settings.savedP3.name = player3.name.to_s
            settings.savedP4.name = player4.name.to_s
        end

        @board.setupPlayerNames(1,settings.savedP1)
        @board.setupPlayerNames(2,settings.savedP2)  
        @board.setupPlayerNames(3,settings.savedP3)
        @board.setupPlayerNames(4,settings.savedP4)
        
        #setting game functionality
        numberOfBox =  params[:box].to_i
        direction = params[:direction].to_s
        newMove = Movement.new(numberOfBox,direction, @board.actualPlayer())

        if (@board.verifyErrors(newMove) and settings.turn!=0) or @movement.include?(newMove) or settings.endGame then
            @errorMessage = "Movimiento inválido"
        else
            settings.movementList.push(newMove) 
            if settings.turn == 0 then
                settings.turn = 1
            else
                @board.changeTurn()
                settings.turn = @board.turn
            end
        end 

        erb:multiplayerFour
    end
    get '/ranking' do
        erb:ranking
    end 

    run! if app_file == $0;
end
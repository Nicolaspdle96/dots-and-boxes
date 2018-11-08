require 'sinatra'
class App < Sinatra::Base
    get '/' do
        erb:home
    end

    post '/players' do
        erb:players
      end
    
    run! if app_file == $0;
end
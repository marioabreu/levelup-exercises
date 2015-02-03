# run `ruby overlord.rb` to run a webserver for this app

require 'sinatra'
require 'rack-flash'

require_relative 'bomb'

enable :sessions
use Rack::Flash


IS_NUMERIC = /\A[-+]?[0-9]+\z/

bomb = Bomb.new

get '/' do
  erb :index
end

get '/bomb' do
  @bomb = bomb
  erb :bomb
end

post '/bomb' do
  @bomb = bomb
  if ( params[:activation_code] =~ IS_NUMERIC ) != 0 || ( params[:deactivation_code] =~ IS_NUMERIC ) != 0
    flash[:error] = "Activation and Deactivatoin code must be numeric"
  else    
    bomb.set_activation_code(params[:activation_code])
    bomb.set_deactivation_code(params[:deactivation_code])
    flash[:notice] = "The code configured was " + bomb.activation_code + " and the deactivation code is " + bomb.deactivation_code
  end
  erb :bomb
end

get '/wire' do
  @bomb = bomb
  if bomb.wired?
    flash[:notice] = "BOMB IS ALREADY ATIVATED"
  end

  erb :wire
end

post '/wire' do
  @bomb = bomb

  if params[:activation_code] == bomb.activation_code && !bomb.wired?
    bomb.wire
    flash[:notice] = "Bomb wired!"
  elsif bomb.wired?
    flash[:notice] = "The bomb is already wired!"
  else
    flash[:error] = "Wrong code!"
  end
  erb :wire
end

post "/disarm" do
  @bomb = bomb

  if params[:deactivation_code] == bomb.deactivation_code
    bomb.disarm
    flash[:notice] = "The bomb was disarmed successfully!"
  else
    flash[:notice] = "Wrong code!!"
  end

  erb :wire
end


# we can shove stuff into the session cookie YAY!
def start_time
  session[:start_time] ||= (Time.now).to_s
end

#

# run `ruby overlord.rb` to run a webserver for this app

require 'sinatra'
require_relative 'bomb'
require_relative 'wire'

enable :sessions


bomb = Bomb.new
wire = Wire.new(bomb)

get '/' do
  erb :index
end

get '/bomb' do
  @bomb = bomb
  erb :bomb
end

post '/bomb' do
  bomb.set_code(params[:code])
  "The code configured was " + params[:code]
end

get '/wire' do
  if wire.activated?
    erb :boom
  else
    erb :wire
  end
end

post '/wire' do 
  if params[:code] == bomb.code
    "Bomb wired!" + wire.wire_bomb.to_s + "!"
  else 
    "Wrong code!"
  end
end


# we can shove stuff into the session cookie YAY!
def start_time
  session[:start_time] ||= (Time.now).to_s
end

#

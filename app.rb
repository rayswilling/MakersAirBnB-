require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/dreambnb'
require_relative './lib/user'
require_relative './lib/database_connection_setup'

class Dreambnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/users' do
    if !User.first(email: params[:email]).nil?
      flash[:notice] = 'Email in use'
      redirect '/'
    elsif params[:password] != params[:password_confirmation]
      flash[:notice] = "Passwords don't match"
      redirect '/'
    else
      User.create(:email => params[:email], :password => params[:password])
      redirect '/spaces'
    end
  end

  get '/sessions/new' do
    erb(:login)
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if !user.nil?
      redirect '/spaces'
    else
      flash[:notice] = 'Email or password is incorrect'
      redirect '/sessions/new'
    end
  end
end

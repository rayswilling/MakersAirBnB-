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
      user = User.create(email: params[:email], password: params[:password])
      session[:id] = user.id

      redirect '/spaces'
    end
  end

  get '/sessions/new' do
    erb(:login)
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    
    if !user.nil?
      session[:id] = user.id

      redirect '/spaces'
    else
      flash[:notice] = 'Email or password is incorrect'

      redirect '/sessions/new'
    end
  end

  post '/sessions/logout' do
    session.clear
    flash[:notice] = 'You have logged out'

    redirect '/'
  end

    # post '/spaces' do
  #   # User.create(email: "Francesca@gmail.com", password: "secretinit"
  #   Listing.create(name: "Ecological Artistic Retreat", description: "For a lovely getaway",
  #   price: "£23")
  #   erb :spaces
  # end

  get '/spaces' do
    @listings = Listing.all
    erb :spaces
  end

  post '/spaces' do
    user = User.get(session[:id])
    @listings = Listing.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_until: params[:available_until], user: user)
    
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :new
  end
end

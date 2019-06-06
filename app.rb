require 'sinatra/base'
require 'sinatra/flash'
require 'date'
require_relative './lib/space'
require_relative './lib/user'
require_relative './lib/request'
require_relative './lib/database_connection_setup'

class Dreambnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/users/new' do
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

  post '/sessions/new' do
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

  get '/spaces' do
    @spaces = Space.all
    erb(:'spaces/list')
  end

  get '/spaces/new' do
    erb(:'spaces/new')
  end

  post '/spaces/new' do
    user = User.get(session[:id])
    Space.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_until: params[:available_until], user: user)
    
    redirect '/spaces'
  end

  get '/spaces/:id' do 
    @space = Space.get(params[:id])

    erb(:'spaces/load')
  end

  get '/requests' do 
    erb(:'requests/list')
  end 

  post '/requests/new' do
    user = User.get(session[:id])
    space = Space.get(params[:prop_id])

    Request.create(
      arrival_date: params[:arrival_date], 
      user: user, 
      space: space)

      flash[:notice] = 'Thanks for your request. The owner has been notified.'
      redirect '/requests'
  end

  get '/requests/:id' do 
    request = Request.get(params[:id])
    space = Space.get(request.space_id)
    user = User.get(request.user_id)
    @other_requests_for_space = Request.all(space_id: space.id) -  Request.all(id: request.id)
    @email = user.email
    @name = space.name
    @date = request.arrival_date.strftime(fmt='%d/%m/%Y')  
  
    erb(:'requests/load')
 end
end

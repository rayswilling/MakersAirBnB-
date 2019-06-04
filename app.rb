require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/dreambnb'
require_relative './lib/user'
require_relative './lib/database_connection_setup'

class Dreambnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:signup)
  end

  post '/users' do
    if (User.first(email: params[:email]) == nil) && (params[:password] == params[:password_confirmation])
      User.create(:email => params[:email], :password => params[:password])
      redirect '/spaces'
    else
      flash[:notice] = 'Email in use'
      redirect '/'
    end
  end
end

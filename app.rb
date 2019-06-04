require 'sinatra/base'
require_relative './lib/dreambnb'
require_relative './lib/user'
require_relative './lib/database_connection_setup'

p ENV['RACK_ENV']

class Dreambnb < Sinatra::Base

    get '/' do
        "hello"
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
      @listings = Listing.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_until: params[:available_until])
      redirect '/spaces'
    end

    get '/spaces/new' do
      erb :new
    end
end

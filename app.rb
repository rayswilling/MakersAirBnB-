require 'sinatra/base'
require_relative './lib/dreambnb'
require_relative './lib/user'
require_relative './lib/database_connection_setup'

class Dreambnb < Sinatra::Base

    get '/' do 
        "hello"
        User.create(email:'yesssss@me.com', password: '123123123123')
        User.create(email:'yesadas@me.com', password: '123hey23123')
    end 
end 
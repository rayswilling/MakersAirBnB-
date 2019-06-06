require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './space'
require_relative './user'

class Request 
    include DataMapper::Resource

    property :id,                   Serial
    property :arrival_date,         Date, :required => true
    property :is_confirmed,         Boolean, :required => false

    belongs_to :user, :required => true
    belongs_to :space, :required => true
end
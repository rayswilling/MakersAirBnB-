require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './dreambnb'
require_relative './user'

class Request 
    include DataMapper::Resource

    property :id,                   Serial
    property :arrival_date,         Date
    # property :status,       String, default: 'Unconfirmed' # Required!

    belongs_to :user 
    belongs_to :listing
end
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './user'

class Space
  include DataMapper::Resource

  property :id,                  Serial
  property :name,                String, :required => true
  property :description,         String, :required => true
  property :price,               String, :required => true
  property :available_from,      DateTime, :required => true
  property :available_until,     DateTime, :required => true

  belongs_to :user, :required => true
  has n, :request
end

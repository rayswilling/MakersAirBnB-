require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './user'

class Listing
  include DataMapper::Resource

  property :prop_id,             Serial
  property :user_id,             String, :required => true  
  property :name,                String, :required => true  
  property :description,         String, :required => true 
  property :price,               String, :required => true 
  property :available_from,      DateTime      
  property :available_to,        DateTime 

  belongs_to :user, :required => false
end
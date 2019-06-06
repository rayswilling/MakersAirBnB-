require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './space'

class User
  include DataMapper::Resource

  property :id,             Serial
  property :email,          String, required: true
  property :password,       String, required: true

  has n, :space
  has n, :request

  def self.authenticate(email:, password:)
    User.first(email: email, password: password)
  end
end

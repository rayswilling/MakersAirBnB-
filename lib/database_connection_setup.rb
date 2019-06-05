require 'data_mapper'
require './lib/user'
require './lib/dreambnb.rb'

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(
    :default, 'postgres://:@localhost/dreambnb_test'
  )
else
  DataMapper.setup(
    :default, 'postgres://:@localhost/dreambnb'
  )
end

DataMapper.finalize
DataMapper.auto_upgrade!

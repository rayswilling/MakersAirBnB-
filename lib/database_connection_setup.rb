require 'data_mapper'
require './lib/user'

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

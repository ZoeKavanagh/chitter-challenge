require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :created_at, DateTime

  belongs_to :user
end

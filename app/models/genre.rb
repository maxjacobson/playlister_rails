class Genre < ActiveRecord::Base
  attr_accessible :name
  attr_accessor :songs
  def initialize
    @songs = []
  end
end

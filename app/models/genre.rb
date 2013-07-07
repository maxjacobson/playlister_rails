class Genre < ActiveRecord::Base
  attr_accessible :name
  attr_accessor :songs
  def initialize
    @songs = []
  end
  def add_song(song)
    song.genre_id = self.id
    @songs << song
    song.genre = self.name
  end
end

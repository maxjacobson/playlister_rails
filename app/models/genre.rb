class Genre < ActiveRecord::Base
  attr_accessible :name
  attr_accessor :songs
  def add_song(song)
    song.genre_id = self.id
    song.genre = self.name
    @songs ||= []
    @songs << song
  end
end

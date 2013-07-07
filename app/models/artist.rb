class Artist < ActiveRecord::Base
  attr_accessible :name
  attr_accessor :songs
  def initialize
    @songs = []
  end
  def add_song(song)
    song.artist_id = self.id
    song.artist = self.name
    @songs << song
  end
end

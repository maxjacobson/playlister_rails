class Artist < ActiveRecord::Base
  attr_accessible :name
  attr_accessor :songs
  def initialize
    @songs = []
  end
  def add_song(song)
    @songs << song
    song.artist_id = self.id
  end
end

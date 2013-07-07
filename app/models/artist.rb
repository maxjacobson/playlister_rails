class Artist < ActiveRecord::Base
  attr_accessible :name

  def songs
    Song.where(artist_id: self.id)
  end

  def genres
    self.songs.collect{ |song| song.genre }.uniq
  end

end

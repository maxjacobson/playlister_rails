class Genre < ActiveRecord::Base
  attr_accessible :name

  def songs
    Song.where(genre_id: self.id)
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

end

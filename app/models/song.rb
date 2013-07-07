class Song < ActiveRecord::Base
  attr_accessible :artist_id, :genre_id, :name
  attr_accessor :artist
  attr_reader :genre

  def genre=(genre)
    @genre_id = genre.id
    @genre = genre
    genre.songs << self
  end


end

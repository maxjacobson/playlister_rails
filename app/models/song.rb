require 'oembed'
class Song < ActiveRecord::Base
  attr_accessible :artist_id, :genre_id, :name

  # expects an artist object
  def add_artist(artist)
    self.artist_id = artist.id
  end

  # expects a string
  def artist_name=(artist_name)
    artist = Artist.find_by_name(artist_name) || Artist.create(name: artist_name)
    add_artist(artist)
  end

  # expects a genre object
  def add_genre(genre)
    self.genre_id = genre.id
  end

  # expects a string
  def genre_name=(genre_name)
    genre =  Genre.find_by_name(genre_name) || Genre.create(name: genre_name)
    add_genre(genre)
  end

  def artist
    Artist.find(self.artist_id)
  end

  def genre
    Genre.find(self.genre_id)
  end

  # why are these two methods here?
  # rails expected them because I used the
  # phrase "genre_name" in my new song form
  # hrm...
  def artist_name
    self.artist.name
  end
  def genre_name
    self.genre.name
  end

  def youtube_url
    id = YoutubeSearch.search("#{self.artist.name} - #{self.name}").first["video_id"]
    url = "http://www.youtube.com/watch?v=#{id}"
  end

  def embedcode
    OEmbed::Providers::Youtube.get(self.youtube_url).html
  end
end

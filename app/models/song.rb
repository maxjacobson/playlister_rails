require 'oembed'
class Song < ActiveRecord::Base
  attr_accessible :artist_id, :genre_id, :name

  def add_artist(artist)
    self.artist_id = artist.id
  end

  def add_genre(genre)
    self.genre_id = genre.id
  end

  def artist
    Artist.find(self.artist_id)
  end

  def genre
    Genre.find(self.genre_id)
  end

  def youtube_url
    id = YoutubeSearch.search("#{self.artist.name} - #{self.name}").first["video_id"]
    url = "http://www.youtube.com/watch?v=#{id}"
  end

  def embedcode
    OEmbed::Providers::Youtube.get(self.youtube_url).html
  end
end

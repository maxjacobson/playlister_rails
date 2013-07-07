class Song < ActiveRecord::Base
  attr_accessible :artist_id, :genre_id, :name
end

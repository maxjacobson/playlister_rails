# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

songs = Dir.entries("db/songs_data").delete_if{|str| str[0] == "."}
songs.each do |filename|

  artist_name = filename.split(" - ")[0]
  song_name = filename.split(" - ")[1].split("[")[0].strip
  genre_name = filename.split(" - ")[1].split(/\[|\]/)[1]

  artist = Artist.find_by_name(artist_name) || Artist.create(name: artist_name)
  genre = Genre.find_by_name(genre_name) || Genre.create(name: genre_name)
  song = Song.create(name: song_name)
  
  song.add_artist(artist)
  song.add_genre(genre)
  song.save
end
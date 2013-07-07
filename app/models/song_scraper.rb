class SongScraper

  def whee!
    songs = Dir.entries("db/songs_data").delete_if{|str| str[0] == "."}
    songs.each do |filename|

      artist_name = filename.split(" - ")[0]
      song_name = filename.split(" - ")[1].split("[")[0].strip
      genre_name = filename.split(" - ")[1].split(/\[|\]/)[1]

      artist = Artist.find_by_name(artist_name) || Artist.create(name: artist_name)
      song = Song.create(name: song_name)
      genre = Genre.find_by_name(genre_name) || Genre.create(name: genre_name)

      artist.add_song(song)
      genre.add_song(song)

      artist.save
      genre.save
      song.save
    end
  end

end

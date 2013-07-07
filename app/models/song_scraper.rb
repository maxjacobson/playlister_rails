class SongScraper

  def whee!
    songs = Dir.entries("db/data").delete_if{|str| str[0] == "."}
    songs.each do |filename|

      artist_name = filename.split(" - ")[0]
      song_name = filename.split(" - ")[1].split("[")[0].strip
      genre_name = filename.split(" - ")[1].split(/\[|\]/)[1]

      artist = Artist.find_by_name(artist_name) || Artist.new.tap{|a| a.name = artist_name}
      song = Song.new.tap{|s| s.name = song_name}
      genre = Genre.find_by_name(genre_name) || Genre.new.tap{|g| g.name = genre_name}

      song.genre = genre
      artist.add_song(song)

      artist.save
      genre.save
      song.save
    end
  end

end

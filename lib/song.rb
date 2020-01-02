require "pry"

class Song
  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end

    if genre != nil
     self.genre = genre
   end
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end


 def genre=(genre)
    @genre = genre
    genre.songs <<  self unless genre.songs.include?(self)
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song_name)
      song = Song.new(song_name)
      song.save
      song

  end


#  def self.find_by_name(song_name)
#    @@all.detect do |song| song.name == song_name
#    end
#   end

 # def self.find_or_create_by_name(song_name)
  #   find_by_name(song_name) || create(song_name)
  # end


  #pry(Song)> filename
  #  => "Thundercat - For Love I Come - dance.mp3"
  #pry(Song)> song = Song.new(filename.split(" - "))
  #  => #<Song:0x0000000002a23878 @name=["Thundercat", "For Love I Come", "dance.mp3"]>
  #[5] pry(Song)> song.name=(filename.split(" - ")[1])
  #  => "For Love I Come"

#   pry(Song)> song.name=(filename.split(" - ")[1])
#  "For Love I Come"
#  [6] pry(Song)> song
#  => #<Song:0x0000000002a23878 @name="For Love I Come">
#  [7] pry(Song)> song.name
#  => "For Love I Come"

  def self.new_from_filename(filename)
  file_parts =  filename.split(" - ")
  artist_name, song_name, genre_name = file_parts[0], file_parts[1], file_parts[2].gsub(".mp3", "")
#binding.pry
  artist = Artist.find_or_create_by_name(artist_name)
  genre = Genre.find_or_create_by_name(genre_name)
  Song.new(song_name, artist, genre)
  end




  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end



end

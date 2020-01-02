require_relative '../lib/concerns/findable.rb'

class Artist
 extend Concerns::Findable
 extend Concerns::Findable::ClassMethods
  attr_accessor :name
  attr_reader :songs, :genre
  @@all = []


  def initialize(name)
    @name = name
    @songs = []

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

  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    array = songs.collect do |song|
      song.genre
    end
        array.uniq
    end



end

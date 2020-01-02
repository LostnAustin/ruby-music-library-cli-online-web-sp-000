class MusicImporter

  attr_accessor :song, :genre, :artist, :path, :files
  @@all = []

  def initialize(path)
    @path = path
  #  @@all << path
  end

  def files
    full_filename = Dir[@path+"/*"]
    full_filename.collect {|filename| filename.split("/").last}
  end



  def import
    self.files.each do |filename|
      song = Song.create_from_filename(filename)
    end
  end



end

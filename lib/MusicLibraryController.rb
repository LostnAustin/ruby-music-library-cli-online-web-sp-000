class MusicLibraryController

  def initialize(path= "./db/mp3s")
  importer =  MusicImporter.new(path).import
  end

  def call
    a = ""
   until a == "exit"
     puts "Welcome to your music library!"
     puts "To list all of your songs, enter 'list songs'."
     puts "To list all of the artists in your library, enter 'list artists'."
     puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     puts "What would you like to do?"
     a = gets.strip

     case a
      when 'list artists'
       list_artist

      when 'list genres'
      list_songs_by_genre

      when 'list artist'
      list_songs_by_artist

      when 'list genre'
      list_genre

      when 'play song'
      play_song

      when 'list songs'
        list_songs
        end
      end
    end


    def list_songs
      Song.all.sort { |a, b| a.name <=> b.name }.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    def list_artists
        Artist.all.sort { |a, b| a.name <=> b.name }.each.with_index(1) do |artist, index|
          puts "#{index}. #{artist.name}"
        end
      end


    def list_genres
      Genre.all.sort { |a, b| a.name <=> b.name }.each.with_index(1) do |genre, index|
        puts "#{index}. #{genre.name}"
      end
    end


    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        response =  gets.chomp
       #binding.pry
        a = Artist.find_by_name(response)
        unless a == nil
          a.songs.sort  { |b, c| b.name <=> c.name }.each.with_index(1) do |song, index|
            puts "#{index}. #{song.name} - #{song.genre.name}"
          end
        end
      end


      def list_songs_by_genre
        puts "Please enter the name of a genre:"
        response =  gets.chomp
       #binding.pry
        a = Genre.find_by_name(response)
       unless a == nil
          a.songs.sort  { |b, c| b.name <=> c.name }.each.with_index(1) do |song, index|
            puts "#{index}. #{song.artist.name} - #{song.name}"
          end
        end
      end

      def play_song
        puts "Which song number would you like to play?"
          response = gets.chomp
          s = Song.all.sort { |a, b| a.name <=> b.name }[response.to_i - 1]
        if s != nil && response.to_i > 0
        puts "Playing #{s.name} by #{s.artist.name}"
        end
      end


end

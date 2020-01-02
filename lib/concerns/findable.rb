module Concerns::Findable


  module ClassMethods

  # def self.extended(base) #Hook
     #puts "#{base} has been extended by #{self}"
      #SOng has been extended by Findable::ClassMethods
    # base.class_variable_set(:@@all, [])
  #  end

    def find_by_name(name)
    #  binding.pry
      self.all.detect {|o| o.name == name}
      end
    end

    def find_or_create_by_name(song_name) #class method
    find_by_name(song_name) || create(song_name)
    end
  


end

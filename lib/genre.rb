class Genre 
  extend Concerns::Findable
  
  attr_accessor :name 
    attr_reader :songs
  
    @@all = []
    
    def initialize(name)
      @name = name
      save
    end
    
    def self.all
      @@all
    end
    
    def save
       self.class.all << self
    end
    
    def self. destroy_all
      self.all.clear
    end
    
    def self.create(name)
      genre = self.new(name)
      genre.save
      genre
    end
    
    # Or, as a one-liner:
    # new(name).tap{ |g| g.save }
  end

  def artists
    songs.collect{ |s| s.artist }.uniq
  end
end
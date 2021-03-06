class Song

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist= artist if artist 
        self.genre= genre if genre
        save
    end 

    def save 
       @@all << self
    end 

    def self.all
        @@all
    end

    def self.destroy_all 
        self.all.clear
    end

    def self.create(song_name)
        song = new(song_name)
        song.save
        song 
    end 

    def artist= (artist)
        @artist = artist 
     artist.add_song(self)
    end 

    def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include?(self)
    end

    def self.find_by_name(name)
        all.detect{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || create(name)
    end


end 
#learn
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        artist, song = filename.split(' - ')
        init_song = Song.new(song)
        init_song.artist_name = artist 
        init_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end
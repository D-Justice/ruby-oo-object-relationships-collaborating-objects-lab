class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end


    def self.all
        @@all
    end

    def songs
        Song.all.select {|instance| instance.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
       self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        @@all.find {|artist| artist.name == name}
    end

    def print_songs
        songs.each {|this| puts this.name}
    end
end
require 'pry'

class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @artist = artist
    @@all << self
  end

  def self.artist_name
    @artist
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    # binding.pry
    split_name = filename.split(" - ")
    song = self.new(split_name[1])
    artist = Artist.find_or_create_by_name(split_name[0])
    song.artist = artist
    artist.add_song(song)
    song
  end

  def artist_name(name)
    artist_name = name.to_s
    song = Artist.find_or_create_by_name(name)
    artist_name.song
    song
    # self.find_or_create_by_name(name)
  end


end

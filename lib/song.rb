class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(name)
    found = @@all.find do |song|
      song.name == name
    end
    found
  end
 
  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(string)
    song_info = string.sub! '.mp3', ''
    song_info = song_info.split(' - ')
    song, artist = song_info[1], song_info[0]
    addition = self.new
    addition.name, addition.artist_name = song, artist
    addition
  end

  def self.create_from_filename(string)
    @@all << new_from_filename(string)
  end
  
  def self.destroy_all
    @@all.clear
  end
end

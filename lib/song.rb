require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.new.save
  end

  def self.create_by_name(name)
    # song_instance = self.create
    # song_instance.name=(name)
    # song_instance
    self.create.tap { |song| song.name=(name) }
  end

  def self.new_by_name(name)
  #  song_instance = self.new

    self.new.tap { |song| song.name=(name)}
  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|instance| instance.name}
  end

  def save
    self.class.all << self
    self
  end

  def self.new_from_filename(file_name)
    array = file_name.split(" - ")
    new_song = new_by_name(array[1].gsub(".mp3",""))
    new_song.artist_name=(array[0])
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    self.all.clear
  end

end

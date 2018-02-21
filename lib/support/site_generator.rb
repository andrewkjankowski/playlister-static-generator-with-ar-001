require 'pry'

class SiteGenerator
  attr_accessor :rendered_path

  def initialize(path)
    @rendered_path = path
  end

  def build_index
    Dir.mkdir("#{@rendered_path}/") unless File.exists?("#{@rendered_path}/")
    index = File.open("#{@rendered_path}/index.html", 'w')
    renderer = ERB.new(File.read("./app/views/index.html.erb"))
    index.puts(renderer.result(binding))
    index.close
  end

  def build_artists_index
    Dir.mkdir("#{@rendered_path}/artists") unless File.exists?("#{@rendered_path}/artists")
    index = File.open("#{@rendered_path}/artists/index.html", 'w')
    renderer = ERB.new(File.read("./app/views/artists/index.html.erb"))
    index.puts(renderer.result(binding))
    index.close()
  end

  def build_artist_page
    Dir.mkdir("#{@rendered_path}/artists") unless File.exists?("#{@rendered_path}/artists")
    renderer = ERB.new(File.read("./app/views/artists/show.html.erb"))
    Artist.all.each do |artist|
      artist_page = File.open("#{@rendered_path}/artists/#{artist.to_slug}.html", 'w')
      artist_page.puts(renderer.result(binding))
      artist_page.close
    end
  end

  def build_genres_index
    Dir.mkdir("#{@rendered_path}/genres") unless File.exists?("#{@rendered_path}/genres")
    index = File.open("#{@rendered_path}/genres/index.html", 'w')
    renderer = ERB.new(File.read("./app/views/genres/index.html.erb"))
    index.puts(renderer.result(binding))
    index.close()
  end

  def build_genre_page
    Dir.mkdir("#{@rendered_path}/genres") unless File.exists?("#{@rendered_path}/genres")
    renderer = ERB.new(File.read("./app/views/genres/show.html.erb"))
    Genre.all.each do |genre|
      genre_page = File.open("#{@rendered_path}/genres/#{genre.to_slug}.html", 'w')
      genre_page.puts(renderer.result(binding))
      genre_page.close
    end
  end

  def build_songs_index
    Dir.mkdir("#{@rendered_path}/songs") unless File.exists?("#{@rendered_path}/songs")
    index = File.open("#{@rendered_path}/songs/index.html", 'w')
    renderer = ERB.new(File.read("./app/views/songs/index.html.erb"))
    index.puts(renderer.result(binding))
    index.close()
  end

  def build_song_page
    Dir.mkdir("#{@rendered_path}/songs") unless File.exists?("#{@rendered_path}/songs")
    renderer = ERB.new(File.read("./app/views/songs/show.html.erb"))
    Song.all.each do |song|
      song_page = File.open("#{@rendered_path}/songs/#{song.to_slug}.html", 'w')
      song_page.puts(renderer.result(binding))
      song_page.close
    end
  end
end
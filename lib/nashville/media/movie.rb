module Nashville
  class Movie < Entity(:movie)
    media :movie
    attributes :actor, :artist, :shortFilm, :producer, :rating, :director, :releaseYear, :featureFilm, :movieArtist, :movie, :description

    class Artist < Entity(:movieArtist)
    end
  end
end

module Nashville
  class ShortFilm < Entity(:shortFilm)
    media :shortFilm
    attributes :artist, :shortFilm, :description

    class Artist < Entity(:shortFilmArtist)
    end
  end
end

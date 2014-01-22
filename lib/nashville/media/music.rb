module Nashville
  class Music < Entity(:song)
    media :music
    attributes :mix, :artist, :composer, :album, :song

    class Artist < Entity(:musicArtist)
    end

    class Track < Entity(:musicTrack)
    end

    class Album < Entity(:album)
    end

    class Video < Entity(:musicVideo)
    end

    class Mix < Entity(:mix)
    end

    class Song < Entity(:song)
    end
  end
end

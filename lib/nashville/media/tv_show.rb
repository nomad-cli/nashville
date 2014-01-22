module Nashville
  class TV < Entity(:tvEpisode)
    media :tvShow
    attributes :tvEpisode, :show, :tvSeason, :description

    class Episode < Entity(:tvEpisode)
    end

    class Season < Entity(:tvSeason)
    end
  end
end

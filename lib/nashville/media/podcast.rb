module Nashville
  class Podcast < Entity(:podcast)
    media :podcast
    attributes :title, :language, :author, :artist, :keywords, :description

    class Author < Entity(:podcastAuthor)
    end
  end
end

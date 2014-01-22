module Nashville
  class AudioBook < Entity(:audiobook)
    media :audibook
    attributes :title, :author

    class Author < Entity(:audiobookAuthor)
    end
  end
end

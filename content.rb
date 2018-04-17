class Content
# Needs
# - title: string
# - genre: string
# - type: string video or audio

attr_reader :title, :genre, :type

    def initialize(title:, genre:, type:)
        @title = title
        @genre = genre
        @type = type
    end # initialize

end # def content
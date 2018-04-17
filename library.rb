class Library
# Needs
# - contents: array of instances of content class 

attr_accessor :contents

    def initialize
        @contents = [] 
    end # initialize

    def add_content(content)
        @contents << content
    end # def add_content(content)

    def find_content_by_title(title)
        title_found = false
        
        contents.each do |content|
            if content.title == title
                title_found = true
                puts "#{title} found"
            end # if content.title == title
        end # contents.each do |content|
        
        if title_found == false
            puts "#{title} not found"
        end # if title_found == false
    end # find_content_by_title(title)
        
    def list_contents_by_genre(genre)
        contents.each do |content|
            if content.genre == genre
                puts "#{content.title}"
                puts "#{content.genre}"
                puts "#{content.type}"
                puts ''
            end # if content.genre == genre
        end # contents.each do |content|
    end # list_contents_by_genre(genre)

    def list_contents_by_type(type)
        contents.each do |content|
            if content.type == type
                puts "#{content.title}"
                puts "#{content.genre}"
                puts "#{content.type}"
                puts ''
            end # if content.type == type
        end # contents.each do |content|
    end # list_contents_by_type(type)

    def list_library
        contents.each do |content|
            puts "#{content.title}"
            puts "#{content.genre}"
            puts "#{content.type}"
            puts ''
        end # contents.each do |content|
    end # list_library

end # def library
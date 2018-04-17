require 'date'

class Profile
    # - @account
    # - @first_name
    # - @last_name
    # - @date_of_birth
    # - @favorite_genre
    # - def country
    
    # To do
    # - @nick_name?

    attr_accessor :account # account
    attr_accessor :first_name # String
    attr_accessor :last_name # String
    attr_accessor :date_of_birth # Date
    attr_accessor :favorite_genre # String
    
    def country
        'Australia'
    end # def country
end # class Profile
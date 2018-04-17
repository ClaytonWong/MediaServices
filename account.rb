class Account
# - @email
# - @profiles

# To do
# - @credit_card
# - @password

    attr_accessor :email # String
    attr_accessor :profiles # Array of profiles
    attr_accessor :credit_card # Credit card
    attr_accessor :password # string

    # Constructor with blank array of profiles
    def initialize
        @profiles = []
    end # initialize

# can do
# .new
# .add_profile
# .add_remove_profile
    
    def add_profile(profile)
        # Push profile into end of profiles array
        @profiles << profile
    end # add_profile

end # class Account
require_relative 'service'
require_relative 'account'
require_relative 'profile'
require_relative 'credit_card'
require_relative 'library'
require_relative 'content'
require_relative 'menu'

# Create Netflix service
netflix = Service.new
netflix.name = 'Netflix'

# Make sample content
ace_ventura = Content.new(title: 'Ace Ventura', genre: 'Comedy', type:'Video')
expendibles = Content.new(title: 'Expendibles', genre: 'Action', type:'Video')

# Create library
netflix_lib = Library.new

# Add contents to Netflix library
netflix_lib.add_content(ace_ventura)
netflix_lib.add_content(expendibles)

# add Netfilx library to the Netflix service
netflix.add_library(netflix_lib)
main_menu(netflix) # Call up main menu

# 1. Create a new account from user input
# e.g.
# Enter your email:
# >
# Enter your first name:
# >
# Enter your last name:
# >
# Enter your date of birth:
# >

# 3. Add credit card to Account
# Hint: credit card will probably have its own class

# 4. List all the profiles for an account in a menu (e.g. lots of `puts`)
#puts "List of accounts:"

# 5. Add a password to Account
# 6. When running your app, show a menu with:
#     1. Create Account
#     2. Sign In
# 7 (was 2). Add a profile to an existing account (leave to later)
# 8. Add favorite genre to Profile
# 9. Add a class for content, and create a library (edited)
class Service
# Has
# - @Name e.g. Netflix
# - @Acconts
# - @Library

    attr_accessor :name # String
    attr_accessor :accounts # Array of accounts
    attr_accessor :library # Array of content(s)

    # Constructor with empty array of accounts    
    def initialize
        @accounts = []
    end # def initialize

    # e.g. netflix.welcome_message    
    def welcome_message
        #e.g. "Welcome to Netflix"
        "Welcome to #{self.name}"
    end # def welcome_message

# can do
# - .delete_account

    def add_account(account)
        # push account into end of accounts array
        @accounts << account
    end # def add_account

    def add_library(library)
        # Add library to service
        @library = library
    end # def add_library

    def find_account_for_email(email)
        # Hold the account with the specified email
        # We haven't found it yet so it start off as something
        
        found_account = nil

        # We loop through each account that we have
        @accounts.each do |account|
            
            # Check if this particular account has the specified email   
            if account.email == email
                # If so, we found the account
                found_account = account
            end # account.email == email

            return found_account
        end # @accounts.each do |account|
    end # def find_account_for_email(email)
end # class Service
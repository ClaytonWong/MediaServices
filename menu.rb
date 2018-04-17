require 'date'
require_relative 'service'
require_relative 'account'
require_relative 'profile'
require_relative 'library'
require_relative 'content'
require_relative 'credit_card'

def main_menu(service)
    loop do
        system 'clear' # Clear Screen
        
        # Display menu items
        puts service.welcome_message # Display service welcome message
        puts '1. Create Account'
        puts '2. Sign In'
        puts 'x Exit'

        # Ask user for choice
        puts 'Enter a choice:'
        print '>'
        main_choice = gets.strip # get main_choice

        # Perform action based on user choice
        case main_choice
        when '1'
            # Create account
            sign_up_account(service) # call sign up account
            puts "Account created"
            sleep 1

            puts "Lets add a credit card to the account."
            puts 'Enter Credit card name: e.g. Master Card'
            card_name = 'Master Card' #gets.capitalise.strip
            puts 'Enter card holder name:'
            holder_name = 'C W'#gets.capitalise.strip 
            puts 'Enter credit card number'
            number = '1'#gets.strip
            puts 'Enter card cvv:'
            cvv = '2'#gets.strip        
            puts 'Enter card expiry date:'
            exp_date = '2018-1-1'#gets.strip

            credit_card_new = Credit_card.new(card_name: card_name, holder_name: holder_name, number: number, cvv: cvv, exp_date: exp_date)
            service.accounts.last.credit_card = credit_card_new
            puts "Account updated with credit card details"
            sleep 1
                
        when '2'
            # Sign In
            account = sign_into_account(service)
                
            # Unless account does not exist or no accounts created
            unless account == nil || service.accounts.inspect == '[]'
                puts "Welcome #{account.email}"
                signed_in = true
                while signed_in == true
                    system 'clear' # Clear Screen
                    # Ask user to make a choice
                    puts 'Choose an action:'
                    puts '1. Add a new profile'
                    puts '2. Go to choose profile'
                    puts 's. Sign Out'
                    puts ''
                    puts 'Enter a choice:'
                    print '>'
                    profile_action_choice = gets.strip # get profile_action_choice
                                            
                    # Perform profile_related action based on user input
                    case profile_action_choice
                    when '1'
                        # Add new profile
                        puts "first_name"
                        first_name = 'Sam'#gets.strip

                        puts "last_name"
                        last_name = 'Sample'#gets.strip

                        puts "Date of birth"
                        date_of_birth = '1973, 7, 20' #Date.parse(gets.strip)
                        new_profile = Profile.new
                        new_profile.account = account # Link the current account to the new profile
                        new_profile.first_name = first_name 
                        new_profile.last_name = last_name 
                        new_profile.date_of_birth = date_of_birth 
                            
                        # add profile to current account
                        account.add_profile(new_profile)
                        puts "Profile for #{first_name} created"
                        sleep 1
                    when '2'
                        profile_num = choose_profile(account)
                        puts "Profile #{profile_num} chosen"
                        sleep 1
                        if account.profiles[profile_num].favorite_genre == nil
                            puts 'Lets add a favorite genre to your profile, please type in your favorite genre:'
                            favorite_genre = 'Comedy'#gets.strip
                            account.profiles[profile_num].favorite_genre = favorite_genre
                        end # if account.profiles[profile_num].favorite_genre == nil
                        puts "Favorite genre is: #{account.profiles[profile_num].favorite_genre}"
                        sleep 1
                                
                        profile_chosen = true
                        while profile_chosen == true
                            system 'clear' # Clear Screen
                            # Ask user to make a choice
                            puts 'Choose an action:'
                            puts '1. Search for a title'
                            puts '2. List all content in a genre'
                            puts '3. List all content of one type'
                            puts '4. List entire library'
                            puts 'b. Go back to previous menu'
                            puts 's. Sign Out'
                            puts ''
                            puts 'Enter a choice:'
                            print '>'
                            current_profile_choice = gets.strip # get profile_action_choice
                                    
                            case current_profile_choice
                            when '1'
                                puts 'Give title you want to search for:'
                                title = 'Fist Of Fury'#gets.strip
                                puts title
                                service.library.find_content_by_title(title)
                                sleep 1
                            when '2'
                                puts 'Give genre you want to list:'
                                genre = 'Action'#gets.strip
                                puts genre
                                service.library.list_contents_by_genre(genre)
                                sleep 1
                            when '3'
                                puts 'Give type you want to list:'
                                type = 'Video'#gets.strip
                                puts type
                                service.library.list_contents_by_type(type)
                                sleep 1
                            when '4'
                                puts 'This is the entire library for this service:'
                                puts ''    
                                service.library.list_library
                                sleep 1
                            when 'b' || 'B'
                                profile_chosen = false # Takes user back to previous menu
                            when 's' || 'S'
                                profile_chosen = false # Escape from profile_chosen while loop
                                signed_in = false # Escape from signed_in while loop to sign out
                            else # Go back to menu that lets user choose action for current profile
                                puts "Invalid choice entered, choice was #{current_profile_choice}"
                                sleep 1
                            end # case current_profile_choice
                        end # while profile_chosen == true
                    
                    when 's' || 'S'
                        # Sign Out and go back to previous menu
                        signed_in = false
                        puts 'Signing out'
                        sleep 1
                    else # Go back to menu that lets user create profiles
                        puts "Invalid choice entered, choice was #{profile_action_choice}"
                        sleep 1
                    end # case profile_action_choice
                end # while signed_in == true
            end # unless account == nil || service.accounts.inspect == '[]'
            
        when 'x' || 'X'
            # Exit
            puts "Exiting #{service.name}"
            sleep 1
            break
        else # Go back to menu that lets user exit service
            puts "Invalid choice entered choice was #{main_choice}"
            sleep 1
        end # case main_choice
    end # Loop do
end # Def main menu

def sign_up_account(service)
    puts "Email"
    email = 'c@c.com'#gets.strip

    puts "Password"
    password = '1'#gets.strip

    puts "first_name"
    first_name = 'C' #gets.strip

    puts "last_name"
    last_name = 'W'#gets.strip

    puts "Date of birth"
    date_of_birth = '1-1-1'#Date.parse(gets.strip)

    new_account = Account.new
    new_account.email = email
    new_account.password = password

    new_profile = Profile.new
    new_profile.account = new_account # Link the new account to the new profile
    new_profile.first_name = first_name
    new_profile.last_name = last_name
    new_profile.date_of_birth = date_of_birth

    # Push newly created profile into profiles array for new account
    new_account.profiles << new_profile 

    # add new account to service
    service.add_account(new_account)
end # def sign_up_account(service)

def sign_into_account(service)
    system 'clear'
    
    account = nil
    
    puts 'Enter email:'
    email = gets.strip#'c@c.com'
    
    account = service.find_account_for_email(email)
    
    if account == nil
        puts "No account found for email: #{email}"
        puts 'Please create an account before attempting to sign in'
        sleep 3
    elsif service.accounts.inspect == '[]'
        puts "No account found for email: #{email}"
        puts 'No accounts created for current service.'
        puts 'Please create an account before attempting to sign in'
        sleep 3
    else
        # We have an account, now ask for a password
        get_password = true
        while get_password == true
            puts "Enter password"
            password = gets.strip
            
            if account.password == password # Password is correct
                get_password = false # Escape from while get_password == true loop
            else # Password was wrong
                # Wait for valid decision from user regarding wether to retype
                # password
                valid_retype_decision = false
                while valid_retype_decision == false
                    system 'clear' # Clear screen
                    puts 'Password incorrect. Do you want to retype password?'
                    puts 'Please choose y for yes or n for no.'
                    print '>'
                    retype_ps = gets.downcase.strip
                    case retype_ps
                    when 'y'
                        # Escape from while valid_retype_decision == false loop
                        valid_retype_decision = true 
                    when 'n'
                        # Escape from while valid_retype_decision == false loop
                        # as well as while get_password == true loop
                        valid_retype_decision = true
                        get_password = false
                    else # Get user to make decision regarding retyping password
                        puts "Invalid choice. choice was #{retype_ps}"
                        sleep 1
                    end # case retype_ps
                end # while valid_retype_decision == false
            end # if account.password == password
        end # while get_password == true
    end
    system 'clear'

    # If password was wrong and user does not want to retype password,
    # let account be nil again so you can go back to main menu after
    # sign_in_account method returns
    account = nil if retype_ps == 'n'

    account # Return account   

end # def sign_in_account

# challenge
def choose_profile(account)
    # Ask user to choose from a list of profiles 
    puts "Choose a profile:"
    index = 0 # Start at first profile
    # Loop through profiles show each index & first_name
    account.profiles.each do |profile|
        puts "#{index} #{profile.first_name}"
        index = index + 1
    end # account.profiles.each do |profile|

    print ':'
    choice = gets.strip.to_i
end # choose_profile
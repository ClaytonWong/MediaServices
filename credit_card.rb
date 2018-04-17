class Credit_card
# Has
# - @card_name
# - @holder_name
# - @number
# - @cvv
# - @exp_date

    attr_accessor :card_name # String
    attr_accessor :holder_name # String
    attr_accessor :number # Integer
    attr_accessor :cvv # Int 
    attr_accessor :exp_date # Date (Expiry date)

    def initialize(card_name: , holder_name: , number: , cvv: , exp_date:)
        @card_name = card_name
        @holder_name = holder_name
        @number = number
        @cvv = cvv
        @exp_date = exp_date
    end # initialize
end # class Credit_card
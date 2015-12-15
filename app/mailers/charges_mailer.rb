class ChargesMailer < ApplicationMailer
    default from: "The Strength Gods at Strong Hands"
    
    def new_purchase(email, name) 
        @email = email
        @name = name
        mail(to: @email, subject: "Thanks for your Order!")
        
    end
end

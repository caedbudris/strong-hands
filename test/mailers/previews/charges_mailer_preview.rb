# Preview all emails at http://localhost:3000/rails/mailers/charges_mailer
class ChargesMailerPreview < ActionMailer::Preview
    
    # Preview this email at
    #https://strong-hands-caedbudris.c9users.io/rails/mailers/charges_mailer/new_purchase
    def new_purchase
        ChargesMailer.new_purchase('example@example.com', 'Example' )
    end

end

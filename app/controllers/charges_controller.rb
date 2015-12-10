class ChargesController < ApplicationController
    
    def new
    end

    def create
        @amount = params[:amount] * 10 * 100
        
        token = params[:stripeToken]
        
        charge = Stripe::Charge.create(
            amount: @amount,
            currency: 'usd',
            source: token,
            description: 'Barbell Balm'
        )
        
        rescue Stripe::CardError => e
    end
    
end

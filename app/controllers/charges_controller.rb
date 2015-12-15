class ChargesController < ApplicationController
    
    def new
    end

    def create
        Stripe.api_key = 'sk_test_Y9NoxWG9yoghPgHeP7lZdB6P'
        
        @quantity = order_params[:amount].to_i * 10
        
        @email = order_params[:email]
        
        @name = order_params[:name]
        
        @shipping = order_params[:shipping]
        if @shipping == "United States"
            @quantity = @quantity + 3
        elsif @shipping == "Canada"
            @quantity = @quantity + 10
        end
        
        amount =  @quantity * 100
            
        token = order_params[:stripeToken]
        
        charge = Stripe::Charge.create(
            :amount => amount,
            :currency => 'usd',
            :source => token,
            :description => 'Barbell Balm'
        )
        
        rescue Stripe::CardError => e
        
        ChargesMailer.new_purchase(@email, @name).deliver_now
    end
    
    protected
        
        def order_params
            params.permit(:stripeToken, :amount, :shipping, :email, :name) 
        end
end

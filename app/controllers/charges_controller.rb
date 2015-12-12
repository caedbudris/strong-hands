class ChargesController < ApplicationController
    
    def new
    end

    def create
        @quantity = order_params[:amount].to_i * 10
        
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
    end
    
    protected
        
        def order_params
            params.permit(:stripeToken, :amount, :shipping) 
        end
end

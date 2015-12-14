class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  
  before_action :set_device
  
  private
    
    def set_device
      request.variant = :phone if browser.mobile?
    end
  
  #protect_from_forgery
  #skip_before_action :verify_authenticity_token, if: :json_request?

  #protected

    #def json_request?
      #request.format.json?
    #end
  
end

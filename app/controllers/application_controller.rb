class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  
  #protect_from_forgery
  #skip_before_action :verify_authenticity_token, if: :json_request?

  #protected

    #def json_request?
      #request.format.json?
    #end
  
end

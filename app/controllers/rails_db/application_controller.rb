module RailsDb
  class ApplicationController < ActionController::Base
    helper :all
    helper_method :per_page

    before_action :verify_access

    if RailsDb.http_basic_authentication_enabled
      http_basic_authenticate_with name: RailsDb.http_basic_authentication_user_name,
                                   password: RailsDb.http_basic_authentication_password
    end

    private

    def verify_access
      puts '5. Starting verify_access'
      begin
        result = RailsDb.verify_access_proc.call(self)
        puts "6. verify_access result: #{result}"
        redirect_to('/', error: 'Access Denied', status: 401) unless result
      rescue => e
        puts "7. Error in verify_access: #{e.message}"
        puts e.backtrace
        raise
      end
    end

    def per_page
      params[:per_page] || session[:per_page]
    end

  end
end


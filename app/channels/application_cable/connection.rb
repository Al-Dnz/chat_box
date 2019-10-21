module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user_token

    def connect
      self.current_user_token = find_verified_user_token
    end

    private

    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end

    def find_verified_user_token
      if session && session['token']
        session['token']
      else
        reject_unauthorized_connection
      end
    end

  end
end

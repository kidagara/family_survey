class User < ActiveRecord::Base
  module Authentication
    extend ActiveSupport::Concern

    included do
      before_create { generate_token :auth_token }
    end

    module ClassMethods
      def from_omniauth(auth)
        find_by(provider: auth["provider"], uid: auth["uid"]) || create_with_omniauth(auth)
      end

      def create_with_omniauth(auth)
        create! do |user|
          user.provider = auth["provider"]
          user.uid = auth["uid"]
          user.first_name = auth["info"]["first_name"]
          user.last_name = auth["info"]["last_name"]
          user.email = auth["info"]["email"]
        end
      end
    end

    private

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
  end
end

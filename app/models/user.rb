class User < ActiveRecord::Base
  has_secure_password

  # def to_token_payload
  #   {
  #       id: id,
  #       email: email
  #   }
  # end
end

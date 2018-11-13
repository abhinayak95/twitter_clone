class User < ActiveRecord::Base
  has_secure_password
  has_one :profile
  has_many :tweet
  validates :email, presence: true
  # def to_token_payload
  #   {
  #       id: id,
  #       email: email
  #   }
  # end
end

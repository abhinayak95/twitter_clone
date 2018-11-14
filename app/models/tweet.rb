class Tweet < ActiveRecord::Base
  validates :tweet, length: { maximum: 500 }, presence: true
  has_many :likes
  belongs_to :user
end

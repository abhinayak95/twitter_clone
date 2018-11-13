class Tweet < ActiveRecord::Base
  validates :tweet, length: { maximum: 500 }, presence: true
  belongs_to :user
end

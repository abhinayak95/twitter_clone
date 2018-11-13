class Tweet < ActiveRecord::Base
  validates :tweet, length: { maximum: 500 }, presence: true
end

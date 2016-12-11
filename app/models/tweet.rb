class Tweet < ActiveRecord::Base
  validates :contents, presence: true
  validates :contents, length: { maximum: 10 }
end

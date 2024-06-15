class Award < ApplicationRecord
  validates :award_name, :title, :body, presence: true
  validates :award_name, length: { maximum: 255 }
  validates :title, :body, length: { maximum: 3000 }
  belongs_to :user
end

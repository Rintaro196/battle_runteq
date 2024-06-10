class Award < ApplicationRecord
  validates :award_name, :title, :body, presence: true
end

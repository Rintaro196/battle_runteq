class Award < ApplicationRecord
  mount_uploader :image, AwardImageUploader  # ここで紐づけを行います
  
  validates :award_name, :title, :body, presence: true
  validates :award_name, length: { maximum: 255 }
  validates :title, :body, length: { maximum: 3000 }
  belongs_to :user
end

class Book < ApplicationRecord
  belongs_to :user
  attachment :profilr_image
  has_one_attached :image
  
end

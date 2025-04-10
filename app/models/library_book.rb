class LibraryBook < ApplicationRecord
  belongs_to :library
  has_many :rentals
  
  validates :title, presence: true
  validates :library_id, presence: true
  
  scope :available, -> { where(is_available: true) }
  
end

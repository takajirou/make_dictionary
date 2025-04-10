class LibraryBook < ApplicationRecord
  belongs_to :library
  has_many :rentals
  
  validates :title, presence: true
  validates :library_id, presence: true
  
  scope :available, -> { where(is_available: true) }
  
  def self.ransackable_associations(auth_object = nil)
    ["library", "rentals"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["author", "created_at", "description", "id", "is_available", "isbn", "library_id", "title", "updated_at"]
  end
end

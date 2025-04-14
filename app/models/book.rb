class Book < ApplicationRecord
  belongs_to :library
  has_many :rentals, dependent: :destroy
end

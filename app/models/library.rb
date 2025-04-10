class Library < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :books, dependent: :destroy
  has_many :library_members, dependent: :destroy
  has_many :members, through: :library_members, source: :user
  
  validates :name, presence: true
end

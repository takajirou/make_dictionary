class Library < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :books, dependent: :destroy
  has_many :library_members, dependent: :destroy
end

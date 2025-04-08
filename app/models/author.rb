class Author < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
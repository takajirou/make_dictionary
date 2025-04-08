class BookAuthor < ApplicationRecord
  belongs_to :book
  belongs_to :author
  def self.ransackable_associations(auth_object = nil)
    ["author", "book"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["author_id", "book_id", "created_at", "id", "updated_at"]
  end
end
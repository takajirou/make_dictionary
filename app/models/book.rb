class Book < ApplicationRecord
  # belongs_to :user
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  
  # save_with_authorメソッドの実装
  def save_with_author(author_names)
    return false unless save
    
    author_names.each do |name|
      next if name.blank?
      author = Author.find_or_create_by(name: name)
      self.book_authors.create(author_id: author.id)
    end
    true
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "image_link", "info_link", "published_date", "systemid", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["authors", "book_authors", "user"]
  end
end
class Book < ApplicationRecord
  belongs_to :user
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
end
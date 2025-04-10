class Library < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :books, dependent: :destroy
  has_many :library_members, dependent: :destroy
  has_many :members, through: :library_members, source: :user
  
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "owner_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["books", "library_members", "members", "owner"]
  end
end

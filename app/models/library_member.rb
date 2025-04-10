class LibraryMember < ApplicationRecord
  belongs_to :user
  belongs_to :library

  validates :user_id, presence: true, uniqueness: { scope: :library_id }
  validates :library_id, presence: true
  validates :role, inclusion: { in: %w(member admin) }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "joined_at", "library_id", "role", "updated_at", "user_id"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["library", "user"]
  end
end

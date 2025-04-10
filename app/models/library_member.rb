class LibraryMember < ApplicationRecord
  belongs_to :user
  belongs_to :library

  validates :user_id, presence: true, uniqueness: { scope: :library_id }
  validates :library_id, presence: true
  validates :role, inclusion: { in: %w(member admin) }
end

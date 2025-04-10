class User < ApplicationRecord
  has_many :libraries, foreign_key: :owner_id, dependent: :destroy
  has_many :library_memberships, class_name: 'LibraryMember', dependent: :destroy
  has_many :member_libraries, through: :library_memberships, source: :library
  has_many :rentals
  has_many :borrowed_books, through: :rentals, source: :book

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :active, -> { where(deleted_at: nil) }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "id_value", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
end

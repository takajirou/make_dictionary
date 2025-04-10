class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :due_date, presence: true
  
  before_create :mark_book_as_unavailable
  before_update :update_book_availability, if: :returned_at_changed?
  
  scope :active, -> { where(returned_at: nil) }
  scope :overdue, -> { active.where('due_date < ?', Date.today) }
  
  private
  
  def mark_book_as_unavailable
    book.update(is_available: false)
  end
  
  def update_book_availability
    if returned_at.present?
      book.update(is_available: true)
    end
  end
end

class LibraryMember < ApplicationRecord
  belongs_to :user
  belongs_to :library
end

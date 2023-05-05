class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :book_comments

end

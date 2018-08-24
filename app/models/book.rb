class Book < ApplicationRecord

  belongs_to :user

  validates :book_title, presence: true
  validates :book_opinion, presence: true
  validates :book_title, length: { maximum: 200 }
  validates :book_opinion, length: { maximum: 200 }
end

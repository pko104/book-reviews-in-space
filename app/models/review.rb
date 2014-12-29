class Review < ActiveRecord::Base
  belongs_to :book
  has_many :users, through: :book
  validates :description, length: {minimum: 50}
end

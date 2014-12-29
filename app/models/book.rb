class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates :title, length: {minimum: 1}
  validates :description, length: {minimum: 10}
  validates :url, presence: true
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :placement

  validates :body, :user, presence: true
end

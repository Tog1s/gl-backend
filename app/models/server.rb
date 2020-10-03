class Server < ApplicationRecord
  belongs_to :user
  validates :user, :url, presence: true
  validates :url, uniqueness: true
end

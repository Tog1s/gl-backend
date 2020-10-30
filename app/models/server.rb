class Server < ApplicationRecord
  belongs_to :user

  # has_many :counters
  
  validates :user, :url, presence: true
  validates :url, uniqueness: true
end

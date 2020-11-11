class Garden < ApplicationRecord
  has_many :plants, dependent: :destroy

  validates :name, :banner_url, presence: true
end

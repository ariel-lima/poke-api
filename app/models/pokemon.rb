class Pokemon < ApplicationRecord
  validates :name, :api_id, presence: true
  validates :api_id, uniqueness: true

  serialize :types, Array
end

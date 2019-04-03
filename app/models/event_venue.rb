class EventVenue < ApplicationRecord
  validates :name, length: { minimum: 20 }
  validates :capacity, length: { minimum: 1 }
end

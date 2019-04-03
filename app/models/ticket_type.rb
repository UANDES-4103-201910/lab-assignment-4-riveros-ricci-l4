class TicketType < ApplicationRecord
  belongs_to :event
  belongs_to :ticket_zone

  validates :price, length: { minimum: 1 }
end

class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  before_save :prevent_creation_after_start_date, on: :create
  before_save :prevent_selling_expired_ticket

  private

  def prevent_creation_after_start_date
    associated_event = TicketType.where(id: ticket_type_id)
    result = Event.select(:start_date).where(id: associated_event[0]['id']) unless associated_event.nil?
    if !result.nil? && !result[0].nil? && Date.today > result[0]['start_date']
      throw :abort
    end
  end

  def prevent_selling_expired_ticket
    puts 'TEST'
  end
end

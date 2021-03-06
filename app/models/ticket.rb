class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  before_save :prevent_creation_after_start_date, on: :create
  before_save :prevent_selling_expired_ticket, on: :update

  private

  def prevent_creation_after_start_date
    associated_event = TicketType.where(id: ticket_type_id)
    result = !associated_event.nil? ? Event.select(:start_date).where(id: associated_event[0]['id']) : nil
    if !result.nil? && !result[0].nil? && Date.today > result[0]['start_date']
      throw :abort
    end
  end

  def prevent_selling_expired_ticket
    associated_event = TicketType.where(id: ticket_type_id)
    result = !associated_event.nil? ? Event.select(:start_date).where(id: associated_event[0]['id']) : nil
    if !result.nil? && !result[0].nil? && Date.today > result[0]['start_date']
      throw :abort
    end
  end # Same as prevent creation?
end

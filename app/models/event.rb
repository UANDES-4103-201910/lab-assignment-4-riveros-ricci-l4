class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types

  validate :start_date_cannot_be_in_the_past

  private

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def no_two_events_with_same_start_date
    if start_date.present? && Event.where(event_venue_id: event_venue_id).select("start_date").include?(start_date)
      errors.add(:start_date, "There's another event in that date")
    end
  end
end

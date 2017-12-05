class Table < ApplicationRecord
  MAXIMUM_NUMBER_OF_BOOKINGS = 3
  MAXIMUM_NUMBER_OF_TABLES = 4

  scope :booked_count, -> { where(is_booked: true).count }

  belongs_to :hall

  validate :check_total_number_of_tables_in_hall, on: :create
  validate :check_booking_limit

  def check_total_number_of_tables_in_hall
    errors.add(:base, "A hall cannot have more than #{MAXIMUM_NUMBER_OF_TABLES} tables") if hall.tables.count == MAXIMUM_NUMBER_OF_TABLES
  end

  def check_booking_limit
    return if !is_booked || ((hall.tables.booked_count < (hall.tables.count / 2)) && Table.booked_count < MAXIMUM_NUMBER_OF_BOOKINGS)

    errors.add(:base, 'Booking limit reached')
  end

  def book
    update is_booked: true
  end

  def release
    update is_booked: false
  end

  def status
    is_booked ? 'BOOKED' : 'AVAILABLE'
  end
end

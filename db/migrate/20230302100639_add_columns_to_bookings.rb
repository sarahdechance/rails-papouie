class AddColumnsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user, null: false, foreign_key: true
    add_reference :bookings, :offer, null: false, foreign_key: true
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
    add_column :bookings, :total_price, :integer
    add_column :bookings, :status, :string
  end
end

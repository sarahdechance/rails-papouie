class AddAvailabilityToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :availability, :boolean
  end
end

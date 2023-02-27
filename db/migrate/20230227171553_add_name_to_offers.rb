class AddNameToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :name, :string
  end
end

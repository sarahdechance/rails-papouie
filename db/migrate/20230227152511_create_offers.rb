class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.integer :hourly_price
      t.datetime :availability_start
      t.datetime :availability_end
      t.integer :latitude
      t.integer :longitude
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

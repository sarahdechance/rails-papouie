class ChangeLongitudeLatitudeToFloatToOffer < ActiveRecord::Migration[7.0]
  def change
    change_column :offers, :latitude, :float
    change_column :offers, :longitude, :float
  end
end

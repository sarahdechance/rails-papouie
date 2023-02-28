class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :pseudo, :string
    add_column :users, :phone_number, :string
    add_column :users, :birth_date, :date
    add_column :users, :description, :string
  end
end

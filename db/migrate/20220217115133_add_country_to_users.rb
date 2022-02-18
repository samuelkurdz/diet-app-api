class AddCountryToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :country
  end
end

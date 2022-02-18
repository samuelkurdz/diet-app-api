class RemoveCountryFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :country, :integer
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :userName
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password
      t.integer :country

      t.timestamps
    end
  end
end

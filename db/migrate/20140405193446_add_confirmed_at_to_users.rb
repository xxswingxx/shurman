class AddConfirmedAtToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :confirmed_at, :datetime
  	add_index :users, :email, unique: true
  end
end

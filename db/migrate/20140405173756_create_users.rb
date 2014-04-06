class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.text :confirmation_token

      t.timestamps
    end
    add_index :users, :confirmation_token, unique: true
  end
end

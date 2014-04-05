class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.text :confirmation_token

      t.timestamps
    end
  end
end

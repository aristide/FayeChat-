class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :code
      t.string :password
      t.string :name
      t.boolean :is_connected, :default => false
      t.datetime :connected_at

      t.timestamps
    end
  end
end

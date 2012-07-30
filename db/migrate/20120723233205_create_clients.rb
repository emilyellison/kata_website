class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :item
      t.float :cost
      t.integer :client_id
      t.string :status, default: 'Failed'

      t.timestamps
    end
  end
end
